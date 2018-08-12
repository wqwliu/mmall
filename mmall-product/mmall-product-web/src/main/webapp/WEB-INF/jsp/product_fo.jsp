<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN" xml:lang="zh-CN">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta charset="UTF-8" />
    <title>小米8立即购买-小米商城</title>
    <meta name="viewport" content="width=1226" />
    <meta name="description" content="小米手机官网正品小米8推荐，小米手机小米8最新价格，有多种颜色可选，另有小米8详细介绍及图片，还有用户评价，售前咨询等。" />
    <meta name="keywords" content="小米8,小米商城" />
    <link rel="shortcut icon" href="//s01.mifile.cn/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="//s01.mifile.cn/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/base.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/product_buy.min.css" />

    <script type="text/javascript">var _head_over_time = (new Date()).getTime();</script>
</head>
<body>


<script>
    var proBuy_id = 10000099;
    var orderapi_host = "//cn.orderapi.mi.com";
    var ref_goods = "2182100041";
</script>

<style>
    .pro-policy, .pro-policy a {color: #b0b0b0;}
</style>

<!-- 导航 -->
<div id="J_proHeader">
    <div class="container">
        <h2>小米8</h2>
    </div>
</div>
<div class="xm-buyBox" id="J_buyBox">
    <div class="box clearfix">
        <div class="login-notic hide J_notic">
            <!-- 未登录提示 -->
            <div class="container">
                为方便您购买，请提前登录 <a href="javascript:void(0);" class="J_proLogin">立即登录</a> <a href="javascript:void(0);" class="iconfont J_proLoginClose">&#xe602;</a>
            </div>
        </div>
        <div class="pro-choose-main container clearfix">
            <div class="pro-view span10" >
                <!-- 左侧轮播图 -->
                <div class="J_imgload imgload"></div>
                <div id="J_img" class="img-con hide">

                    <div id="J_sliderView" class="sliderWrap">

                    </div>
                </div>
            </div>
            <div class="pro-info span10">
                <h1 class="pro-title J_proName">
                    小米8                </h1>
                <!-- 提示 -->
                <p class="sale-desc" id="J_desc"><font color='#ff4a00'>「重磅旗舰在售中」</font>全球首款双频GPS / 骁龙845处理器 / 红外人脸解锁 / AI变焦双摄 / 三星 AMOLED 屏</p>
                <!-- 选择第一级别 -->
                <span class="pro-price J_proPrice"></span>
                <div class="pro-book hide J_proBook">
                    <div class="pro-book-head">
                        预售
                        <span class="time J_bookTime"></span>
                    </div>
                    <div class="pro-book-con">
                        预付款<span class="pro-book-price">￥<em class="J_bookPrice"></em></span>
                        <span class="pro-book-rule J_bookRuleTips hide">预售规则<em class="icon J_bookRule">?</em></span>
                    </div>
                    <div class="pro-book-rule-con J_bookRuleCon hide">
                        <em><i></i></em>
                        <div>

                        </div>
                    </div>
                </div>
                <div class="pro-book hide J_proOrder">
                    <div class="pro-book-head">
                        限时预约
                        <span class="time J_orderTime"></span>
                    </div>
                    <div class="pro-book-con">
                        <span class="pro-book-price">￥<em class="J_orderPrice"></em></span>
                        <span class="pro-order-count J_orderCount hide"></span>
                    </div>
                </div>
                <div class="loading J_load">
                    <div class="loader"></div>
                </div>
                <div class="J_saleWrap sale-wrap hide">


                    <!-- 主体 -->
                    <div class="J_main hide">
                        <!-- 分仓地址 -->
                        <div class="J_addressWrap address-wrap hide">

                        </div>
                        <!-- 产品版本 -->
                        <div class="list-wrap" id="J_list">

                        </div>
                        <!-- 电视会员服务块 -->
                        <!--             <div class="pro-choose hide" id="J_mitvMemberty">
                                        <div class="step-title">
                                            选择会员服务 <a href="">了解会员卡 &gt;</a>
                                        </div>
                                    </div> -->
                        <div id="J_relation"></div>
                        <!-- 上面安装服务 -->
                        <!--                    <div class="pro-choose list-choose hide" id="J_install">
                                               <div class="step-title">
                                                   可选 上门安装服务
                                               </div>
                                               <div class="list-box">
                                                   <a class="iconfont J_extend" href="javascript:void(0);">&#xe61b;</a>
                                                   <p class="list-tips J_listTips">搭配手机一起购买，<span>最多省 <span class="J_salePrice">39</span>元</span></p>
                                                   <div class="list-desc J_listDescBox hide">
                                                       <p class="tips">已选择 <span class="J_listNum">0</span> 款配件 <a href="javascript:void(0);" class="J_listDelete">移除</a></p>
                                                       <p class="desc"></p>
                                                       <p class="price"></p>
                                                   </div>
                                               </div>
                                               <div class="list">

                                               </div>
                                           </div> -->
                        <!-- 已选择的产品 -->
                        <div class="pro-list hide" id="J_proList">

                        </div>
                        <!-- 购买按钮 -->

                        <ul class="btn-wrap clearfix" id="J_buyBtnBox">

                        </ul>



                        <div class="pro-policy" id="J_policy">
                        </div>
                    </div>
                    <!-- 获取商品失败 -->
                    <div class="error hide J_error">
                        <h3>有点小问题，请点击按钮刷新重试</h3>
                        <a href="javascript:void(0)" class="btn btn-primary J_reload">刷新</a>
                    </div>
                </div>
            </div>





            <script type="text/javascript">
                //设置图片大小
                var getImage = function (image , size) {
                    if(typeof image === 'string'){
                        var type = image.substr(-4,4);
                        var path = image.substring(0,image.length-4);
                        if (type == 'jpeg') {
                            type = image.substr(-5,5);
                            path = image.substring(0,image.length-5);
                        }
                        return path + '!'+ size + 'x' + size + type;
                    }
                }
            </script>

            <script type="text/javascript">
                //判断库存
                var getStockDataName =  function(type ,data) {

                    //根据type类型获取本地存储的数据名字
                    //没有范围普通库存
                    var json = {
                        0: 'stockData',
                        1: 'stockData'
                    };
                    if (data.bigTagJson[type]) {
                        json = data.bigTagJson[type];
                    }
                    return json;

                };
                var getStockData = function(type, num , data) {
                    //根据type类型 获取本地存储的库存数据
                    return getStockDataName(type , data)[num];
                };

                var checkStock = function (json , data) {
                    // console.log(json);
                    // 如果没有子孩子则直接查询是否有库存
                    // 否则遍历子孩子
                    if(!json.list){

                        var goods = json.goods;

                        if (goods === undefined) {
                            return false;
                        }

                        var id = goods ? goods.goods_id : json.id;



                        var act = goods.action;

                        var stock = act.isBigtap ? getStockData(act.type, 0 , data) :
                            getStockData(act.type, 1 , data);
                        stock = data[stock];
                        if(act.type === "bigtap" || act.type === "presales" || act.type === "booking"){
                            if(stock && stock[id]){
                                if( act.isBigtap ){
                                    if( stock[id].hdstatus === 2){
                                        return true;
                                    }
                                }else{
                                    if(stock[id]){
                                        return true;
                                    }
                                }
                            }else{
                                return false;
                            }
                        } else{
                            if(act.type !== "common"){
                                return true;
                            }else{
                                if(stock[id]){
                                    return true;
                                }
                            }

                        }

                    }else{
                        var _stock = false;
                        var list = json.list;
                        for (var i = 0 , l = list.length; i < l; i++) {
                            if(list[i].hasChild === undefined){
                                _stock = checkStock(list[i] , data);
                                if(_stock){
                                    break ;
                                }
                            }else if(list[i].hasChild !== undefined && list[i].hasChild){
                                _stock = checkStock(list[i] , data);
                                if(_stock){
                                    break ;
                                }
                            }

                        }

                        if(_stock){
                            return true;
                        }

                    }
                    return false;
                }
            </script>
            <!-- 一级选择模板 -->
            <script id="J_proTmp" type="text/x-dot-template">
                {{~it.data: data : index}}
                {{?index === 0}}
                <div class="pro-choose pro-choose-col2 J_step"
                     data-index="{{=it.index}}" >
                    <div class="step-title"
                         data-name="选择{{?data.isExist}}{{=data.name}}{{??}}{{=data.title}}{{?}}">
                        选择{{?data.isExist}}{{=data.name}}{{??}}{{=data.title}}{{?}}
                        {{?it.formateListPro && it.data[it.num.index].desc}}
                        <span>{{=it.data[it.num.index].desc}}</span>
                        {{?}}
                    </div>
                    <ul class="step-list step-one clearfix">
                        {{?}}
                        {{?data.isExist}}
                        <li
                                {{
                                var stock = checkStock(data , it);
                                }}
                                {{?it.formateListPro}}
                                {{?data.value === it.num.val && !it.isAllBooking}}
                                {{?stock}}
                                class="btn btn-biglarge active"
                                {{??}}
                                class="btn btn-biglarge active-disabled"
                                {{?}}
                                {{??}}
                                {{?stock }}
                                class="btn btn-biglarge"
                                {{??}}
                                class="btn btn-biglarge disabled"
                                {{?}}
                                {{?}}
                                {{??}}
                                {{?stock }}
                                class="btn btn-biglarge"
                                {{??}}
                                class="btn btn-biglarge disabled"
                                {{?}}
                                {{?}}
                                {{?data.goods}}
                                data-id="{{=data.goods.goods_id}}"
                                data-cid="{{=data.goods.commodity_id}}"
                                {{?}}
                                {{?data.value}}
                                data-name='{{=data.value}}'
                                {{?}}
                                {{?data.price_min}}
                                data-price='{{=parseFloat(data.price_min)}}元
                {{?parseFloat(data.price_max) > parseFloat(data.price_min)}}
                    起
                {{?}}
                '
                                {{?}}
                                data-index="{{=index}}"
                                data-value='{{=data.value}}'
                        >
                            <a href="javascript:void(0);">
                                <span class="name">{{=data.value}} </span>
                                {{?data.price_min !== ''}}
                                <span class="price">
                    {{=parseFloat(data.price_min)}}元{{?parseFloat(data.price_max) > parseFloat(data.price_min)}}起{{?}}
                </span>
                                {{?}}
                            </a>

                        </li>
                        {{??}}
                        <li class="btn btn-biglarge disabled" data-value="{{=data.name}}">
                            <a href="javascript:void(0);">
                                {{=data.name}}
                            </a>
                        </li>
                        {{?}}
                        {{?index === it.data.length -1}}
                    </ul>
                </div>
                {{?}}
                {{~}}
            </script>

            <!-- 非1级选择模板 -->
            <script id="J_proTmp2" type="text/x-dot-template">
                {{~it.data: data : index}}
                {{?index === 0}}
                <div class="pro-choose pro-choose-col2 J_step"
                     data-index="{{=it.index}}" >
                    <div class="step-title" data-name="选择{{?data.isExist}}{{=data.name}}{{??}}{{=data.title}}{{?}}">
                        选择{{?data.isExist}}{{=data.name}}{{??}}{{=data.title}}{{?}}
                        {{?it.formateListPro && it.data[it.num.index].desc }}
                        <span>{{=it.data[it.num.index].desc}}</span>
                        {{?}}
                    </div>
                    <ul class="step-list clearfix">
                        {{?}}

                        {{?data.isExist}}
                        <li
                                {{
                                var stock = checkStock(data , it);
                                }}
                                {{?it.formateListPro}}
                                {{?data.value === it.num.val && !it.isAllBooking}}
                                {{?stock}}
                                class="btn btn-biglarge active"
                                {{??}}
                                class="btn btn-biglarge active-disabled"
                                {{?}}
                                {{??}}
                                {{?stock }}
                                class="btn btn-biglarge "
                                {{??}}
                                class="btn btn-biglarge disabled"
                                {{?}}
                                {{?!data.hasChild}}
                                data-childLen="{{=data.child.length}}"
                                {{?}}
                                {{?}}
                                {{??}}
                                {{?stock }}
                                class="btn btn-biglarge "
                                {{??}}
                                class="btn btn-biglarge disabled"
                                {{?}}
                                {{?}}

                                {{?data.goods }}
                                {{? data.goods && data.goods.goods_id}}
                                data-id="{{=data.goods.goods_id}}"
                                data-cid="{{=data.goods.commodity_id}}"
                                {{?}}
                                {{?data.goods && data.goods.goods_name}}
                                data-name="{{=data.goods.goods_name}}"
                                {{?}}
                                {{?data.price_min}}
                                data-price="{{=parseFloat(data.price_min)}}元"
                                {{?}}
                                {{?}}
                                data-value="{{=data.value}}"
                                data-index="{{=index}}"
                        >

                            <a href="javascript:void(0);">
                                {{?data.goods }}
                                {{? data.goods.icon_url !== ''}}
                                <img src="${pageContext.request.contextPath}/static/picture/img-placeholder.png" data-src="{{=data.goods.icon_url}}" alt="{{=data.goods.icon_name}}" />

                                {{??}}
                                <img src="${pageContext.request.contextPath}/static/picture/img-placeholder.png" data-src="{{=getImage(data.goods.image, 16)}}" alt="{{=data.goods.icon_name}}" />
                                {{?}}
                                {{?}}
                                {{=data.value}}

                            </a>
                        </li>
                        {{??}}
                        <li class="btn btn-biglarge disabled btn-hide" data-value="{{=data.name}}">
                            <a href="javascript:void(0);">
                                {{? data.icon_url !== ''}}
                                <img src="${pageContext.request.contextPath}/static/picture/img-placeholder.png" data-src="{{=data.icon_url}}" />
                                {{??}}
                                <img src="${pageContext.request.contextPath}/static/picture/img-placeholder.png" data-src="{{=getImage(data.image, 16)}}"  />
                                {{?}}
                                {{=data.name}}
                            </a>
                        </li>
                        {{?}}
                        {{?index === it.data.length -1}}
                    </ul>
                </div>
                {{?}}

                {{~}}
            </script>

            <!-- 产品轮播图模板 -->
            <script id="J_proImgTmp" type="text/x-dot-template">
                {{?it.images.length !== 0}}
                {{ var imgArr = it.images;}}
                {{for (var key in imgArr) { }}
                <img data-src="${pageContext.request.contextPath}/static/products/562d008aN963ce5f2.jpg" class="slider">
                {{ } }}
                {{??}}
                <img src="${pageContext.request.contextPath}/static/products/562d008aN963ce5f2.jpg">
                {{?}}
            </script>


            <!-- 搭售商品模板 -->
            <script id="J_relationTmp" type="text/x-dot-template">
                <div class="pro-choose list-choose list-choose-parts" id="J_parts">
                    <div class="step-title">
                        搭配购买
                    </div>
                    <div class="list-box">
                        <a class="iconfont J_extend" href="javascript:void(0);">&#xe61b;</a>
                        <p class="list-tips J_listTips">搭配一起购买
                            <span class="J_saleMax hide">,
                <span>
                最多省
                <span class="J_salePrice"></span>元
                </span>
            </span>
                        </p>
                        <div class="list-desc J_listDescBox hide">
                            <p class="tips">已选择 <span class="J_listNum">0</span> 款配件 <a href="javascript:void(0);" class="J_listDelete">移除</a></p>
                            <p class="desc"></p>
                            <p class="price"></p>
                        </div>
                    </div>
                    <div class="list">
                        <ul class="hide">
                            {{

                            var contains = function (arr , obj) {
                            var i = arr.length;
                            while (i--) {

                            if (arr[i] === obj) {
                            return true;
                            }
                            }
                            return false;
                            };
                            }}


                            {{ for (var prop in it.data) { }}
                            {{
                            var listProp = it.data[prop].goods_list;
                            var max_save = 0;
                            var price = listProp[0].price;
                            }}
                            <li>
                                <i class="iconfont icon-checkbox" ><em>√</em></i>
                                <img src="${pageContext.request.contextPath}/static/picture/{{=getimage(listprop[0].small_img, 100)}}" class="img">
                                <span class="price">
                {{?listProp[0].is_bargain }}
                    {{?contains(listProp[0].match_commodity_ids,parseFloat(it.cid)) &&
                    parseFloat(listProp[0].act_price) < parseFloat(listProp[0].market_price)}}
                        {{
                            max_save = parseFloat(listProp[0].market_price) - parseFloat(listProp[0].act_price);
                            price = listProp[0].act_price;
                        }}
                    {{??}}
                    {{
                    max_save = parseFloat(listProp[0].market_price) - parseFloat(price);
                    }}
                    {{?}}
                {{??}}
                    {{
                    max_save = parseFloat(listProp[0].market_price) - parseFloat(price);
                    }}
                {{?}}

                <em>{{=parseFloat(price)}}元 </em>
                <del data-maxsave="{{=max_save}}">
                    {{?parseFloat(price) < parseFloat(listProp[0].market_price)}}
                        {{=parseFloat(listProp[0].market_price)}}元
                    {{?}}
                </del>
                </span>
                                <div>
                                    <span class="name">{{=listProp[0].name}}</span>
                                    <p class="desc">{{=it.data[prop].title}}</p>
                                    <div>
                                        {{~listProp :data:index }}
                                        {{var priceData = data.price;}}
                                        <a href="javascript:void(0);"
                                           data-img="{{=getImage(data.small_img, 100)}}"
                                           data-id="{{=data.goods_id}}"
                                           data-name="{{=data.name}}"
                                           {{?data.is_bargain}}
                                           {{?data.match_commodity_ids &&
                                           contains(data.match_commodity_ids,parseFloat(it.cid)) }}
                                           {{priceData = data.act_price;}}
                                           data-is_bargain="true"
                                           {{??}}
                                           data-is_bargain="false"
                                           {{?}}

                                           data-bargain_id="{{=data.bargain_id}}"
                                           {{?}}
                                           data-price="{{=parseFloat(priceData)}}元 "
                                           data-originalprice="{{=parseFloat(data.market_price)}}元 "
                                           {{?index === 0}}
                                           class="active"
                                           {{?}}
                                        >

                                            <img src="${pageContext.request.contextPath}/static/picture/{{=getimage(data.small_img, 30)}}" ></a>
                                        {{~}}
                                    </div>
                                </div>
                            </li>
                            {{}}}
                        </ul>
                    </div>
                </div>
            </script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/product_buy.min.js"></script>
            <script>
                var _msq = _msq || [];
                _msq.push(['setDomainId', 100]);
                _msq.push(['trackPageView']);
                (function() {
                    var ms = document.createElement('script');
                    ms.type = 'text/javascript';
                    ms.async = true;
                    ms.src = '//s1.mi.com/stat/18/xmst.js';
                    var s = document.getElementsByTagName('script')[0];
                    s.parentNode.insertBefore(ms, s);
                })();
            </script>
        </div>
    </div>
</div>
</body>
</html>