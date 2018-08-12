<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/10 0010
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN" xml:lang="zh-CN">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta charset="UTF-8" />
    <title>【小米6x及小米6x相关产品】-小米商城</title>
    <meta name="viewport" content="width=1226" />
    <meta name="description" content="小米6x的检索结果，小米官方网站包含小米6x价格及小米6x适配机型，官方推荐小米6x产品，帮助米粉挑选合适自己的小米6x商品。" />
    <meta name="keywords" content="小米6x" />
    <meta name="robots" content="noindex" />
    <link rel="shortcut icon" href="//s01.mifile.cn/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="//s01.mifile.cn/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/base.min.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/list.min.css" />
    <script type="text/javascript">
        var _head_over_time = (new Date()).getTime();
    </script>
</head>

<body>
<div class="site-topbar">
    <div class="container">
        <div class="topbar-nav">
            <a href="//www.mi.com/index.html">小米商城</a><span class="sep">|</span>
            <a href="https://www.miui.com/" target="_blank">MIUI</a><span class="sep">|</span>
            <a href="https://iot.mi.com/index.html">IoT</a><span class="sep">|</span>
            <a href="https://i.mi.com/" target="_blank">云服务</a><span class="sep">|</span>
            <a href="https://jr.mi.com?from=micom" target="_blank">金融</a><span class="sep">|</span>
            <a href="https://youpin.mi.com/" target="_blank">有品</a><span class="sep">|</span>
            <a href="https://shuidi.mi.com/" target="_blank">小爱开放平台</a><span class="sep">|</span>
            <a href="https://b.mi.com/?client_id=180100031058&masid=17409.0358" target="_blank">政企服务</a><span
                class="sep">|</span>
            <a href="#J_modal-globalSites" data-toggle="modal">Select Region</a>
        </div>
        <div class="topbar-cart" id="J_miniCartTrigger">
            <a class="cart-mini" id="J_miniCartBtn" onclick="location.href='http://localhost:84/cart/pages/cart/cartList'"><i
                    class="iconfont">&#xe60c;</i>购物车<span class="cart-mini-num J_cartNum"></span></a>
            <div class="cart-menu" id="J_miniCartMenu">
                <div class="loading">
                    <div class="loader"></div>
                </div>
            </div>
        </div>
        <div class="topbar-info" id="J_userInfo">
            <c:if test="${empty user }">
            <a class="link" href='http://localhost:81/manager/login' data-needlogin="true">登录</a><span class="sep">|</span>
            </c:if>
            <c:if test="${!empty user }">
                <a href="${pageContext.request.contextPath}/showUser"><span>欢迎您：${user}</span></a><span class="sep">|</span>
            </c:if>

            <a class="link" href='http://localhost:81/manager/register'>注册</a><span class="sep">|</span>
            <a class="link" href='http://localhost:84/cart/pages/order/myOrder'>订单</a>
        </div>
    </div>
</div>
<div class="site-header">
    <div class="container">
        <div class="header-logo">
            <a class="logo ir" href="//www.mi.com/index.html" title="小米官网">小米官网</a>
        </div>
        <div class="header-nav">
            <ul class="nav-list J_navMainList clearfix">
                <li id="J_navCategory" class="nav-category">
                    <a class="link-category" href="//list.mi.com"><span class="text">全部商品分类</span></a>
                </li>
                <li class="nav-item">
                    <a class="link" href="javascript: void(0);"><span class="text">小米手机</span><span
                            class="arrow"></span></a>
                    <div class="item-children">
                        <div class="container">
                            <ul class="children-list clearfix">
                                <li class="first">
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/mi8/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/pc-320-220-mi8.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/pc-320-220-mi8.png 2x"
                                                alt="小米8" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/mi8/">小米8</a>
                                    </div>
                                    <p class="price">2699元起</p>
                                    <div class="flags">
                                        <div class="flag">新品</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/mi8i/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/pc-320-220-mi8se.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/pc-320-220-mi8se.png 2x"
                                                alt="小米8 SE" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/mi8i/">小米8 SE</a>
                                    </div>
                                    <p class="price">1799元起</p>
                                    <div class="flags">
                                        <div class="flag">新品</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/max3/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/max3-320-220.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/max3-320-220.png 2x"
                                                alt="小米Max 3" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/max3/">小米Max 3</a>
                                    </div>
                                    <p class="price">1699元起</p>
                                    <div class="flags">
                                        <div class="flag">新品</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/mix2s/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/mix2s320-220white.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/mix2s320-220white.png 2x"
                                                alt="小米MIX 2S" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/mix2s/">小米MIX 2S</a>
                                    </div>
                                    <p class="price">3299元起</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/mix2/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/mix2320-220.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/mix2320-220.png 2x"
                                                alt="小米MIX 2" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/mix2/">小米MIX 2</a>
                                    </div>
                                    <p class="price">2599元起</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/mi6x/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/32022012085!160x110.jpg"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/32022012085!320x220.jpg 2x"
                                                alt="小米6X" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/mi6x/">小米6X</a>
                                    </div>
                                    <p class="price">1399元起</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="link" href="javascript: void(0);"><span class="text">红米</span><span class="arrow"></span></a>
                    <div class="item-children">
                        <div class="container">
                            <ul class="children-list clearfix">
                                <li class="first">
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/redmi6pro/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/6pro320-220.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/6pro320-220.png 2x"
                                                alt="红米6 Pro" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/redmi6pro/">红米6 Pro</a>
                                    </div>
                                    <p class="price">999元起</p>
                                    <div class="flags">
                                        <div class="flag">新品</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/redmi6/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/666320.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/666320.png 2x" alt="红米6"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/redmi6/">红米6</a>
                                    </div>
                                    <p class="price">799元</p>
                                    <div class="flags">
                                        <div class="flag">新品</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="http://www.mi.com/redmi6a/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/6A320.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/6A320.png 2x" alt="红米6A"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="http://www.mi.com/redmi6a/">红米6A</a>
                                    </div>
                                    <p class="price">599元</p>
                                    <div class="flags">
                                        <div class="flag">新品</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/redminote5"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/note5-320-220.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/note5-320-220.png 2x"
                                                alt="红米Note 5" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/redminote5">红米Note 5</a>
                                    </div>
                                    <p class="price">1099元起</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/redmis2/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/s2-320-220.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/s2-320-220.png 2x" alt="红米S2"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/redmis2/">红米S2</a>
                                    </div>
                                    <p class="price">999元起</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/redmi5/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/5P-320-220.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/5P-320-220.png 2x"
                                                alt="红米5 Plus" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/redmi5/">红米5 Plus</a>
                                    </div>
                                    <p class="price">999元起</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="link" href="javascript: void(0);"><span class="text">电视</span><span class="arrow"></span></a>
                    <div class="item-children">
                        <div class="container">
                            <ul class="children-list clearfix">
                                <li class="first">
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/mitv4/75/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/75.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/75.png 2x" alt="小米电视4 75英寸"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/mitv4/75/">小米电视4 75英寸</a>
                                    </div>
                                    <p class="price">8999元</p>
                                    <div class="flags">
                                        <div class="flag">新品</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/mitv4A/32/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/32.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/32.png 2x" alt="小米电视4A 32英寸"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/mitv4A/32/">小米电视4A 32英寸</a>
                                    </div>
                                    <p class="price">899元</p>
                                    <div class="flags">
                                        <div class="flag">热卖</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/mitv4A/43y"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/4a43.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/4a43.png 2x"
                                                alt="小米电视4A 43英寸青春版" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/mitv4A/43y">小米电视4A 43英寸青春版</a>
                                    </div>
                                    <p class="price">1499元</p>
                                    <div class="flags">
                                        <div class="flag">新品</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/mitv4A/50/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/50.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/50.png 2x" alt="小米电视4A 50英寸"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/mitv4A/50/">小米电视4A 50英寸</a>
                                    </div>
                                    <p class="price">1999元</p>
                                    <div class="flags">
                                        <div class="flag">热卖</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/mitv4A/55/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/4a55.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/4a55.png 2x"
                                                alt="小米电视4A 55英寸" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/mitv4A/55/">小米电视4A 55英寸</a>
                                    </div>
                                    <p class="price">2399元</p>
                                    <div class="flags">
                                        <div class="flag">热卖</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/p/1995.html"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/4a65555.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/4a65555.png 2x"
                                                alt="查看全部<br/>小米电视" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/p/1995.html">查看全部<br/>小米电视</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="link" href="javascript: void(0);"><span class="text">笔记本</span><span class="arrow"></span></a>
                    <div class="item-children">
                        <div class="container">
                            <ul class="children-list clearfix">
                                <li class="first">
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/mipad4/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="https://i1.mifile.cn/f/i/g/2015/cn-index/pingbanok.png"
                                                srcset="https://i1.mifile.cn/f/i/g/2015/cn-index/pingbanok.png 2x"
                                                alt="小米平板" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/mipad4/">小米平板</a>
                                    </div>
                                    <p class="price">1099元起</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/gamelaptop/?cfrom=search"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/xinbijiben.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/xinbijiben.png 2x" alt="小米游戏本 8代"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/gamelaptop/?cfrom=search">小米游戏本 8代</a>
                                    </div>
                                    <p class="price">6699元起</p>
                                    <div class="flags">
                                        <div class="flag">新品</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/mibookpro-gtx/?cfrom=search">
                                            <img src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                 data-src="//i1.mifile.cn/f/i/g/2015/cn-index/WechatIMG603.png"
                                                 srcset="//i1.mifile.cn/f/i/g/2015/cn-index/WechatIMG603.png 2x"
                                                 alt="小米笔记本15.6" GTX版 " width="160 " height="110 " /></a>
                                    </div>
                                    <div class="title "><a href="https://www.mi.com/mibookpro-gtx/?cfrom=search ">小米笔记本15.6"
                                        GTX版</a></div>
                                    <p class="price">6299元起</p>
                                    <div class="flags">
                                        <div class="flag">新品</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/migaminglaptop/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/320x220youxichuantu.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/320x220youxichuantu.png 2x"
                                                alt="小米游戏本" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/migaminglaptop/">小米游戏本</a>
                                    </div>
                                    <p class="price">5999元起</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/mibookpro/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/WechatIMG603.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/WechatIMG603.png 2x"
                                                alt="小米笔记本 Pro" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/mibookpro/">小米笔记本 Pro</a>
                                    </div>
                                    <p class="price">5599元起</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/mibookair-13/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//c1.mifile.cn/f/i/g/2015/video/bijiben32012.5!160x110.jpg"
                                                srcset="//c1.mifile.cn/f/i/g/2015/video/bijiben32012.5!320x220.jpg 2x"
                                                alt="小米笔记本 Air 系列" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/mibookair-13/">小米笔记本 Air 系列</a>
                                    </div>
                                    <p class="price">3599元起</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="link" href="javascript: void(0);"><span class="text">盒子</span><span class="arrow"></span></a>
                    <div class="item-children">
                        <div class="container">
                            <ul class="children-list clearfix">
                                <li class="first">
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/mibox4/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/hezi4.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/hezi4.png 2x" alt="小米盒子4"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/mibox4/">小米盒子4</a>
                                    </div>
                                    <p class="price">299元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/mibox4c/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/hezi4c.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/hezi4c.png 2x" alt="小米盒子4c"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/mibox4c/">小米盒子4c</a>
                                    </div>
                                    <p class="price">199元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/mibox3s/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/hezi.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/hezi.png 2x" alt="小米盒子3s"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/mibox3s/">小米盒子3s</a>
                                    </div>
                                    <p class="price">299元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/mibox3c/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/hezi3c.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/hezi3c.png 2x" alt="小米盒子3c"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/mibox3c/">小米盒子3c</a>
                                    </div>
                                    <p class="price">199元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/hezi3s/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/cn-index/hezi3zengq.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/cn-index/hezi3zengq.png 2x"
                                                alt="小米盒子3 增强版" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/hezi3s/">小米盒子3 增强版</a>
                                    </div>
                                    <p class="price">399元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/misurround/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//c1.mifile.cn/f/i/g/2015/cn-index/320x220.png"
                                                srcset="//c1.mifile.cn/f/i/g/2015/cn-index/320x220.png 2x" alt="小米家庭影院"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/misurround/">小米家庭影院</a>
                                    </div>
                                    <p class="price">2099元</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="link" href="//www.mi.com/p/2848.html"><span class="text">新品</span><span
                            class="arrow"></span></a>
                    <div class="item-children">
                        <div class="container">
                            <ul class="children-list clearfix">
                                <li class="first">
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/shouhuan3/?cfrom=search"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/shouhuan.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/shouhuan.png 2x" alt="小米手环3"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/shouhuan3/?cfrom=search">小米手环3</a>
                                    </div>
                                    <p class="price">169元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/miwifi4/?cfrom=search"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/luyouqi.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/luyouqi.png 2x" alt="小米路由器4"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/miwifi4/?cfrom=search">小米路由器4</a>
                                    </div>
                                    <p class="price">199元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/aispeaker-mini/?cfrom=search"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/xiaomixiaoaiai.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/xiaomixiaoaiai.png 2x"
                                                alt="小米小爱音箱mini" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/aispeaker-mini/?cfrom=search">小米小爱音箱mini</a>
                                    </div>
                                    <p class="price">169元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/projector/?cfrom=search"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/toiuyingyi.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/toiuyingyi.png 2x" alt="米家投影仪"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/projector/?cfrom=search">米家投影仪</a>
                                    </div>
                                    <p class="price">3999元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/mivr-1o/?cfrom=search"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/VR.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/VR.png 2x" alt="小米VR 一体机" width="160"
                                                height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/mivr-1o/?cfrom=search">小米VR 一体机</a>
                                    </div>
                                    <p class="price">1499元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/camera-360/?cfrom=search"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/shexiangji.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/shexiangji.png 2x" alt="小米米家智能摄像机 云台版"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/camera-360/?cfrom=search">小米米家智能摄像机 云台版</a>
                                    </div>
                                    <p class="price">199元</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="link" href="javascript: void(0);"><span class="text">路由器</span><span class="arrow"></span></a>
                    <div class="item-children">
                        <div class="container">
                            <ul class="children-list clearfix">
                                <li class="first">
                                    <div class="figure figure-thumb">
                                        <a href="https://item.mi.com/product/8105.html"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/xiaomiluyouqi4.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/xiaomiluyouqi4.png 2x" alt="小米路由器 4"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://item.mi.com/product/8105.html">小米路由器 4</a>
                                    </div>
                                    <p class="price">199元</p>
                                    <div class="flags">
                                        <div class="flag">双频双核</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//item.mi.com/1182400090.html?cfrom=search"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/4Q.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/4Q.png 2x" alt="小米路由器 4Q" width="160"
                                                height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//item.mi.com/1182400090.html?cfrom=search">小米路由器 4Q</a>
                                    </div>
                                    <p class="price">99元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/miwifi3a/?cfrom=search"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/3A.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/3A.png 2x" alt="小米路由器 3A" width="160"
                                                height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/miwifi3a/?cfrom=search">小米路由器 3A</a>
                                    </div>
                                    <p class="price">139元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/miwifi3g/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/3G.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/3G.png 2x" alt="小米路由器 3G" width="160"
                                                height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/miwifi3g/">小米路由器 3G</a>
                                    </div>
                                    <p class="price">249元</p>
                                    <div class="flags">
                                        <div class="flag">双千兆</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/miwifihd/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/PRO.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/PRO.png 2x" alt="小米路由器 HD/Pro"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/miwifihd/">小米路由器 HD/Pro</a>
                                    </div>
                                    <p class="price">499元起</p>
                                    <div class="flags">
                                        <div class="flag">大容量</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//localhost:83/search/searchProduct?keyWord=路由器-29"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/quanbuluyouqi.png"
                                                srcset="//i1.mifile.cn/f/i/g/2015/quanbuluyouqi.png 2x" alt="查看全部小米路由器"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//localhost:83/search/searchProduct?keyWord=路由器-29">查看全部小米路由器</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="link" href="javascript:void(0);"><span class="text">智能硬件</span><span class="arrow"></span></a>
                    <div class="item-children">
                        <div class="container">
                            <ul class="children-list clearfix">
                                <li class="first">
                                    <div class="figure figure-thumb">
                                        <a href="https://www.mi.com/aispeaker-mini/?cfrom=search"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="https://i1.mifile.cn/f/i/g/2015/xiaomixiaoaiai.png"
                                                srcset="https://i1.mifile.cn/f/i/g/2015/xiaomixiaoaiai.png 2x"
                                                alt="小米小爱音箱mini" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="https://www.mi.com/aispeaker-mini/?cfrom=search">小米小爱音箱mini</a>
                                    </div>
                                    <p class="price">169元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/miuav/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//c1.mifile.cn/f/i/g/2015/123321!160x110.jpg"
                                                srcset="//c1.mifile.cn/f/i/g/2015/123321!320x220.jpg 2x" alt="小米无人机"
                                                width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/miuav/">小米无人机</a>
                                    </div>
                                    <p class="price">2999元</p>
                                    <div class="flags">
                                        <div class="flag">航拍利器</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/water2/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//i1.mifile.cn/f/i/g/2015/xiaomijingshuiqi!160x110.jpg"
                                                srcset="//i1.mifile.cn/f/i/g/2015/xiaomijingshuiqi!320x220.jpg 2x"
                                                alt="小米净水器" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/water2/">小米净水器</a>
                                    </div>
                                    <p class="price">1999元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/roomrobot/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//c1.mifile.cn/f/i/g/2015/cn-index/saodijiqiren320-220!160x110.jpg"
                                                srcset="//c1.mifile.cn/f/i/g/2015/cn-index/saodijiqiren320-220!320x220.jpg 2x"
                                                alt="米家扫地机器人" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/roomrobot/">米家扫地机器人</a>
                                    </div>
                                    <p class="price">1699元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/dianfanbao/"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//c1.mifile.cn/f/i/g/2015/cn-index/dfb!160x110.jpg"
                                                srcset="//c1.mifile.cn/f/i/g/2015/cn-index/dfb!320x220.jpg 2x"
                                                alt="米家压力IH电饭煲" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/dianfanbao/">米家压力IH电饭煲</a>
                                    </div>
                                    <p class="price">999元</p>
                                </li>
                                <li>
                                    <div class="figure figure-thumb">
                                        <a href="//www.mi.com/p/3469.html?client_id=180100041086&masid=17409.0245"><img
                                                src="${pageContext.request.contextPath}/static/picture/placeholder-220!110x110.png"
                                                data-src="//c1.mifile.cn/f/i/16/goods/nav/air2!160x110.jpg"
                                                srcset="//c1.mifile.cn/f/i/16/goods/nav/air2!320x220.jpg 2x"
                                                alt="查看全部<br/>智能硬件" width="160" height="110"/></a>
                                    </div>
                                    <div class="title">
                                        <a href="//www.mi.com/p/3469.html?client_id=180100041086&masid=17409.0245">查看全部<br/>智能硬件</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="link" href="//www.mi.com/service/" target="_blank"><span class="text">服务</span></a>
                </li>
                <li class="nav-item">
                    <a class="link" href="http://www.xiaomi.cn/" target="_blank"><span class="text">社区</span></a>
                </li>
            </ul>
        </div>


        <div class="header-search">
            <form id="J_searchForm" class="search-form clearfix" action="//localhost:83/search/searchProduct" method="get">
                <label for="search" class="hide">站内搜索</label>
                <input type="hidden" name="uname" value="${user}">
                <input class="search-text" type="search" id="search" name="keyWord" autocomplete="off" data-search-config={ 'defaultWords':[{ 'Key': '小米6X', 'Rst':6},{ 'Key': '小米MIX&nbsp;2S', 'Rst':5},{ 'Key': '黑鲨游戏手机', 'Rst':3},{ 'Key': '红米Note&nbsp;5', 'Rst':6},{ 'Key': '红米5A', 'Rst':13},{ 'Key': '小米电视4C', 'Rst':5},{ 'Key': '电视32英寸', 'Rst':3},{ 'Key': '笔记本pro', 'Rst':5},{ 'Key': '空气净化器', 'Rst':11},{ 'Key': '净水器', 'Rst':8}]} />
                <input type="submit" class="search-btn iconfont" value="&#xe616;" />
                <div class="search-hot-words">
                    <a href="//localhost:83/search/searchProduct?keyWord=小米8">小米8</a>
                    <a href="//localhost:83/search/searchProduct?keyWord=小米MIX 2S">小米MIX 2S</a>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="breadcrumbs">
    <div class="container">
        <a href='//www.mi.com/index.html'>首页</a><span class="sep">&gt;</span>
        <a href="//localhost:83/search/searchProduct?keyWord=小米6x">全部结果</a><span class="sep">&gt;</span><span>小米6x</span> </div>
</div>


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
            staticSite: '//localhost:83/search/searchProduct',
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
