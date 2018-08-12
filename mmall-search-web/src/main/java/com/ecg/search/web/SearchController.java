package com.ecg.search.web;

import com.ecg.common.jedis.JedisClient;
import com.ecg.search.pojo.dto.SearchResult;
import com.ecg.search.pojo.vo.SearchProductVo;
import com.ecg.search.service.SearchService;
import com.ecg.utils.PropKit;
import com.ecg.utils.StrKit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈搜索的控制层〉
 *
 * @author wq
 * @create 2018/8/5 0005
 * @since 1.0.0
 */
@Controller
public class SearchController {

    @Autowired
    private SearchService searchService;

    @RequestMapping(value = "/searchProduct",method = RequestMethod.GET)
    public String searchProduct(String keyWord,@RequestParam(defaultValue = "")String uname, @RequestParam(defaultValue = "1")int pageIndex,Model model){
        if(StrKit.notBlank(keyWord)){
            //关键词不为空
            //拿到每页的数量
            int pageSize = PropKit.use("file.properties").getInt("search.pagesize");
            //去服务层执行查询
            SearchResult<SearchProductVo> result = searchService.searchProduct(keyWord,pageIndex,pageSize);
            //放入request中
            model.addAttribute("list",result.getList());
            List<SearchProductVo> list = result.getList();
            List<String> la = new ArrayList<>();
            for (SearchProductVo sp: list) {
                String image = sp.getImage();
               if(image.contains(",")) {
                   String[] strings = image.split(",");
                   for (String s: strings) {
                       la.add(s);
                   }
               }else {
                   la.add(image);
               }
            }
            model.addAttribute("image", la);
            model.addAttribute("keyWord", keyWord);
            if(StrKit.notBlank(uname)){
                model.addAttribute("user",uname);
            }
        }
       //转发到主界面
        return "searchindex";
    }
}