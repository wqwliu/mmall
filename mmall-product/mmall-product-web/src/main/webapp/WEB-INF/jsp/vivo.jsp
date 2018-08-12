<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/3 0003
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>

<html class="lt8" lang="en-US">

<html lang="en-US">
<!--<![endif]-->

<head>
    <meta charset="UTF-8">
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <title>【Y75s 全面屏 4GB+64GB】-vivo官方商城</title>
    <meta name="keywords" content='Y75s 全面屏 4GB+64GB，vivo官方商城' />
    <meta name="description" content='vivo官方商城正品推荐，专属游戏模式，畅玩更专注；前置1600万柔光自拍，照亮你的美；Jovi AI助理，畅享人工智能。' />
    <link rel="shortcut icon" href="https://shopstatic.vivo.com.cn/vivoshop/web/dist/img/favicon_7c51b3b.ico">
    <link href="${pageContext.request.contextPath}/static/css/iconfont_f0745dd.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/common-font_97cf836.css" class="J_replace_public" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/global_09b6d91.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/css/common_9e6036c.css" class="J_replace_public" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/layout_7098a09.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/css/dialog_232f414.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/css/home_dd195a2.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/prod-detail_90e2bcb.css" rel="stylesheet" type="text/css" />
</head>
<body class="">

<script>
    var ISHOMEHEAD = true;
</script>
<%@include file="head.jsp"%>

    <%--<input type="hidden" name="pageNavMappingIndex" id="pageNavMappingIndex" value="0" />
    <input type="hidden" id="preview" name="preview" value="" />
    <input type="hidden" id="salePrice" name="salePrice" value="${p.shopprice}" />
    <div class="wrapper">
        <div class="crumbs">
            <a class="first" href="/index.html">商城首页</a><b></b>
            <a href="/product/phone">手机产品</a>
            <b></b>
            <span>Y系列</span>
        </div>
    </div>--%>

    <div class="prod-container cl">

        <div class="wrapper">
            <div class="prod-container-top cl">

                <div class="prod-container-left">
                    <div id="prod-container-left">
                        <div id="j_SpecImgs" class="figure">
                            <ul id="bigImgUl">
                                <c:forEach items="${list}" var="l" varStatus="vs">
                                    <li><img src="${l}" alt="商品图片" /></li>
                                </c:forEach>
                               <%-- <li><img src="${pageContext.request.contextPath}/static/picture/5100_1530622336554hd_530x530.png" alt="商品图片" /></li>
                                <li><img src="${pageContext.request.contextPath}/static/picture/5100_1530622333984hd_530x530.png" alt="商品图片" /></li>
                                <li><img src="${pageContext.request.contextPath}/static/picture/5100_1530622335224hd_530x530.png" alt="商品图片" /></li>
                                <li><img src="${pageContext.request.contextPath}/static/picture/5100_1532327097104hd_530x530.png" alt="商品图片" /></li>
                                <li><img src="${pageContext.request.contextPath}/static/picture/5100_1530622337966hd_530x530.png" alt="商品图片" /></li>
                                <li><img src="${pageContext.request.contextPath}/static/picture/5100_1530622338964hd_530x530.png" alt="商品图片" /></li>--%>
                            </ul>
                        </div>
                        <div id="j_SpecItems" class="spec-items">
                            <div id="smallImgUl" class="spec-items-box  ">
                                <ul class="cl">
                                    <c:forEach items="${list}" var="l" varStatus="vs">
                                    <li>
                                        <a href="javascript:;"><img src="${l}"></a>
                                    </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="figure-btn-wrap ">
                                <a href="javascript:;" class="figure-btn-l figure-btn-disabled"></a>
                                <a href="javascript:;" class="figure-btn-r figure-btn-disabled"></a>
                            </div>
                        </div>

                        <div class="prod-corner-icon" style="background-image: url('${pageContext.request.contextPath}/static/images/1712254042621862_100x100.png')"></div>

                    </div>
                </div>

                <div class="prod-container-right" default-skuId="${p.pid}">
                    <h1><%--Y75s全网通 4GB+64GB--%>${p.pname}</h1>
                    <p class="promotion-words" id="promotionWords">
								<span>${p.pidentity}${user}
                            <%--【千元新旗舰】--%>
                        </span> <%--5.99英寸大屏，指纹面部双解锁！前置1600万AI美颜自拍！--%>
                    </p>


                        <div class="prod-summary-box cl">
                            <div class="table-cell summary-price">
                                <span class="now-price"><dfn>&yen;</dfn><%--1298--%>${p.shopprice}</span>
                                <span class="origin-price"><dfn>&yen;</dfn><%--1598--%>${p.marketprice}</span>
                            </div>
                        </div>
                        <div class="server-support-box" default-unameId="${user}">
                            <dl class="server-support cl">
                                <dt>商品支持：</dt>
                                <dd class="item" data-id="detail0"><i class="iconshop icon-font-success"></i>花呗分期</dd>
                                <dd class="item" data-id="detail1"><i class="iconshop icon-font-success"></i>以旧换新</dd>
                            </dl>
                            <div class="server-support-detail is-hb hidden" id="detail0">
                                <dl class="item">
                                    <dt class="name"><i class="iconshop icon-font-success"></i>花呗分期</dt>
                                    <dd class="info">商品支持花呗分期</dd>
                                </dl>
                            </div>
                            <div class="server-support-detail hidden" id="detail1">
                                <dl class="item">
                                    <dt class="name"><i class="iconshop icon-font-success"></i>可以使用换新鼓励金</dt>
                                    <dd class="info">换新鼓励金通过参加以旧换新回收旧手机以后获得，旧手机享受额外补贴 <a class="detail" href="https://shopact.vivo.com.cn/page/recycle">现在换机<i class="iconshop icon-arrow-r"></i></a>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <form id="prod-detail-form" method="post">
                            <input type="hidden" id="spuId" name="spuId" value="10323" />
                            <input type="hidden" id="cmdyCategoryId" name="cmdyCategoryId" value="274" />
                            <dl class="prod-params cl">

                                <dt>选择版本容量</dt>
                                <dd>
                                    <ul class="tags nettype-tags">
                                        <input type="hidden" id="netType" name="netType" value="58" />
                                        <input type="hidden" id="storage" name="storage" value="150" />
                                        <li netType="58" storage="150" class="on">
                                            <%--全网通&nbsp;4G+64G版本--%>${p.pname}<i></i>
                                        </li>
                                        <li netType="58" storage="88">
                                            ${p.pname}pro版本<i></i>
                                        </li>
                                    </ul>
                                </dd>

                                <dt>选择颜色</dt>
                                <dd>
                                    <ul class="tags color-box" id="j_colors" marketable="1">

                                        <li <%--class="sub-sku disabled"--%> skuInstallment="1" sku-store="0" sku-id="4975" sku-fullpay="0">
                                            <a class="color-eae1db " style="background-color: #eae1db" href="javascript:;"></a>
                                            香槟金 <i></i></li>

                                        <li <%--class="sub-sku on"--%> skuInstallment="1" sku-store="1" sku-id="5100" sku-fullpay="0">
                                            <a class="color-000000 " style="background-color: #000000" href="javascript:;"></a>
                                            磨砂黑 <i></i></li>

                                        <li <%--class="sub-sku disabled"--%> skuInstallment="1" sku-store="0" sku-id="5107" sku-fullpay="0">
                                            <a class="color-548dd4 " style="background-color: #548dd4" href="javascript:;"></a>
                                            深空蓝 <i></i></li>

                                        <li <%--class="sub-sku "--%> skuInstallment="1" sku-store="1" sku-id="5109" sku-fullpay="0">
                                            <a class="color-ff0000 " style="background-color: #ff0000" href="javascript:;"></a>
                                            魅力红 <i></i></li>
                                    </ul>
                                </dd>

                                <dt>选择套餐</dt>
                                <dd class="package-box">
                                    <ul class="tags package-tags cl J_package_tags">
                                        <li class="on" salePrice="${p.shopprice}">
                                            <h2 class="pkg-title">标准</h2>
                                        </li>
                                        <%--<li suiteCode="148843591486027263" salePrice="${p.marketprice}">
                                            <h2 class="pkg-title">豪华套餐</h2>
                                            <p class="pkg-price"><dfn>&yen;</dfn>${p.marketprice} <span class="red"> 省<dfn>&yen;</dfn>${p.shopprice/20}</span>
                                            </p>
                                        </li>--%>
                                        <li suiteCode="148965047936880984" salePrice="1447">
                                            <h2 class="pkg-title">超级豪华套餐</h2>
                                            <p class="pkg-price"><dfn>&yen;</dfn>${p.shopprice*2} <span class="red"> 省<dfn>&yen;</dfn>${p.shopprice/10}</span>
                                            </p>
                                        </li>
                                    </ul>

                                    <div class="package-container hidden J_package_container">
                                        <table class="package-table hidden J_suite_table" suiteCode="148843591486027263">
                                            <tr>
                                                <td class="main-prod">
                                                    <img src="${pageContext.request.contextPath}/static/picture/5100_1530622336554hd_250x250.png" alt="">
                                                    <h3>Y75s全网通 4G+64G</h3>
                                                </td>
                                                <td class="split-box"><span class="split"></span></td>
                                                <td class="ancillary-prods">
                                                    <ul>
                                                        <li class="ancillary-prod J_bundle_sku_box">
                                                            <a href="/product/9923" target="_blank">
                                                                <img class="ap-img" src="" />
                                                            </a>
                                                            <h3>vivo XE100耳机</h3>
                                                            <div class="color-box J_bundle_sku_color">
                                                                <span style="background-color: #d8d8d8; " class="ap-color color-d8d8d8 J_enable " imgsrc="commodity/68/4068_1531902211892hd_250x250.png" title="灰白色" bundleSkuId="4068"></span>
                                                            </div>
                                                        </li>

                                                    </ul>
                                                </td>
                                            </tr>
                                        </table>
                                        <table class="package-table hidden J_suite_table" suiteCode="148965047936880984">
                                            <tr>
                                                <td class="main-prod">
                                                    <img src="${pageContext.request.contextPath}/static/picture/5100_1530622336554hd_250x250.png" alt="">
                                                    <h3>Y75s全网通 4G+64G</h3>
                                                </td>
                                                <td class="split-box"><span class="split"></span></td>
                                                <td class="ancillary-prods">
                                                    <ul>
                                                        <li class="ancillary-prod J_bundle_sku_box">
                                                            <a href="/product/10091" target="_blank">
                                                                <img class="ap-img" src="" />
                                                            </a>
                                                            <h3>飞智 Wee拉伸手柄</h3>
                                                            <div class="color-box J_bundle_sku_color">
                                                                <span style="background-color: #262626; display:none" class="ap-color color-262626 J_unable " imgsrc="commodity/08/4508_1531884338122hd_250x250.png" title="星曜黑" bundleSkuId="4508"></span>
                                                            </div>
                                                        </li>

                                                    </ul>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </dd>

                                <dt>优惠活动 <a target="_blank" href="/helpcenter/broken-screen">详情</a></dt>
                                <dd>

                                    <ul class="tags service-tags">
                                        <li class="j_serviceTagItem service-tags-item seritem-icon-sui  " sku-id="4505" svc-price="${p.shopprice*0.9}">
                                            <div name="broken-svc" sku-id="4505" svc-price="99" broken-svc-id="526" title="第二件9折数量有限,先到先得,若用户同时购买增值服务,不共享">
                                                <label><i class="iconshop icon-sui seritem-icon"></i>第二件九折
                                                    <span class="item-price"><dfn>&yen;</dfn>${p.shopprice*0.9}</span></label>
                                            </div>
                                        </li>
                                    </ul>
                                </dd>

                                <dt>增值服务 <a target="_blank" href="/helpcenter/broken-screen">详情</a></dt>
                                <dd>
                                    <ul class="tags service-tags">
                                        <li class="j_serviceTagItem service-tags-item seritem-icon-yan  " sku-id="1638" svc-price="${p.shopprice/20}">
                                            <div class="service-item-hd">
                                                <label name="broken-svc" sku-id="1638" svc-price="69" delay-svc-id="527" title="半年延保">
                                                    <i class="iconshop icon-yan seritem-icon"></i>半年延保
                                                    <span class="item-price"><dfn>&yen;</dfn>${p.shopprice/20}</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li class="j_serviceTagItem service-tags-item seritem-icon-yan  " sku-id="1639" svc-price="${p.shopprice/10}">
                                            <div class="service-item-hd">
                                                <label name="broken-svc" sku-id="1639" svc-price="109" delay-svc-id="528" title="延保1年">
                                                    <i class="iconshop icon-yan seritem-icon"></i>一年延保
                                                    <span class="item-price"><dfn>&yen;</dfn>${p.shopprice/10}</span>
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </dd>

                                <!--说明文字-->
                                <div class="laser-info-popup" id="j_laserInfoPop">
                                    <h3 class="laser-info__title">服务介绍：</h3>
                                    <h3 class="laser-info__title">购买介绍：</h3>
                                    <ul class="laser-buy__introduce">
                                        <li class="item">
                                            <i class="item__index">1</i>
                                            <div class="item__text">选择手机参数</div>
                                        </li>
                                        <li class="item">
                                            <i class="item__index">2</i>
                                            <div class="item__text">添加镌刻信息</div>
                                        </li>
                                        <li class="item">
                                            <i class="item__index">3</i>
                                            <div class="item__text">提交订单</div>
                                        </li>
                                        <li class="item">
                                            <i class="item__index">4</i>
                                            <div class="item__text">支付成功</div>
                                        </li>
                                    </ul>
                                    <div class="hover-area"></div>
                                </div>
                                </dd>

                                <dt>数量</dt>
                                <dd class="order-num">
                                    <label id="dec" class="disabled">&nbsp;</label>
                                    <input id="add-num" type="text" maxlength="1" value="1" readonly />
                                    <label id="inc">&nbsp;</label>
                                    <small class="order-num-msg" id="order-num-msg">
                                        (仅限购5部)
                                    </small>
                                </dd>
                                <%--<dt id="installment_dt"><i class="installment-hd-icon"></i>花呗分期(可选)</dt>
                                <dd id="j_installment" class="installment-box">
                                    <ul class="tags installment-tags cl" id="J_skuInstallment">
                                        <li installmentNum="3">
                                            <p class="pkg-title"><dfn>&yen;</dfn>432.66 x 3期</p>
                                            <h2 class="pkg-price">（无息）</h2>
                                            <i class="prod-param-checked"></i>
                                        </li>
                                        <li installmentNum="6">
                                            <p class="pkg-title"><dfn>&yen;</dfn>226.06 x 6期</p>
                                            <h2 class="pkg-price">
                                                （手续费<dfn>&yen;</dfn>9.73/期）</h2>
                                            <i class="prod-param-checked"></i>
                                        </li>
                                        <li installmentNum="12">
                                            <p class="pkg-title"><dfn>&yen;</dfn>116.81 x 12期</p>
                                            <h2 class="pkg-price">
                                                （手续费<dfn>&yen;</dfn>8.65/期）</h2>
                                            <i class="prod-param-checked"></i>
                                        </li>
                                    </ul>
                                </dd>--%>
                            </dl>
                        </form>
                        <div class="choiceTotal-box" id="J_choiceTotal">
                            <div class="table-cell">
                                <div class="totalPrice">
                                    <dfn>&yen;</dfn>${p.shopprice}
                                </div>
                            </div>
                            <div class="table-cell">
                                已选： ${p.pname} 1件
                            </div>
                        </div>

                        <div id="j_normalBtns" class="btns prod-amount-normal cl hidden" data-btn-seat="main">

                            <button type="button" class="btn--lg btn-next J_buy-button btn-confirm add-cart">
                                <i class="btn-inner" title="加入购物车">加入购物车</i>
                            </button>
                            <button class="btn--lg btn-confirm now-buy" type="button" title="立即购买"><i class="btn-inner">立即购买</i></button>
                            <button class="btn--lg btn-confirm installment-buy hidden" type="button" title="分期购买"><i class="btn-inner">分期购买</i></button>
                            <div id="error-msg" class="red hidden"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="prod-main-info">
            <div class="prod-main-tab">
                <div class="prod-tab-box cl">
                    <ul class="pull-left">
                        <li class="tab-information current" v='information' data-name="详细信息" data-index="1">
                        </li>
                        <li class="tab-parameter" v='parameter' data-name="包装及规格参数" data-index="2">
                        </li>
                        <li class="tab-evaluate" v='evaluate' data-name="评价" data-index="3">
                        </li>
                        <li class="tab-evaluation" v='evaluation' data-name="评测" data-index="4" style="display: none">
                        </li>
                        <li class="tab-afterservice" v='afterservice' data-name="售后服务" data-index="5">
                        </li>
                    </ul>

                    <div class="thumb-goods cl">

                        <div class="figure pull-left">

                            <img id="j_smallPic" src="${pageContext.request.contextPath}/static/picture/5100_1530622336554hd_250x250.png" width="58" height="58" />

                        </div>

                        <div class="thumb-goods-des pull-left">
                            <div class="table-cell">
										<span class="table-cell-inner">
                            <div class="cl">
                                <h3 class="pull-left"
                                    title="Y75s全网通 4GB+64GB">Y75s全网通 4GB+64GB</h3>
                                    <span class="pull-left" id="J_fixed_totalPrice"><dfn>&yen;</dfn>${p.shopprice}</span>
									</div>
									<p class="thumb-goods-choiceTotal" id="J_fixed_totalDes">
										已选： ${p.pname} 1件
									</p>
									</span>
                            </div>
                        </div>
                    </div>

                    <div class="j_btnLaser-sm btns_laser prod-amount-fixed hidden" data-btn-seat="sub" data-laser>
                        <button class="btn--sm btn-confirm laser-buy J_laser-button" type="button" title="添加镌刻信息"><i class="btn-inner">添加镌刻信息</i></button>
                    </div>

                    <div class="prod-amount-fixed" data-btn-seat="sub">
                        <button class="btn--sm btn-next btn-confirm add-cart" type="button" title="加入购物车"><i class="btn-inner">加入购物车</i></button>
                        <button class="btn--sm btn-confirm installment-buy hidden" type="button" title="分期购买"><i class="btn-inner">分期购买</i></button>
                    </div>
                </div>
                <!--[if lt IE 9]>
                <div class="box-shadow"></div>
                <![endif]-->

            </div>

        </div>

        <style>
            @media screen and (max-width: 767px) {
                .copyright-text a {
                    color: inherit !important;
                }
            }

            .redshield {
                display: inline-block;
                margin: 0 0 -3px 3px;
                width: 18px;
                height: 18px;
                background: center no-repeat url(${pageContext.request.contextPath}/static/images/gssw-icon-x2_db0a7f6.png);
                background-size: contain;
            }
        </style>

        <ul id="side-bar" class="nolocked">
            <li class="iconshop icon-cart-fine shopcart">
                <div class="prompt"><span class="triangle"></span>购物车</div>
                <div class="contentbox shopcart-fixbox">
                    <span class="triangle"></span>
                    <ul></ul>
                    <div class="result">
                        <div>
                            <p></p>
                            <p class="rmb-symbol"></p>
                        </div>
                        <a class="clearing" href="http://localhost:84/cart/pages/cart/cartList" target="_blank">立即结算</a>
                    </div>
                </div>
                <span class="prodnum"></span>
            </li>
            <li class="iconshop icon-top backtop">
                <div class="prompt"><span class="triangle"></span>返回顶部</div>
            </li>
        </ul>
        <script>
            var webCtx = '',
                HOMEURL = 'https://www.vivo.com.cn',
                IMGHOSTURL = 'https://shopstatic.vivo.com.cn/vivoshop/',
                passportLoginUrlPrefix = 'https://passport.vivo.com.cn/v3/web/login/authorize?client_id=3&redirect_uri=';
        </script>

        <script src="${pageContext.request.contextPath}/static/js/jquery.min_f03e5a3.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/tweenmax.min_92cf05a.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/jquery.cookie_d5528dd.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/jquery.lazyload_8b427f9.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/jquery.nicescroll.min_f01d838.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/jquery-placeholder_e51dc06.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/clamp_a80c754.js" async defer></script>
        <script src="${pageContext.request.contextPath}/static/js/login_confirm_485e7b4.js" async defer></script>
        <script src="${pageContext.request.contextPath}/static/js/dialog_3933a1b.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/vivo-stat_dc86f87.js" async defer></script>
        <script src="${pageContext.request.contextPath}/static/js/vivo-track_d57c5ce.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/vivo-common_7c7431b.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/clamp_a80c754.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/modernizr_efebc45.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/easeljs-0.8.2.min_3cf4a98.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/header_21b9962.js"></script>
        <script>
            var spuId = "10323";
            var commodityType = '1';
            var imgHost = "https://shopstatic.vivo.com.cn/vivoshop/";
            var skuImageJsonStr = '([{"bigPic":"commodity/75/4975_1528966324241hd_530x530.png","hdPic":"commodity/75/4975_1528966324241hd_1080x1080.png","imageNo":"1528966324241hd","imageType":"","skuId":"4975","smallPic":"commodity/75/4975_1528966324241hd_250x250.png","thumbnailPic":"commodity/75/4975_1528966324241hd_100x100.png"},{"bigPic":"commodity/75/4975_1528966325450hd_530x530.png","hdPic":"commodity/75/4975_1528966325450hd_1080x1080.png","imageNo":"1528966325450hd","imageType":"","skuId":"4975","smallPic":"commodity/75/4975_1528966325450hd_250x250.png","thumbnailPic":"commodity/75/4975_1528966325450hd_100x100.png"},{"bigPic":"commodity/75/4975_1528966326396hd_530x530.png","hdPic":"commodity/75/4975_1528966326396hd_1080x1080.png","imageNo":"1528966326396hd","imageType":"","skuId":"4975","smallPic":"commodity/75/4975_1528966326396hd_250x250.png","thumbnailPic":"commodity/75/4975_1528966326396hd_100x100.png"},{"bigPic":"commodity/75/4975_1528966327364hd_530x530.png","hdPic":"commodity/75/4975_1528966327364hd_1080x1080.png","imageNo":"1528966327364hd","imageType":"","skuId":"4975","smallPic":"commodity/75/4975_1528966327364hd_250x250.png","thumbnailPic":"commodity/75/4975_1528966327364hd_100x100.png"},{"bigPic":"commodity/00/5100_1530622336554hd_530x530.png","hdPic":"commodity/00/5100_1530622336554hd_1080x1080.png","imageNo":"1530622336554hd","imageType":"","skuId":"5100","smallPic":"commodity/00/5100_1530622336554hd_250x250.png","thumbnailPic":"commodity/00/5100_1530622336554hd_100x100.png"},{"bigPic":"commodity/00/5100_1530622333984hd_530x530.png","hdPic":"commodity/00/5100_1530622333984hd_1080x1080.png","imageNo":"1530622333984hd","imageType":"","skuId":"5100","smallPic":"commodity/00/5100_1530622333984hd_250x250.png","thumbnailPic":"commodity/00/5100_1530622333984hd_100x100.png"},{"bigPic":"commodity/00/5100_1530622335224hd_530x530.png","hdPic":"commodity/00/5100_1530622335224hd_1080x1080.png","imageNo":"1530622335224hd","imageType":"","skuId":"5100","smallPic":"commodity/00/5100_1530622335224hd_250x250.png","thumbnailPic":"commodity/00/5100_1530622335224hd_100x100.png"},{"bigPic":"commodity/00/5100_1532327097104hd_530x530.png","hdPic":"commodity/00/5100_1532327097104hd_1080x1080.png","imageNo":"1532327097104hd","imageType":"","skuId":"5100","smallPic":"commodity/00/5100_1532327097104hd_250x250.png","thumbnailPic":"commodity/00/5100_1532327097104hd_100x100.png"},{"bigPic":"commodity/00/5100_1530622337966hd_530x530.png","hdPic":"commodity/00/5100_1530622337966hd_1080x1080.png","imageNo":"1530622337966hd","imageType":"","skuId":"5100","smallPic":"commodity/00/5100_1530622337966hd_250x250.png","thumbnailPic":"commodity/00/5100_1530622337966hd_100x100.png"},{"bigPic":"commodity/00/5100_1530622338964hd_530x530.png","hdPic":"commodity/00/5100_1530622338964hd_1080x1080.png","imageNo":"1530622338964hd","imageType":"","skuId":"5100","smallPic":"commodity/00/5100_1530622338964hd_250x250.png","thumbnailPic":"commodity/00/5100_1530622338964hd_100x100.png"},{"bigPic":"commodity/07/5107_1530622349480hd_530x530.png","hdPic":"commodity/07/5107_1530622349480hd_1080x1080.png","imageNo":"1530622349480hd","imageType":"","skuId":"5107","smallPic":"commodity/07/5107_1530622349480hd_250x250.png","thumbnailPic":"commodity/07/5107_1530622349480hd_100x100.png"},{"bigPic":"commodity/07/5107_1530622347077hd_530x530.png","hdPic":"commodity/07/5107_1530622347077hd_1080x1080.png","imageNo":"1530622347077hd","imageType":"","skuId":"5107","smallPic":"commodity/07/5107_1530622347077hd_250x250.png","thumbnailPic":"commodity/07/5107_1530622347077hd_100x100.png"},{"bigPic":"commodity/07/5107_1530622348314hd_530x530.png","hdPic":"commodity/07/5107_1530622348314hd_1080x1080.png","imageNo":"1530622348314hd","imageType":"","skuId":"5107","smallPic":"commodity/07/5107_1530622348314hd_250x250.png","thumbnailPic":"commodity/07/5107_1530622348314hd_100x100.png"},{"bigPic":"commodity/07/5107_1532327101958hd_530x530.png","hdPic":"commodity/07/5107_1532327101958hd_1080x1080.png","imageNo":"1532327101958hd","imageType":"","skuId":"5107","smallPic":"commodity/07/5107_1532327101958hd_250x250.png","thumbnailPic":"commodity/07/5107_1532327101958hd_100x100.png"},{"bigPic":"commodity/07/5107_1530622350949hd_530x530.png","hdPic":"commodity/07/5107_1530622350949hd_1080x1080.png","imageNo":"1530622350949hd","imageType":"","skuId":"5107","smallPic":"commodity/07/5107_1530622350949hd_250x250.png","thumbnailPic":"commodity/07/5107_1530622350949hd_100x100.png"},{"bigPic":"commodity/07/5107_1530622351894hd_530x530.png","hdPic":"commodity/07/5107_1530622351894hd_1080x1080.png","imageNo":"1530622351894hd","imageType":"","skuId":"5107","smallPic":"commodity/07/5107_1530622351894hd_250x250.png","thumbnailPic":"commodity/07/5107_1530622351894hd_100x100.png"},{"bigPic":"commodity/09/5109_1530622360189hd_530x530.png","hdPic":"commodity/09/5109_1530622360189hd_1080x1080.png","imageNo":"1530622360189hd","imageType":"","skuId":"5109","smallPic":"commodity/09/5109_1530622360189hd_250x250.png","thumbnailPic":"commodity/09/5109_1530622360189hd_100x100.png"},{"bigPic":"commodity/09/5109_1530622357779hd_530x530.png","hdPic":"commodity/09/5109_1530622357779hd_1080x1080.png","imageNo":"1530622357779hd","imageType":"","skuId":"5109","smallPic":"commodity/09/5109_1530622357779hd_250x250.png","thumbnailPic":"commodity/09/5109_1530622357779hd_100x100.png"},{"bigPic":"commodity/09/5109_1530622358970hd_530x530.png","hdPic":"commodity/09/5109_1530622358970hd_1080x1080.png","imageNo":"1530622358970hd","imageType":"","skuId":"5109","smallPic":"commodity/09/5109_1530622358970hd_250x250.png","thumbnailPic":"commodity/09/5109_1530622358970hd_100x100.png"},{"bigPic":"commodity/09/5109_1532327110565hd_530x530.png","hdPic":"commodity/09/5109_1532327110565hd_1080x1080.png","imageNo":"1532327110565hd","imageType":"","skuId":"5109","smallPic":"commodity/09/5109_1532327110565hd_250x250.png","thumbnailPic":"commodity/09/5109_1532327110565hd_100x100.png"},{"bigPic":"commodity/09/5109_1530622361546hd_530x530.png","hdPic":"commodity/09/5109_1530622361546hd_1080x1080.png","imageNo":"1530622361546hd","imageType":"","skuId":"5109","smallPic":"commodity/09/5109_1530622361546hd_250x250.png","thumbnailPic":"commodity/09/5109_1530622361546hd_100x100.png"},{"bigPic":"commodity/09/5109_1530622362446hd_530x530.png","hdPic":"commodity/09/5109_1530622362446hd_1080x1080.png","imageNo":"1530622362446hd","imageType":"","skuId":"5109","smallPic":"commodity/09/5109_1530622362446hd_250x250.png","thumbnailPic":"commodity/09/5109_1530622362446hd_100x100.png"}])';
            var skuImageJson = eval(skuImageJsonStr);
            var fullpaySkuIdSet = "";
            var defaultSkuId = '${p.pid}';
            var showBuyNow = "1";
            var isSecondBuy = false;
            var maxNumberPerUser = 5;
        </script>
        <script src="${pageContext.request.contextPath}/static/js/jquery.easing_6516449.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/simplestorage_d7ca67b.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/clamp.min_0c4f2b0.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/view_fe18cb8.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/view-hist_8d248d4.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/dialog_3933a1b.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/static/js/template_dd622e5.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/page_94fbdf7.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/index_5519ad4.js"></script>
    </div>
</body>

</html>
