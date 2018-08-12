<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>商品列表-后台管理系统-Admin 1.0</title>
    <meta name="Description" content="基于layUI数据表格操作"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <%--<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/itemlist.js" charset="utf-8"></script>--%>

    <!--<script type="text/javascript" src="../../static/js/admin.js"></script>-->
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/html" id="caozuo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="view">查看</a>
    </script>
    <script type="text/html" id="title">
        <a href="{:url('Index/Goods/view')}?pid={{d.pid}}" class="layui-table-link" target="_blank">{{ d.title }}</a>
    </script>
    <script type="text/html" id="zhuangtaiTpl">
        <input type="checkbox" name="pstatus" id="{{d.pid}}" value="{{d.zhuangtai}}" lay-skin="switch" lay-text="在售|下架" lay-filter="zhuangtai" {{ d.pstatus == '1' ? 'checked' : '' }}>
    </script>
    <script type="text/html" id="tuijian">
        <input type="checkbox" name="ishot" id="{{d.pid}}" value="{{d.istuijian}}" lay-skin="switch" lay-text="是|否" lay-filter="tuijian" {{ d.ishot == '1' ? 'checked' : '' }}>
    </script>

    <style type="text/css">
        .layui-form-switch {
            width: 55px;
        }

        .layui-form-switch em {
            width: 40px;
        }

        .layui-form-onswitch i {
            left: 45px;
        }

        body {
            overflow-y: scroll;
        }
    </style>
</head>

<body>
<div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">商品管理</a>
        <a>
          <cite>商品列表</cite></a>
      </span>
    <div class="layui-btn-group acFroTable layui-layout-right">
        <button class="layui-btn" data-type="getAdd"><i class="layui-icon">&#xe654;</i></button>
        <button class="layui-btn" data-type="getDelData"><i class="layui-icon">&#xe640;</i></button>
        <button class="layui-btn" data-type="getRefresh">刷新</button>
    </div>
</div>
<div class="weadmin-body">
    <div class="layui-row">
       <%-- <form id="searchForm" class="layui-form layui-form-pane">
            <div class="layui-inline">
                <label class="layui-form-label">品名</label>
                <div class="layui-input-inline" style="width: 150px;">
                    <input type="text" name="pname" class="layui-input" placeholder="请输入关键字">
                </div>
            </div>
            <div class="layui-inline">
                <div class="layui-input-inline" style="width: 150px;">
                    <input type="text" name="pid" class="layui-input" placeholder="产品编码">
                </div>
            </div>
            <div class="layui-inline">
                <div class="layui-input-inline" style="width: 150px;">
                    <select name="hid" multiple="multiple" lay-seach>
                        <option value="">类别</option>
                        {volist name=":ShowList('ww_category','pid=2','seq')" id="vo"}
                        <option value="{$vo.id?? ''}">{$vo.catename}</option>
                        {/volist}
                    </select>
                </div>
            </div>
            &lt;%&ndash;<div class="layui-inline">
                <div class="layui-input-inline" style="width: 150px;">
                    <select name="ishot" multiple="multiple" lay-seach>
                        <option value="">热门</option>
                        {volist name=":ShowList('ww_erp_gys','','id')" id="vo"}
                        <option value="{$vo.id?? ''}">{$vo.title?? ''}</option>
                        {/volist}
                    </select>
                </div>
            </div>&ndash;%&gt;

            <div class="layui-inline">
                <label class="layui-form-label">价格范围</label>
                <div class="layui-input-inline" style="width: 100px;">
                    <input type="text" name="price_min" placeholder="￥" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">-</div>
                <div class="layui-input-inline" style="width: 100px;">
                    <input type="text" name="price_max" placeholder="￥" autocomplete="off" class="layui-input">
                </div>
            </div>

            &lt;%&ndash;<div class="layui-inline">
                <div class="layui-input-inline" style="width: 150px;">
                    <select name="pstatus" lay-seach>
                        <option value="">状态</option>
                        {volist name=":ShowList('ww_shop_shanghu','','seq')" id="vo"}
                        <option value="{$vo.id?? ''}">{$vo.title?? ''}</option>
                        {/volist}
                    </select>
                </div>
            </div>&ndash;%&gt;
            <button type="button" class="layui-btn" lay-submit lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>--%>
    </div>
    <%--<div class="weadmin-block demoTable">
        <button class="layui-btn layui-btn-danger" data-type="getCheckData"><i class="layui-icon">&#xe640;</i>批量删除
        </button>
        <button class="layui-btn" onclick="WeAdminShow('添加商品','./add',600,500)"><i class="layui-icon">&#xe61f;</i>添加
        </button>
    </div>--%>
    <table class="layui-hide" id="articleList" lay-filter="dataTable"></table>


    <script type="text/html" id="operateTpl">
        <a title="编辑" onclick="WeAdminEdit('编辑','./edit', 2, 600, 400)" href="javascript:;">
            <i class="layui-icon">&#xe642;</i>
        </a>
        <a title="删除" href="javascript:;">
            <i class="layui-icon">&#xe640;</i>
        </a>
    </script>
    <%--<script type="text/html" id="shelfTpl">--%>
    <%--<form class="layui-form">--%>
    <%--<input type="checkbox" name="itemstatus" lay-filter="itemstatus" lay-skin="switch" lay-text="正常|下架" {{1==d.status?'checked':''}}/>--%>
    <%--</form>--%>
    <%--</script>--%>
    <script type="text/html" id="myTpl">
        <div class="layui-form">
            <input type="checkbox" name="itemStatus" id="itemStatus" lay-skin="switch" lay-text="正常|下架"
                   {{1==d.status?'checked':''}}/>
        </div>
    </script>

</div>
<script type="text/javascript">
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    //可以引入admin.js，两步走：extend use
    layui.use(['table', 'admin', 'jquery', 'layer','form'], function () {
        var table = layui.table,
            form = layui.form,
            $ = layui.jquery,
            layer = layui.layer,
            thisTitle='商品';

        var table1=table.render({
            //表格属性
            //要渲染的容器
            page: true,
            initSort: {field:'posttime', type:'desc'},
            elem: '#articleList',
            //异步请求
            url: '../../admin/index/getlists',
            //列
            cols: [[
                //field title 列属性
                {type: 'checkbox'},
                {field: 'hid', title: '标签id',width: 180, sort: true},
                //{field: '', title: '轮播图id',width: 300, sort: true},
                {field: 'parendId', title: '父标签',width: 180, sort: true},
                {field: 'image', title: '图片地址',width: 280,sort: true,edit:'text'},
                {field: 'title', title: '标题',width: 220,sort: true,edit:'text'},
                //{field: 'address', title: '目标地址',width: 100,sort: true,edit:'text'},
                //{field:'pstatus', title:'状态', width:100, align:'center', templet: '#zhuangtaiTpl', unresize: true,fixed: 'right'},
                { width:180, align:'center', title:'操作', toolbar: '#caozuo', fixed: 'right'}
            ]],
            done: function (res, curr, count) {
                console.log($("[data-field='status']").children());
                $("[data-field='status']").children().each(function () {
                    if ($(this).text() == '1') {
                        $(this).text('正常');
                    }
                    if ($(this).text() == '2') {
                        $(this).text('下架');
                    }
                    if ($(this).text() == '3') {
                        $(this).text('删除');
                    }
                });
                //$.ajax({});
                //$.get();
                //$.post();
//                $.post(
//                    //url:string,异步请求提交给谁处理
//                    'abc',
//                    //data:object,提交什么后台处理
//                    {},
//                    //success:function,成功后的回调函数
//                    function(data){},
//                    //dataType:string
//                    'json'
//                );
            }
        });
        //工具条事件
        table.on('tool(dataTable)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('确认删除吗?', function(index){
                    _acDel(data.hid);
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                /* _add('编辑'+thisTitle,'edit?pid='+data.pid);*/
                _add('编辑'+thisTitle,'../../admin/index/getIndexother?hid='+data.hid);
            } else if(obj.event === 'view'){
                _add(thisTitle+'报表','view?czid='+data.id,'95%','95%');
            }
        });
        //自定义操作
        form.on('switch(zhuangtai)', function(obj){
            console.log(this);
            var czid=this.id;
            var what=this.name;
            var val=obj.elem.checked?'1':'2';
            _acFun(czid,what,val);
        });
        form.on('switch(tuijian)', function(obj){
            var czid=this.id;
            var what=this.name;
            var val=obj.elem.checked?'1':'0';
            _acFun(czid,what,val);
        });
        table.on('edit(dataTable)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field //得到字段
                ,czid=obj.data.id;//得到操作行ID
            _acFun(czid,field,value);
        });
        //响应删除执行
        function _acDel(hid) {
            $.ajax({
                url: '../../admin/index/indexOther/delete?hid='+hid,
                type: "get",
                dataType: "json",
                success: function (data) {
                    //停留在原来页面刷新
                    /*$(".layui-laypage-btn").click();*/
                    table1.reload('dataTable', {});
                    layer.msg("恭喜，删除成功！", {icon: 1});

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.tips('删除失败');
                },
                beforeSend: function () {
                },
                complete: function () {
                }
            });
        }
        function _add(title,url,width,hight){
            if(!width){
                width = '100%';
            }
            if(!hight){
                hight = '100%';
            }
            layer.open({
                skin: 'layui-layer-lan', //默认皮肤
                type:2,
                title:title, //标题
                area: [width, hight], //宽高
                shade: 0.8,//遮罩
                zIndex:9999,
                content: url,
                end: function() {
                    table.reload('articleList', {});
                }
            });
        }
        //*响应执行*//
        function _acFun(czid,what,val) {
            $.ajax({
                url: '../../acfun?pid='+czid+'&'+what+'='+val,
                type: "post",
                dataType: "json",
                success: function (data) {
                    if(data>0){
                        layer.msg("更新成功", {icon: data.code});
                    }else {
                        layer.msg("更新失败", {icon: data.code});
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.tips('更新失败');
                },
                beforeSend: function () {
                },
                complete: function () {
                }
            });
        }
        //监听查找条件
        form.on('submit(search)', function(data){
            var param = $("#searchForm").serialize();
            table.reload('articleList', {
                url: "../../products?"+param,
            });
            return false;
        });
        //监听表头排序
        table.on('sort(articleList)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            console.log(obj.field); //当前排序的字段名
            console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
            table.reload('articleList', {
                initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
                ,where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                    field: obj.field //排序字段
                    ,order: obj.type //排序方式
                }
            });
        });

        //批量删除按钮的点击事件
        /*$('.demoTable .layui-btn-danger').click(function () {
            //获取按钮的data-type属性
            var type = $(this).data('type');
            //console.log(type);
            //三目运算符
            // 如果active[type]为真值，那么就调用它，如果为假值就什么都不做
            active[type] ? active[type].call(this) : '';
        });*/

        //搜索按钮的点击事件
        $('.weadmin-body .layui-btn').on('click',function(){
            var type = $(this).data('type');//reload
            active[type] ? active[type].call(this) : '';
        });

        var active = {
            reload:function(){
                //第一步选获取文本框中内容
                var title = $('#title').val();
                //第二步判断内容是否为空
                if($.trim(title).length > 0){
                    //文本框里面有内容，表格需要重载，另外发送一个请求 items
                    table.reload('articleList',{
                        page:{curr:1},
                        //第一个title做为表单数据传递出去的key
                        //第二个title就是这里定义js变量
                        where:{title:title}
                    });
                }
            },
            getCheckData: function () {
                //判断是否有选中行
                //获取选中的行
                var data = table.checkStatus('articleList').data;
                //判断长度
                if (data.length > 0) {
                    //至少选中了一行
                    //目的：遍历data这个数组，拿出其中每一个id，放入另外一个数组中即可
                    var pids = [];
                    for (var i = 0; i < data.length; i++) {
                        pids.push(data[i].hid);
                    }
                    //目的：发出异步请求，将ids数组传递到后台即可
                    $.post(
                        //url
                        '../../item/delete',
                        //data
                        {'ids[]': pids},
                        //function
                        function(data){
                            //至少删除一条记录
                            if (data > 0) {
                                //停留在原来页面刷新
                                $('.layui-laypage-btn').click();
                                layer.msg("恭喜，删除成功！", {icon: 1});
                            }
                        }
                        //dataType
                    );

                } else {
                    //没有选中行
                    layer.msg('请至少选中一行再进行删除!', {icon: 2});
                }
            }
        };
        //定义操作功能区按钮事件
        $('.acFroTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
            return false;
        });
        //监听操作功能区按钮事件
        var $ = layui.$, active = {
            getAdd: function(){ //添加
                _add('添加'+thisTitle,'./otheradd');
            }
            ,getRefresh: function(){ //刷新
                location.reload();
            }
            , getDelData: function () { //删除
                var checkStatus = table.checkStatus('articleList')
                    , data = checkStatus.data
                    , counts = 0
                    , ids_str = [];
                $.each(data, function (key, item) {
                    counts = data.length;
                    ids_str.push(item.iid);
                });
                console.log(ids_str);
                if (ids_str.length == 0) {
                    layer.msg('请先选择要删除的数据!',{icon: 2});
                } else {
                    layer.confirm('真的删除这' + counts + '条数据吗?', function (index) {
                        var jqxhr = $.ajax({data:{ids: ids_str}, url: "../../item/delete", type: 'post'});
                        jqxhr.done(function (data) {
                            if (data>0) {
                                layer.close(index);
                                //location.reload();
                                table1.reload('dataTable', {});
                                layer.msg("恭喜，删除成功！", {icon: 1});
                                return false;
                            } else {
                                layer.close(index);
                                layer.msg('删除失败',{icon: 2});
                                return false;
                            }
                        });
                    });
                }
            }
            /*getDelData: function(){ //删除
                            var checkStatus = table.checkStatus('dataTable')
                                ,data = checkStatus.data
                                ,title_all = ''
                                ,ids_str = '';
                            $.each(data,function(key,item) {
                                title_all += "," + item.title;
                                ids_str += "," + item.id;
                            });
                            title_all = title_all.replace(/(^[,]*)|([,]*$)/g, "");
                            ids_str = ids_str.replace(/(^[,]*)|([,]*$)/g, "");
                            if(!ids_str) {
                                layer.msg('请先选择要删除的数据!');
                            }else{
                                layer.confirm('真的删除' + title_all + '这些数据吗?', function(index){
                                    var jqxhr=$.ajax({data:'czid=' + ids_str, url:"delete?1=1" , type:'get'});
                                    jqxhr.done(function(re){
                                        if (re.code == 1) {
                                            layer.close(index);
                                            //location.reload();
                                            table.reload('dataTable', {});
                                            return false;
                                        }else{
                                            layer.close(index);
                                            layer.msg('删除失败');
                                            return false;
                                        }
                                    });
                                });
                            }
                        }*/
        };
    });
</script>
</body>

</html>