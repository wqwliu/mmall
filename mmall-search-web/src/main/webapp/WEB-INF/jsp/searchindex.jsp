<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/7 0007
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN" xml:lang="zh-CN">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <meta charset="UTF-8"/>
    <title>【小米6x及小米6x相关产品】-小米商城</title>
    <meta name="viewport" content="width=1226"/>
    <meta name="description" content="小米6x的检索结果，小米官方网站包含小米6x价格及小米6x适配机型，官方推荐小米6x产品，帮助米粉挑选合适自己的小米6x商品。"/>
    <meta name="keywords" content="小米6x"/>
    <meta name="robots" content="noindex"/>
    <link rel="shortcut icon" href="//s01.mifile.cn/favicon.ico" type="image/x-icon"/>
    <link rel="icon" href="//s01.mifile.cn/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/base.min.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/list.min.css"/>
    <script type="text/javascript">
        var _head_over_time = (new Date()).getTime();
    </script>
</head>

<body>
<%@include file="head.jsp"%>
<div class="container">
    <div class="filter-box">
        <div class="filter-list-wrap">
            <dl class="filter-list clearfix">
                <dt>分类：</dt>
                <dd class="active">全部</dd>
                <dd>
                    <a href="//search.mi.com/search_小米6x-9">贴膜</a>
                </dd>
                <dd>
                    <a href="//search.mi.com/search_小米6x-8">保护套/保护壳</a>
                </dd>
                <dd>
                    <a href="//search.mi.com/search_小米6x-30">配件优惠套装</a>
                </dd>
                <dd>
                    <a href="//search.mi.com/search_小米6x-31">手机</a>
                </dd>
            </dl>
        </div>
    </div>
</div>
<div class="content">
    <div class="container">
        <div class="order-list-box clearfix">
            <ul class="order-list">
                <li class="active first">
                    <a href="//search.mi.com/search_小米6x-0-0-0-0-0-0-0-0-1" rel="nofollow">推荐</a>
                </li>
                <li>
                    <a href="//search.mi.com/search_小米6x-0-0-0-0-1-0-0-0-1" rel="nofollow">新品</a>
                </li>
                <li class="up">
                    <a href="//search.mi.com/search_小米6x-0-0-0-0-10-0-0-0-1" rel="nofollow">价格 <i class="iconfont">&#xe62f;</i></a>
                </li>
                <li>
                    <a href="//search.mi.com/search_小米6x-0-0-0-0-3-0-0-0-1" rel="nofollow">评论最多</a>
                </li>
            </ul>
            <ul class="type-list">
                <li>
                    <a href="//search.mi.com/search_小米6x-0-0-0-0-0-0-0-1-1"><span class="checkbox"><i class="iconfont">&#x221a;</i></span>查看评价</a>
                </li>
                <li>
                    <a href="//search.mi.com/search_小米6x-0-0-0-0-0-0-1-0-1" rel="nofollow"><span class="checkbox"><i
                            class="iconfont">&#x221a;</i></span>仅显示特惠商品</a>
                </li>
                <li>
                    <a href="//search.mi.com/search_小米6x-0-0-0-0-0-1-0-0-1" rel="nofollow"><span class="checkbox"><i
                            class="iconfont">&#x221a;</i></span>仅显示有货商品</a>
                </li>
            </ul>
        </div>
        <div class="goods-list-box">
            <div class="goods-list clearfix">
                <c:forEach items="${list}" var="l" varStatus="vs">
                    <div class="goods-item" data-productid="7895">
                        <div class="figure figure-img">

                            <a href='http://localhost:82/product/showProductByPid?pid=${l.pid}&uname=${user}'><img
                                    src="${image[vs.count-1]}" width="200" height="200" alt=""/>
                            </a>
                        </div>
                        <p class="desc"></p>
                        <h2 class="title"><a
                                 href='http://localhost:82/product/showProductByPid?pid=${l.pid}&uname=${user}'><%--小米6X 全网通版 6GB内存 64GB--%>${l.pname}</a>
                        </h2>
                        <p class="price"><fmt:formatNumber value="${l.shopPrice}" type="currency"/>
                            <del>
                                <fmt:formatNumber value="${l.shopPrice*1.1}" type="currency"/>
                            </del>
                        </p>
                        <div class="thumbs">
                            <ul class="thumb-list">
                                <li data-commodityid="1181500030"
                                    data-config='{"cid":"1181500030","gid":"0","discount":"9.5","price":"1699\u5143 <del>1799\u5143<\/del>","new":0,"is-cos":0,"package":1,"hasgift":1,"postfree":0,"postfreenum":1,"cfrom":"search"}'>
                                    <a><img src="${image[vs.count-1]}" width="34" height="34"
                                            title="${l.pname}" alt="${l.pname}"/></a>
                                </li>
                                <%--<li data-commodityid="1181500030"
                                    data-config='{"cid":"1181500030","gid":"0","discount":"9.5","price":"1699\u5143 <del>1799\u5143<\/del>","new":0,"is-cos":0,"package":1,"hasgift":1,"postfree":0,"postfreenum":1,"cfrom":"search"}'>
                                    <a><img src="picture/pms_1524621215.02256716!34x34.jpg" width="34" height="34"
                                            title="小米6X 全网通版 6GB内存 64GB 冰川蓝" alt="小米6X 全网通版 6GB内存 64GB 冰川蓝"/></a>
                                </li>
                                <li data-commodityid="1181500031"
                                    data-config='{"cid":"1181500031","gid":"2181500031","discount":"9.5","price":"1699\u5143 <del>1799\u5143<\/del>","new":0,"is-cos":0,"package":0,"hasgift":1,"postfree":0,"postfreenum":1,"cfrom":"search"}'>
                                    <a><img src="picture/pms_1524621219.48895957!34x34.jpg" width="34" height="34"
                                            title="小米6X 全网通版 6GB内存 64GB 流沙金" alt="小米6X 全网通版 6GB内存 64GB 流沙金"/></a>
                                </li>
                                <li data-commodityid="1181500032"
                                    data-config='{"cid":"1181500032","gid":"2181500032","discount":"9.5","price":"1699\u5143 <del>1799\u5143<\/del>","new":0,"is-cos":0,"package":0,"hasgift":1,"postfree":0,"postfreenum":1,"cfrom":"search"}'>
                                    <a><img src="picture/pms_1524621222.66011593!34x34.jpg" width="34" height="34"
                                            title="小米6X 全网通版 6GB内存 64GB 曜石黑" alt="小米6X 全网通版 6GB内存 64GB 曜石黑"/></a>
                                </li>
                                <li data-commodityid="1181500033"
                                    data-config='{"cid":"1181500033","gid":"2181500033","discount":"9.5","price":"1699\u5143 <del>1799\u5143<\/del>","new":0,"is-cos":0,"package":0,"hasgift":1,"postfree":0,"postfreenum":1,"cfrom":"search"}'>
                                    <a><img src="picture/pms_1524621225.83162698!34x34.jpg" width="34" height="34"
                                            title="小米6X 全网通版 6GB内存 64GB 赤焰红" alt="小米6X 全网通版 6GB内存 64GB 赤焰红"/></a>
                                </li>
                                <li data-commodityid="1181500034"
                                    data-config='{"cid":"1181500034","gid":"2181500034","discount":"9.5","price":"1699\u5143 <del>1799\u5143<\/del>","new":0,"is-cos":0,"package":0,"hasgift":1,"postfree":0,"postfreenum":1,"cfrom":"search"}'>
                                    <a><img src="picture/pms_1524621229.56695068!34x34.jpg" width="34" height="34"
                                            title="小米6X 全网通版 6GB内存 64GB 樱花粉" alt="小米6X 全网通版 6GB内存 64GB 樱花粉"/></a>
                                </li>--%>
                            </ul>
                        </div>
                        <div class="actions clearfix">
                            <a class="btn-like J_likeGoods" data-cid="1181500030" href="javascript: void(0);"><i
                                    class="iconfont">&#xe62d;</i> <span>喜欢</span></a>
                            <a class="btn-buy btn-buy-detail J_buyGoods" data-cid="1181500030"
                               href="//item.mi.com/1181500030.html?cfrom=search"><span>查看详情</span> <i class="iconfont">&#xe60a;</i></a>
                        </div>
                        <div class="flags">
                            <div class="flag flag-saleoff">9.5折促销</div>
                            <div class="flag flag-gift">有赠品</div>
                        </div>
                        <div class="notice"></div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div class="content">
    <div id="J_renovateWrap" class="xm-recommend-container"></div>
</div>
<div class="site-footer">
    <div class="container">
        <div class="footer-service">
            <ul class="list-service clearfix">
                <li>
                    <a rel="nofollow" href="//www.mi.com/static/fast/" target="_blank"><i class="iconfont">&#xe634;</i>预约维修服务</a>
                </li>
                <li>
                    <a rel="nofollow" href="//www.mi.com/service/exchange#back" target="_blank"><i class="iconfont">&#xe635;</i>7天无理由退货</a>
                </li>
                <li>
                    <a rel="nofollow" href="//www.mi.com/service/exchange#back" target="_blank"><i class="iconfont">&#xe636;</i>15天免费换货</a>
                </li>
                <li>
                    <a rel="nofollow" href="//www.mi.com/service/buy/postage/" target="_blank"><i class="iconfont">&#xe638;</i>满150元包邮</a>
                </li>
                <li>
                    <a rel="nofollow" href="//www.mi.com/static/maintainlocation/" target="_blank"><i class="iconfont">&#xe637;</i>520余家售后网点</a>
                </li>
            </ul>
        </div>
        <div class="footer-links clearfix">

            <dl class="col-links col-links-first">
                <dt>帮助中心</dt>

                <dd>
                    <a rel="nofollow" href="//www.mi.com/service/account/register/" target="_blank">账户管理</a>
                </dd>

                <dd>
                    <a rel="nofollow" href="//www.mi.com/service/buy/buytime/" target="_blank">购物指南</a>
                </dd>

                <dd>
                    <a rel="nofollow" href="//www.mi.com/service/order/sendprogress/" target="_blank">订单操作</a>
                </dd>

            </dl>

            <dl class="col-links ">
                <dt>服务支持</dt>

                <dd>
                    <a rel="nofollow" href="//www.mi.com/service/exchange" target="_blank">售后政策</a>
                </dd>

                <dd>
                    <a rel="nofollow" href="//www.mi.com/service/" target="_blank">自助服务</a>
                </dd>

                <dd>
                    <a rel="nofollow" href="//www.mi.com/c/service/download/" target="_blank">相关下载</a>
                </dd>

            </dl>

            <dl class="col-links ">
                <dt>线下门店</dt>

                <dd>
                    <a rel="nofollow" href="//www.mi.com/c/xiaomizhijia/" target="_blank">小米之家</a>
                </dd>

                <dd>
                    <a rel="nofollow" href="//www.mi.com/static/maintainlocation/" target="_blank">服务网点</a>
                </dd>

                <dd>
                    <a rel="nofollow" href="//www.mi.com/static/familyLocation/" target="_blank">授权体验店</a>
                </dd>

            </dl>

            <dl class="col-links ">
                <dt>关于小米</dt>

                <dd>
                    <a rel="nofollow" href="//www.mi.com/about/" target="_blank">了解小米</a>
                </dd>

                <dd>
                    <a rel="nofollow" href="http://hr.xiaomi.com/" target="_blank">加入小米</a>
                </dd>

                <dd>
                    <a rel="nofollow" href="//www.mi.com/ir/" target="_blank">投资者关系</a>
                </dd>

            </dl>

            <dl class="col-links ">
                <dt>关注我们</dt>

                <dd>
                    <a rel="nofollow" href="https://weibo.com/xiaomishangcheng" target="_blank">新浪微博</a>
                </dd>

                <dd>
                    <a rel="nofollow" href="#J_modalWeixin" data-toggle="modal">官方微信</a>
                </dd>

                <dd>
                    <a rel="nofollow" href="//www.mi.com/about/contact/" target="_blank">联系我们</a>
                </dd>

            </dl>

            <dl class="col-links ">
                <dt>特色服务</dt>

                <dd>
                    <a rel="nofollow" href="//order.mi.com/queue/f2code" target="_blank">F 码通道</a>
                </dd>

                <dd>
                    <a rel="nofollow" href="//www.mi.com/giftcode/" target="_blank">礼物码</a>
                </dd>

                <dd>
                    <a rel="nofollow" href="//order.mi.com/misc/checkitem" target="_blank">防伪查询</a>
                </dd>

            </dl>

            <div class="col-contact">
                <p class="phone">400-100-5678</p>
                <p>
                    周一至周日 8:00-18:00<br>（仅收市话费）
                </p>
                <a rel="nofollow" class="btn btn-line-primary btn-small" href="//www.mi.com/service/contact/"
                   target="_blank"><i class="iconfont">&#xe600;</i> 联系客服</a>
            </div>
        </div>
    </div>
</div>
<div class="site-info">
    <div class="container">
        <div class="logo ir">小米官网</div>
        <div class="info-text">
            <p class="sites">
                <a href="//www.mi.com/index.html" target="_blank">小米商城</a><span class="sep">|</span>
                <a href="https://www.miui.com/" target="_blank">MIUI</a><span class="sep">|</span>
                <a href="https://home.mi.com/index.html" target="_blank">米家</a><span class="sep">|</span>
                <a href="http://www.miliao.com/" target="_blank">米聊</a><span class="sep">|</span>
                <a href="https://www.duokan.com/" target="_blank">多看</a><span class="sep">|</span>
                <a href="http://game.xiaomi.com/" target="_blank">游戏</a><span class="sep">|</span>
                <a href="http://www.miwifi.com/" target="_blank">路由器</a><span class="sep">|</span>
                <a href="//www.mi.com/micard/" target="_blank">米粉卡</a><span class="sep">|</span>
                <a href="https://b.mi.com/?client_id=180100031058&masid=17409.0358" target="_blank">政企服务</a><span
                    class="sep">|</span>
                <a href="https://xiaomi.tmall.com/" target="_blank">小米天猫店</a><span class="sep">|</span>
                <a href="https://www.mi.com/about/privacy/" target="_blank">隐私政策</a><span class="sep">|</span>
                <a href="https://static.mi.com/feedback/" target="_blank">问题反馈</a><span class="sep">|</span>
                <a href="//www.mi.com/jiancha/" target="_blank">廉正举报</a><span class="sep">|</span>
                <a href="#J_modal-globalSites" target="_blank">Select Region</a>
            </p>
            <p>&copy;
                <a href="//www.mi.com/" target="_blank" title="mi.com">mi.com</a> 京ICP证110507号
                <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">京ICP备10046444号</a>
                <a rel="nofollow" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010802020134"
                   target="_blank">京公网安备11010802020134号 </a>
                <a rel="nofollow" href="//i8.mifile.cn/b2c-mimall-media/63cbc1342511938fc1395113f81324c4.jpg"
                   target="_blank" rel="nofollow">京网文[2017]1530-131号</a>

                <br> 违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</p>
        </div>
        <div class="info-links">
            <a href="//privacy.truste.com/privacy-seal/validation?rid=4fc28a8c-6822-4980-9c4b-9fdc69b94eb8&lang=zh-cn"
               target="_blank"><img src="${pageContext.request.contextPath}/static/picture/truste.png"
                                    alt="TRUSTe Privacy Certification"/></a>
            <a href="//search.szfw.org/cert/l/CX20120926001783002010" target="_blank"><img
                    src="${pageContext.request.contextPath}/static/picture/v-logo-2.png" alt="诚信网站"/></a>
            <a href="https://ss.knet.cn/verifyseal.dll?sn=e12033011010015771301369&ct=df&pa=461082" target="_blank"><img
                    src="${pageContext.request.contextPath}/static/picture/v-logo-1.png" alt="可信网站"/></a>
            <a href="http://www.315online.com.cn/member/315140007.html" target="_blank"><img
                    src="${pageContext.request.contextPath}/static/picture/v-logo-3.png" alt="网上交易保障中心"/></a>
            <a href="https://www.mi.com/service/buy/commitment/" target="_blank"><img
                    src="${pageContext.request.contextPath}/static/picture/ba10428a4f9495ac310fd0b5e0cf8370.png"
                    alt="诚信经营 放心消费"/></a>
        </div>
    </div>
    <div class="slogan ir">探索黑科技，小米为发烧而生</div>
</div>
<div id="J_modalWeixin" class="modal fade modal-hide modal-weixin" data-width="480" data-height="520">
    <div class="modal-hd">
        <a class="close" data-dismiss="modal"><i class="iconfont">&#xe602;</i></a>
        <span class="title">小米手机官方微信二维码</span>
    </div>
    <div class="modal-bd">
        <img alt="" src="${pageContext.request.contextPath}/static/picture/weixin.jpg" width="680" height="340"/>
    </div>
</div>
<!-- .modal-weixin END -->
<div class="modal modal-hide modal-bigtap-queue" id="J_bigtapQueue">
    <div class="modal-body">
        <span class="close" data-dismiss="modal" aria-hidden="true">退出排队</span>
        <div class="con">
            <div class="title">正在排队，请稍候喔！</div>
            <div class="queue-tip-box">
                <p class="queue-tip">当前人数较多，请您耐心等待，排队期间请不要关闭页面。</p>
                <p class="queue-tip">时常来官网看看，最新产品和活动信息都会在这里发布。</p>
                <p class="queue-tip">下载小米商城 App 玩玩吧！产品开售信息抢先知道。</p>
                <p class="queue-tip">发现了让你眼前一亮的小米产品，别忘了分享给朋友！</p>
                <p class="queue-tip">产品开售前会有预售信息，关注官网首页就不会错过。</p>
            </div>
        </div>

        <div class="queue-posters">
            <div class="poster poster-3"></div>
            <div class="poster poster-2"></div>
            <div class="poster poster-1"></div>
            <div class="poster poster-4"></div>
            <div class="poster poster-5"></div>
        </div>
    </div>
</div>
<!-- .xm-dm-queue END -->
<div id="J_bigtapError" class="modal modal-hide modal-bigtap-error">
    <span class="close" data-dismiss="modal" aria-hidden="true"><i class="iconfont">&#xe602;</i></span>
    <div class="modal-body">
        <h3>抱歉，网络拥堵无法连接服务器</h3>
        <p class="error-tip">由于访问人数太多导致服务器压力山大，请您稍后再重试。</p>
        <p>
            <a class="btn btn-primary" id="J_bigtapRetry">重试</a>
        </p>
    </div>
</div>

<div id="J_bigtapModeBox" class="modal fade modal-hide modal-bigtap-mode">
    <span class="close" data-dismiss="modal"><i class="iconfont">&#xe602;</i></span>
    <div class="modal-body">
        <h3 class="title">为防黄牛，请您输入下面的验证码</h3>
        <p class="desc">在防黄牛的路上，我们一直在努力，也知道做的还不够。<br> 所以，这次劳烦您多输一次验证码，我们一起防黄牛。
        </p>
        <div class="mode-loading" id="J_bigtapModeLoading">
            <img src="${pageContext.request.contextPath}/static/picture/loading.gif" alt="" width="32" height="32">
            <a id="J_bigtapModeReload" class="reload  hide" href="javascript:void(0);">网络错误，点击重新获取验证码！</a>
        </div>
        <div class="mode-action hide" id="J_bigtapModeAction">
            <div class="mode-con" id="J_bigtapModeContent"></div>
            <input type="text" name="bigtapmode" class="input-text" id="J_bigtapModeInput" placeholder="请输入正确的验证码">
            <p class="tip" id="J_bigtapModeTip"></p>
            <a class="btn  btn-gray" id="J_bigtapModeSubmit">确认</a>
        </div>
    </div>
</div>
<!-- .xm-dm-error END -->
<div id="J_modal-globalSites" class="modal fade modal-hide modal-globalSites" data-width="640">
    <div class="modal-hd">
        <a class="close" data-dismiss="modal"><i class="iconfont">&#xe602;</i></a>
        <span class="title">Select Region</span>
    </div>
    <div class="modal-bd">
        <h3>Welcome to Mi.com</h3>
        <p class="modal-globalSites-tips">Please select your country or region</p>
        <p class="modal-globalSites-links clearfix">
            <a href="//www.mi.com/index.html">Mainland China</a>
            <a href="//www.mi.com/hk/">Hong Kong</a>
            <a href="//www.mi.com/tw/">Taiwan</a>
            <a href="//www.mi.com/sg/">Singapore</a>
            <a href="//www.mi.com/my/">Malaysia</a>
            <a href="//www.mi.com/ph/">Philippines</a>
            <a href="//www.mi.com/in/">India</a>
            <a href="//www.mi.com/id/">Indonesia</a>
            <a href="//www.mi.com/en/">Global Home</a>
            <a href="//www.mi.com/mena/">MENA</a>
            <a href="//www.mi.com/pl/">Poland</a>
            <a href="//www.mi.com/ua/">Ukraine</a>
            <a href="//www.mi.com/ru/">Russia</a>
            <a href="//www.mi.com/vn/">Vietnam</a>
            <a href="//www.mi.com/mx/">Mexico</a>
            <a href="//www.mi.com/kr/">Korea</a>
            <a href="//www.mi.com/eg/">Egypt</a>
            <a href="//www.mi.com/th/">Thailand</a>
            <a href="//www.mi.com/es/">Spain</a>
            <a href="//www.mi.com/us/">United States</a>
            <a href="//www.mi.com/it/">Italy</a>
            <a href="//www.mi.com/fr/index.html">France</a>
            <a href="//www.mi.com/bd/">Bangladesh</a>
        </p>
    </div>
</div>
<!-- .modal-globalSites END -->
<%--<script src="${pageContext.request.contextPath}/static/js/base.min.js"></script>--%>
<script>
    (function () {
        MI.namespace('GLOBAL_CONFIG');
        MI.GLOBAL_CONFIG = {
            orderSite: '//order.mi.com',
            wwwSite: '//www.mi.com',
            cartSite: '//cart.mi.com',
            itemSite: '//item.mi.com',
            assetsSite: '//s01.mifile.cn',
            listSite: '//list.mi.com',
            searchSite: '//localhost:83/search/searchProduct',
            mySite: '//my.mi.com',
            damiaoSite: '//tp.hd.mi.com/',
            damiaoGoodsId: [],
            logoutUrl: '//order.mi.com/site/logout',
            staticSite: '//static.mi.com',
            quickLoginUrl: 'https://account.xiaomi.com/pass/static/login.html'
        };
        MI.setLoginInfo.orderUrl = MI.GLOBAL_CONFIG.orderSite + '/user/order';
        MI.setLoginInfo.logoutUrl = MI.GLOBAL_CONFIG.logoutUrl;
        MI.setLoginInfo.init(MI.GLOBAL_CONFIG);
        MI.miniCart.init();
        MI.updateMiniCart();
    })();
</script>

<script>
    var SITE_ID = "Search";
    var SEARCH_WORDS = "${keyWord}";
    var HongBaoHost = "//i.huodong.mi.com";
</script>
<%--<script src="${pageContext.request.contextPath}/static/js/goodslist.min.js"></script>--%>
<script>
    var _msq = _msq || [];
    _msq.push(['setDomainId', 100]);
    _msq.push(['trackPageView']);
    (function () {
        var ms = document.createElement('script');
        ms.type = 'text/javascript';
        ms.async = true;
        ms.src = '//s1.mi.com/stat/18/xmst.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ms, s);
    })();
</script>
</body>

</html>
