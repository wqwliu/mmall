function getParameter(t, e) {
    var a = e || document.location.search, n = new RegExp("[?&]" + t + "=([^&]+)", "g"), i = n.exec(a), s = null;
    return null != i && (s = decodeURIComponent(i[1])), s
}

function previewFixed() {
    var t, e, a = 0, n = $(".prod-container-left"), i = n.outerHeight(!0), s = $(".prod-container").offset().top,
        e = $(".prod-container").outerHeight(!0), o = 0, r = !1;
    $(window).on({
        scroll: function () {
            o = $(this).scrollLeft(), t = $(this).scrollTop(), e = $(".prod-container").outerHeight(!0), e + s > t + i ? (a = Math.max($(".prod-container-left").offset().top - t, 20), $("#prod-container-left").css({
                position: "fixed",
                top: a,
                left: r ? -o : $(".prod-container-left").offset().left
            })) : (a = e - i, $("#prod-container-left").css({position: "absolute", top: a, left: 0}))
        }, resize: function () {
            r = document.documentElement.clientWidth < 1200, $(this).trigger("scroll")
        }
    }).trigger("resize")
}

function initSwitch() {
    var t = $("#smallImgUl ul").eq(0), e = t.find("li").outerWidth(!0), a = t.find("li").size(), n = 0;
    a > 4 ? (t.width(e * a), 0 == n ? $(".figure-btn-l").addClass("figure-btn-disabled") : $(".figure-btn-l").removeClass("figure-btn-disabled"), a % 4 == n ? $(".figure-btn-r").addClass("figure-btn-disabled") : $(".figure-btn-r").removeClass("figure-btn-disabled"), $(".figure-btn-wrap").removeClass("hidden"), $(".figure-btn-wrap").on("click", "a", function () {
        var i = $(this).index();
        1 == i ? (n++, n = Math.min(n % a, a - 4)) : (n--, n = Math.max(0, n)), t.stop(!0).animate({left: -n * e}, 300, function () {
            0 == n ? $(".figure-btn-l").addClass("figure-btn-disabled") : $(".figure-btn-l").removeClass("figure-btn-disabled"), a % 4 == n ? $(".figure-btn-r").addClass("figure-btn-disabled") : $(".figure-btn-r").removeClass("figure-btn-disabled")
        })
    })) : $(".figure-btn-wrap").addClass("hidden"), $("#j_SpecItems").on("mouseenter", "li", function () {
        return $(this).hasClass("current") ? !1 : ($(this).addClass("current").siblings().removeClass("current"), $("#j_smallPic").length && ($("#j_smallPic")[0].src = $(this).children("a").children("img")[0].src), $("#j_SpecImgs li").eq($(this).index()).css({
            display: "block",
            opacity: 0,
            zIndex: 9
        }).stop().animate({opacity: 1}, 800).siblings().css({zIndex: 1}).stop().animate({opacity: 0}, 500, function () {
            $(this).css({display: "none"})
        }), !1)
    }), $("#j_SpecItems li").first().trigger("mouseenter")
}

function changeSuiteSkuPic(t) {
    var e = imgHost + t.find("span.selected").attr("imgsrc");
    t.parents(".J_bundle_sku_box").find(".ap-img").attr("src", e)
}

function prodBtns() {
    $("body").on("click", ".add-cart", function () {
        var t = $(this);
        if (t.hasClass("btn-disabled") || t.hasClass("btn--wait")) return !1;
        t.addClass("btn--wait");
        var e = getProductParams(!0), a = e.num;
        console.log(e);
        console.log(t);
        debugger;
        isNaN(a) && (a = 1), a = a > maxNumberPerUser ? maxNumberPerUser : a, a = 1 > a ? 1 : a, $.ajax({
            type: "GET",
            /*url: webCtx + "/shoppingcart/cartAdd",*/
            url:"http://localhost:84/cart/cart/saveToCart",
            dataType:"jsonp",
            jsonp:"successCallback",
            /*data: $.param({skuId: e.skuId, num: a, sSkuIds: e.sSkuIds, bSkuIds: e.bSkuIds, suiteCode: e.suiteCode}, !0),*/
            data:{uname:e.uname, pid: e.skuId,pcount: a},
            success: function (e) {

                if (200 == e.retCode && ($errorMsg.hide(), $document.trigger("updateShopcartNum"), new Dialog({
                        title: "商品已成功加入购物车！",
                        icon: "success",
                        confirmBtn: !0,
                        cancelBtn: !0,
                        confirmText: "去结算",
                        cancelText: "继续逛逛",
                        confirmCallback: function () {
                            location.href = "http://localhost:84/cart/pages/cart/cartList"
                        }
                    })), 200 != e.retCode) if (e.retMsg.match("^{(.+:.+,*){1,}}$")) {
                    var a = $.parseJSON(e.retMsg);
                    new Dialog(8 == a.status ? {title: a.tip, confirmBtn: !0} : {title: a.msg, confirmBtn: !0})
                } else new Dialog({title: e.retMsg, confirmBtn: !0});
                t.removeClass("btn--wait")
            },
            error: function () {
                new Dialog({title: "网络异常，请刷新页面后重试", confirmBtn: !0}), t.removeClass("btn--wait")
            }
        })
    }), $("body").on("click", ".payall-order", function () {
        if ($(this).hasClass("btn--wait")) return !1;
        if (isAllowedSell()) {
            var t = getProductParams(), e = getHashObject().source_from || 3, a = getHashObject().source_type || !1,
                n = "/order/quick/confirm";
            $(this).addClass("btn--wait"), window.location = webCtx + n + "?" + $.param(t, !0) + (a ? "#source_type=" + a : "#source_from=" + e)
        }
    }), $("body").on("click", ".now-buy, .second-buy,.J_laser-button", function () {
        if ($(this).hasClass("btn--wait")) return !1;
        if (isAllowedSell()) {
            var t = getProductParams(), e = getHashObject().source_from || 3, a = getHashObject().source_type || !1,
                n = getHashObject().searchKeywordStr || !1,
                i = isSecondBuy ? "/second-buy/confirm" : "/order/quick/confirm";
            $(this).hasClass("J_laser-button") && (i = "/laser/confirm"), $(this).addClass("btn--wait");
            var s = webCtx + i + "?" + $.param(t, !0);
            s += a ? "#source_type=" + a : "#source_from=" + e, n && (s += s.indexOf("#") > 0 ? "&searchKeywordStr=" + n : "#searchKeywordStr=" + n), window.location = s
        }
    }), $("body").on("click", ".installment-buy", function () {
        var t = $(this);
        if (t.hasClass("btn--wait")) return !1;
        if (isAllowedSell()) {
            t.addClass("btn--wait");
            var e = $("#add-num").val(), a = parseFloat($("#salePrice").val()) * e, n = $(".color-box > .on"),
                i = n.attr("sku-id");
            $(".j_serviceTagItem.on").each(function () {
                var t = parseFloat($(this).attr("svc-price")) * e;
                a += t
            });
            var s = function () {
                var t = getProductParams(), e = getHashObject().source_from || 3, a = getHashObject().source_type || !1,
                    n = isSecondBuy ? "/second-buy/confirm" : "/order/quick/confirm";
                t.laser && (n = "/laser/confirm"), window.location = webCtx + n + "?" + $.param(t, !0) + (a ? "#source_type=" + a : "#source_from=" + e)
            };
            $.ajax({
                url: webCtx + "/product/getInstallmentDataDetail",
                data: {skuId: i, money: a},
                type: "GET",
                success: function (e) {
                    200 == e.retCode ? s() : (t.removeClass("btn--wait"), new Dialog({
                        title: "分期活动已结束！",
                        content: "请用选择其他方式支付",
                        confirmBtn: !0,
                        confirmText: "继续支付",
                        confirmCallback: function () {
                            s()
                        },
                        cancelBtn: !0,
                        cancelText: "确认",
                        cancelCallback: function () {
                            t.removeClass("btn--wait").addClass("hidden").siblings().removeClass("hidden"), vvsDetailskuInstallment.viewHtml()
                        }
                    }))
                }
            })
        }
    })
}

function attachEventAfterRemarkContent() {
    var t = 400;
    $(".evaluate-pic dd").unbind().css({
        display: "none",
        width: 0,
        height: 0
    }), $(".evaluate-pic").each(function (e, a) {
        function n() {
            o.stop().animate({width: 0, height: 0}, 300, function () {
                $(this).css({display: "none"})
            }), i.removeClass("current")
        }

        var i = $(a).find("dt a"), s = i.size(), o = $(a).find("dd"), r = $(a).find(".J_bigImgs_box");
        i.on("click", function () {
            var e = $(this);
            if ($(this).hasClass("current")) return n(), $(this).removeClass("current"), !1;
            $(this).addClass("current").siblings().removeClass("current");
            var a = new Image, i = w = h = 0;
            a.src = e.attr("data-img"), $(a).load(function () {
                r.find("img").size() <= 0 && r.html("<img>"), a.width && (a.width > a.height ? (w = a.width > t ? t : a.width, h = w * a.height / a.width) : (h = a.height > t ? t : a.height, w = h * a.width / a.height), o.css({display: "block"}).stop().animate({
                    width: w,
                    height: h
                }, 300), r.children("img").attr({src: e.attr("data-img")}).animate({width: w, height: h}, 300))
            }).error(function () {
                i++, $(a).load(), i > 3
            });
            var s = setInterval(function () {
                a.width && ($(a).trigger("load"), clearInterval(s))
            }, 1);
            return !1
        }), o.on("click", ".target-left", function (t) {
            var e = i.filter(".current").index();
            if ("IMG" == t.target.tagName.toUpperCase()) return n(), !1;
            switch ($(t.target).data("paging").toUpperCase()) {
                case"PREV":
                    e = Math.max(--e, 0), i.eq(e).hasClass("current") ? i.eq(s - 1).trigger("click") : i.eq(e).trigger("click");
                    break;
                case"NEXT":
                    e = Math.min(++e, s - 1), i.eq(e).hasClass("current") ? i.eq(0).trigger("click") : i.eq(e).trigger("click")
            }
        })
    })
}

function fetchRemarkHtml(t, e) {
    var a = $("#remarkHandler").attr("prodId"),
        n = $("#onlyPicChecked").size() > 0 ? $("#onlyPicChecked").hasClass("current") : !1,
        i = $(".prod-main-evaluate").empty();
    window.scrollTo(0, $(".prod-main-info:first").position().top), $.get(webCtx + "/product/remark", {
        prodId: a,
        onlyHasPicture: n,
        fullpaySkuIdSet: fullpaySkuIdSet,
        pageNum: t,
        pageSize: e
    }, function (t) {
        i.empty(), i.append(t), $(".pagination .go-num").unbind().on("input", function () {
            {
                var t = this.value;
                $(".pagination .j_go_ajax").attr("data-total")
            }
            /^\d+$/.test(t) || (this.value = "")
        }), $evaluateMain.css("min-height", $(".prod-evaluate-wrap").outerHeight() + $(".prod-evaluate-box").outerHeight()), attachEventAfterRemarkContent()
    })
}

function checkCollect(t, e) {
    var e = e || defaultSkuId;
    $.ajax({
        type: "GET",
        dataType: "json",
        url: webCtx + "/favorite/isMemberFavorite",
        data: {goodsId: e, goodsType: 0},
        success: function (e) {
            200 == e.retCode ? t.hasClass("collect") && t.removeClass("collect").addClass("collected") : t.hasClass("collected") && t.removeClass("collected").addClass("collect")
        },
        error: function () {
            t.hasClass("collected") && t.removeClass("collected").addClass("collect")
        }
    })
}

function isAllowedSell() {
    var t = !0, e = isSecondBuy ? "/product/second-buy/isAllowedSell" : "/product/isAllowedSell",
        a = getProductParams();
    return $.ajax({
        async: !1,
        type: "GET",
        url: webCtx + e,
        data: $.param({skuId: a.skuId, num: a.num, bSkuIds: a.bSkuIds, suiteCode: a.suiteCode, sSkuIds: a.sSkuIds}, !0),
        success: function (e) {
            1 != e.data ? (isSecondBuy && (window.productStore = 0, setCountDownStatus()), new Dialog({
                title: e.msg,
                confirmBtn: !0
            }), t = !1, $(".btn--wait").removeClass("btn--wait")) : $errorMsg.hide()
        },
        error: function () {
            new Dialog({title: "系统繁忙，请稍后重试！", confirmBtn: !0}), $(".btn--wait").removeClass("btn--wait"), t = !1
        }
    }), t
}

function getProductParams(t) {
    var t = t || !1, e = {}, a = $("div.prod-container-right").attr("default-skuId"),c=$("div.server-support-box").attr("default-unameId"), n = parseInt($("#add-num").val());
    n > maxNumberPerUser && (n = maxNumberPerUser, $("#add-num").val(n));
    var i = [];
    $(".j_serviceTagItem.on").each(function () {
        i.push(parseInt($(this).attr("sku-id")))
    });
    var s = $(".J_package_tags > li.on").attr("suiteCode");
    ("undefined" == typeof s || null == s) && (s = "");
    var o = [];
    "" != s && void 0 != s && $(".J_package_container").find("table[suiteCode='" + s + "'] .J_bundle_sku_box").each(function () {
        o.push(parseInt($(this).find(".J_bundle_sku_color span.selected").attr("bundleSkuId")))
    });
    var r = Number($("#J_skuInstallment").find(".on").attr("installmentNum")) || 0;
    return e.skuId = a ,e.uname= c, e.num = n, $("#j_laserSelectTrigger.on").length && (e.laser = !0, e.sourceReferUrl = location.href), t ? (e.sSkuIds = i, e.suiteCode = s, e.bSkuIds = o, e.fqNum = r) : (i.length > 0 && (e.sSkuIds = i), "" != s && void 0 != s && (e.suiteCode = s), o.length > 0 && (e.bSkuIds = o), r > 0 && (e.fqNum = r)), e
}

function choiceTotal() {
    var t = [], e = parseFloat($("#salePrice").val()), a = $("#add-num").val();
    $(".nettype-tags > .on,.color-box > .on").each(function () {
        t.push($(this).text().trim())
    }), $(".package-tags > .on").each(function () {
        t.push($(this).find("h2").text().trim()), e = Number($(this).attr("saleprice"))
    }), $(".j_serviceTagItem.on").each(function () {
        t.push($(this).find("label").eq(0).text().replace(/¥(\d|\.)+/, "").trim()), e += Number($(this).attr("svc-price"))
    }), t.push(a + "件"), e *= a, e = parseFloat(e.toPrecision(12)), e = (Math.floor(100 * e) / 100).toFixed(2), setNormalChoiceTotal(e, t), setFixedChoiceTotal(e, t)
}

function setNormalChoiceTotal(t, e) {
    $("#J_choiceTotal").html('<div class="table-cell"><div class="totalPrice"><dfn>&yen;</dfn>' + t + '</div></div><div class="table-cell">已选： ' + e.join("\n") + "</div>")
}

function setFixedChoiceTotal(t, e) {
    $("#J_fixed_totalPrice").html("<dfn>&yen;</dfn>" + t), $("#J_fixed_totalDes").html("已选：" + e.join("\n"))
}

function setCountDownStatus() {
    var t = ($(".btn-next"), $(".count-down-text")), e = $("#count-down-state"),
        a = $("#j_laserSelectTrigger").length && $("#j_laserSelectTrigger").hasClass("on");
    switchPayMethod().then(function (n, i, s, o, r) {
        if (isSecondBuy2iInstallment) $(".installment-buy").siblings("button").addClass("hidden"); else if (o) {
            var l = $(".btn-next");
            l.removeClass().addClass("btn-next " + n).attr("title", i).find(".btn-inner").text(i).end().siblings("button").addClass("hidden"), l.each(function () {
                var t = $(this);
                t.addClass(t.parent().hasClass("prod-amount-fixed") ? "btn--sm" : "btn--lg")
            })
        }
        switch (t.html(r.domStr), r.flag) {
            case-1:
                e.text("未开始");
                break;
            case 0:
                e.text("秒杀中");
                break;
            case 1:
                e.text("秒杀结束")
        }
        a && "立即秒杀" == i && !$("#J_skuInstallment").attr("curindex") ? ($(".j_btnsLaser").show().next().hide(), $(".j_btnLaser-sm").removeClass("hidden")) : ($(".j_btnsLaser").hide().next().show(), $(".j_btnLaser-sm").addClass("hidden"))
    })
}

function formatTime(t, e, a) {
    var n, i, s, o, r, l, d = -1;
    if (e > t) n = e - t, l = "开始", d = -1; else {
        if (!(a > t)) return {
            flag: 1,
            domStr: "秒杀结束倒计时：<span>00</span> 天 <span>00</span> 时 <span>00</span> 分 <span>00</span> 秒"
        };
        n = a - t, l = "结束", d = 0
    }
    return i = parseInt(n / 864e5) > 9 ? parseInt(n / 864e5) : "0" + parseInt(n / 864e5), s = parseInt(n / 36e5) % 24 > 9 ? parseInt(n / 36e5) % 24 : "0" + parseInt(n / 36e5) % 24, o = parseInt(n / 6e4) % 60 > 9 ? parseInt(n / 6e4) % 60 : "0" + parseInt(n / 6e4) % 60, r = parseInt(n % 6e4 / 1e3) > 9 ? parseInt(n % 6e4 / 1e3) : "0" + parseInt(n % 6e4 / 1e3), {
        flag: d,
        domStr: "秒杀" + l + "倒计时：<span>" + i + "</span> 天 <span>" + s + "</span> 时 <span>" + o + "</span> 分 <span>" + r + "</span> 秒"
    }
}

function throwImg(t) {
    var e = t[0].getBoundingClientRect(), a = $shopcart[0].getBoundingClientRect(), n = t.css("visibility", "visible");
    n.css({
        position: "fixed",
        zIndex: "9999",
        left: e.left,
        top: e.top,
        width: e.right - e.left,
        height: e.bottom - e.top
    }).animate({
        width: 50,
        height: 50,
        left: (e.left + e.right) / 2 - 25,
        top: (e.top + e.bottom) / 2 - 25
    }, function () {
        $(this).dequeue("verticalMove")
    }).animate({left: a.left}, 450, "linear").animate({top: a.top}, {
        queue: "verticalMove",
        duration: 450,
        easing: "easeInQuint",
        complete: function () {
            n.remove(), $document.trigger("updateShopcartNum")
        }
    })
}

function switchPayMethod() {
    var t = "btn-confirm add-cart", e = "加入购物车", a = !0, n = !0, i = formatTime(timeLong, uptimeLong, downtimeLong),
        s = i.domStr;
    return SKU.getParams().then(function (i) {
        1 == i.secondBuy ? (a = !1, uptimeLong > timeLong ? (t = "btn-disabled", e = "未开始") : timeLong >= downtimeLong ? (t = "btn-disabled", s = "秒杀结束", e = "秒杀结束", clearInterval(intervalId)) : 0 != i.productStore ? (t = "btn-confirm second-buy", e = "立即秒杀", n = !$(".btn-next").hasClass("second-buy")) : (t = "btn-disabled", e = "已秒完", s = "")) : 0 == i.marketable ? (t = "btn-disabled", e = "商品已下架", a = !1) : 0 == i.productStore ? (t = "btn-disabled", e = "商品已售罄", a = !1) : 1 == i.fullpayFlag ? (t = "btn-appointment payall-order", e = "全款预定", a = !1) : 1 == i.installment && (a = !0)
    }), {
        then: function (s) {
            "function" == typeof s && s.call(SKU, t, e, a, n, i)
        }
    }
}

function getHashObject(t) {
    if (t = t || location.hash, !t) return {};
    for (var t = t.substr(1), e = t.split("&"), a = {}, n = 0; n < e.length; ++n) {
        var i = e[n].split("=");
        2 == i.length && (a[i[0]] = i[1])
    }
    return a
}

$.fn.isOnScreen = function () {
    var t = $(window), e = {top: t.scrollTop(), left: t.scrollLeft()};
    e.right = e.left + t.width(), e.bottom = e.top + t.height();
    var a = this.offset();
    return a.right = a.left + this.outerWidth(), a.bottom = a.top + this.outerHeight(), !(e.right < a.left || e.left > a.right || e.bottom < a.top || e.top > a.bottom)
}, Vtrack(function () {
    this.clickStats({
        cfrom: 5300,
        pageview: "商品详情页",
        goodid: spuId,
        goodtype: parseInt(document.getElementById("pageNavMappingIndex").value) + 1,
        cid: Vtrack.getLocalData("vfe-cid") || "",
        is_done: 1
    }), $(window).on("beforeunload", function () {
        Vtrack.clickStats({cfrom: 5300, pageview: "商品详情页", lefttime: +new Date})
    })
}, function () {
    console.warn("失败")
}), $("#side-bar").on("mouseup", "li", function () {
    var t = $(this).attr("class"), e = 3;
    switch (t) {
        case"shopcart":
            e = 1;
            break;
        case"service":
            e = 2;
            break;
        case"feedback":
            e = 4;
            break;
        case"backtop":
            e = 5
    }
    Vtrack.clickStats({cfrom: 5301, pageview: "商品详情页", name: "浮动图标", position: e})
});
var isDoneBanner = 1;
$(window).on("scroll", function () {
    var t = $(".tab-information"), e = t.isOnScreen();
    e && isDoneBanner && (Vtrack.clickStats({
        cfrom: 5306,
        pageview: "商品详情页",
        name: t.attr("data-name"),
        tab_id: t.attr("data-index"),
        page_id: ""
    }), isDoneBanner = 0)
}).trigger("scroll"), $("body").on("click", ".add-cart, .now-buy, .second-buy, .J_laser-button, .btn-appointment, .installment-buy", function () {
    var t = $(this);
    if (t.hasClass("add-cart")) {
        var e = 2;
        t.parent().hasClass("prod-amount-fixed") && (e = 1), Vtrack.clickStats({
            cfrom: 5302,
            pageview: "商品详情页",
            position: e
        })
    } else {
        var a = localStorage.getItem("login_flag_tmp");
        a && Vtrack.setLocalData("login_flag", a, !1, !0), Vtrack.clickStats({
            cfrom: 5303,
            pageview: "商品详情页",
            name: t.text(),
            login_flag: localStorage.getItem("login_flag_tmp") || ""
        })
    }
}), String.prototype.trim = function () {
    return $.trim(this)
}, window.productStore = window.productStore || 0;
var spuId = window.spuId || "", webCtx = window.webCtx || "", IMGHOSTURL = window.IMGHOSTURL || "",
    passportLoginUrlPrefix = window.passportLoginUrlPrefix || "", imgHost = window.imgHost || "",
    showBuyNow = window.showBuyNow || "0", showBuyNow = 1 == showBuyNow, fullpaySkuIdSet = window.fullpaySkuIdSet || "",
    maxNumberPerUser = window.maxNumberPerUser || 5, skuImageJson = window.skuImageJson || [],
    isSecondBuy = window.isSecondBuy || !1, intervalId = null, timeLong = window.timeLong || 0,
    uptimeLong = window.uptimeLong || 0, downtimeLong = window.downtimeLong || 0, isSecondBuy2iInstallment = !1,
    $errorMsg = null, $document = $(document), $shopcart = null, dialogModel = function (t, e, a, n, i) {
        new Dialog({title: t, content: e, icon: a, confirmBtn: !0, cancelBtn: n, confirmCallback: i})
    }, SPU = {
        marketable: !1, secondBuy: !1, init: function () {
            this.getParams()
        }, getParams: function () {
            this.secondBuy = window.isSecondBuy || !1, this.marketable = "0" != $("#j_colors").attr("marketable")
        }
    }, SKU = {
        elemWrap: null,
        elems: null,
        data: {id: 0, productStore: 0, marketable: !1, secondBuy: !1, installment: !1, fullpayFlag: !1},
        init: function () {
            this.elemWrap = $("#j_colors"), this.elems = this.elemWrap.find(".sub-sku"), this.data.marketable = SPU.marketable, this.data.secondBuy = SPU.secondBuy, !SPU.marketable && this.elems.filter(".on").size() < 1 && this.elems.not(".disabled").filter(":first").addClass("on"), this.getParams()
        },
        getParams: function () {
            var t = this.elems.filter(".on"), e = t.attr("sku-id"), a = "1" == t.attr("skuinstallment"),
                n = "0" != t.attr("sku-fullpay"), i = t.attr("sku-store");
            return $.extend(SKU.data, {id: e, productStore: i, fullpayFlag: n, installment: a}), this
        },
        then: function (t) {
            "function" == typeof t && t.call(this, this.data)
        }
    }, vvsDetailskuInstallment = {
        viewHtml: function () {
            var t = this, e = $("#add-num").val(), a = parseFloat($("#salePrice").val()) * e, n = $(".color-box > .on"),
                i = n.attr("sku-id");
            $(".j_serviceTagItem.on").each(function () {
                var t = parseFloat($(this).attr("svc-price")) * e;
                a += t
            }), t.getData(i, parseFloat(a), n)
        }, getData: function (t, e, a) {
            var n = this;
            return "1" == a.attr("skuinstallment") ? $.ajax({
                url: webCtx + "/product/getInstallmentDataDetail",
                data: {skuId: t, money: e},
                type: "GET",
                success: function (t) {
                    if (200 == t.retCode) {
                        var e = t.antInstallment;
                        n.setDom(e), $("#installment_dt,#j_installment").show()
                    } else a.attr("skuinstallment", 0), $("#installment_dt,#j_installment").hide()
                }
            }) : $("#installment_dt,#j_installment").hide(), null
        }, setDom: function (t) {
            var e = $("#J_skuInstallment"), a = t.perInstallmentInfoList, n = "", i = e.attr("curIndex");
            $.each(a, function (t, e) {
                n += [i == t ? '<li class="on" installmentNum="' + e.num + '">' : '<li installmentNum="' + e.num + '">', '	<p class="pkg-title"><dfn>&yen;</dfn>' + e.perPay + " x " + e.num + "期</p>", e.userPerFeePay > 0 ? '<h2 class="pkg-price">（手续费<dfn>&yen;</dfn>' + e.userPerFeePay + "/期）</h2>" : '<h2 class="pkg-price">（无息）</h2>', '	<i class="prod-param-checked"></i>', "</li>"].join("\n")
            }), e.html(n)
        }
    };
$(function () {
    SPU.init(), SKU.init(), $errorMsg = $("#error-msg"), $shopcart = $("#side-bar .shopcart"), window.productStore = parseInt($(".color-box>li.on").attr("sku-store")), SKU.data.secondBuy ? (setCountDownStatus(), intervalId = setInterval(function () {
        timeLong += 1e3, setCountDownStatus()
    }, 1e3)) : 1 == SKU.data.fullpayFlag || showBuyNow && $(".now-buy").removeClass("hidden"), $(".btns").removeClass("hidden"), void function () {
        ~function () {
            if (0 == $(".gift-item").size()) return !1;
            var t = ['<div class="giftItem-panel hidden " id="J_giftItemPanel" >', "	<table >", "		<tr>", "			<td >", "				<a>", "					<img>", "				</a>", "				<h3></h3>", "				<p></p>", "			</td>", "		</tr>", "	</table>", "</div>"].join("\n"),
                e = $(t), a = e.find("a")[0], n = e.find("img")[0], i = e.find("h3")[0], s = e.find("p")[0];
            e.appendTo("body"), e.css("visibility", "hidden"), e.timer = null, $(".gift-item").on({
                mouseenter: function () {
                    var t = $(this), o = t.offset(), r = t.attr("spu-id"), l = t.attr("sku-id"), d = t.attr("sku-name"),
                        c = t.attr("sku-salePrice"), u = t.attr("sku-smallPic");
                    a.href = r + "?colorSkuid=" + l, a.target = "_blank", n.src = u, i.innerHTML = d, s.innerHTML = c > 0 ? "<dfn>&yen;</dfn>" + c : "", clearTimeout(e.timer), e.stop(!0, !0).animate({
                        top: o.top + $(this).height() + 15,
                        left: o.left - e.outerWidth(!0) / 2 + t.width() / 2 - 8
                    }, 150, function () {
                        $(this).stop(!0).css("visibility", "visible").fadeIn(150)
                    })
                }, mouseleave: function () {
                    e.timer = setTimeout(function () {
                        e.stop(!0).fadeOut(150)
                    }, 400)
                }
            }), e.on({
                mouseenter: function () {
                    clearTimeout(e.timer)
                }, mouseleave: function () {
                    e.timer = setTimeout(function () {
                        e.stop(!0).fadeOut(150)
                    }, 150)
                }
            })
        }(), previewFixed(), initSwitch(), $.ajax({
            type: "GET",
            dataType: "json",
            url: webCtx + "/favorite/count",
            data: {spuId: spuId, goodsType: 0},
            success: function (t) {
                200 == t.retCode && $("#favCount").text(t.retMsg)
            }
        });
        var t = $("#j_CollectTrigger").parent();
        checkCollect(t, $(".color-box>li.on:first").attr("sku-id")), $("#j_CollectTrigger").parent().on("click", function () {
            if (!LoginConfirm.isLogin()) return void LoginConfirm.redirect();
            var t = $(this), e = $(".color-box>li.on:first").attr("sku-id") || defaultSkuId;
            return t.hasClass("collected") ? ($.ajax({
                data: {goodsId: e, goodsType: 0},
                type: "POST",
                dataType: "json",
                url: webCtx + "/my/favorite/remove",
                success: function (e) {
                    200 == e.retCode ? ($("#favCount").text(parseInt($("#favCount").text()) - 1), t.addClass("collect").removeClass("collected")) : 500 == e.retCode && dialogModel("失败", "您已经取消收藏过此商品，请刷新重试！", "warning")
                }
            }), !1) : void $.ajax({
                data: {goodsId: e, goodsType: 0},
                type: "POST",
                dataType: "json",
                url: webCtx + "/my/favorite/add",
                success: function (e) {
                    200 == e.retCode ? (t.removeClass("collect").addClass("collected"), $("#favCount").text(parseInt($("#favCount").text()) + 1)) : dialogModel("失败", "您已经收藏过此商品，请刷新重试！", "warning")
                },
                error: function () {
                    LoginConfirm.redirect()
                }
            })
        }), $("#J_Share a").each(function () {
            var t = $(this).attr("href");
            $(this).attr("href", encodeURI(t))
        }), $("#J_Share").hover(function () {
            $(this).find(".share-box").stop(!0, !0).fadeIn()
        }, function () {
            $(this).find(".share-box").stop(!0, !0).fadeOut()
        })
    }(), void function () {
        function t(t) {
            $.ajax({
                type: "get",
                dataType: "json",
                url: webCtx + "/product/getCommodityPostList?t=" + +new Date,
                data: {spuId: spuId, pageNum: t, pageSize: 10, preview: $("#preview").val()},
                success: function (t) {
                    if (t && 200 == t.retCode && (t.total > 0 && ($(".tab-evaluation").show().data("data-pageNum", t.pageNum), t.pageNum > 1 && Vtrack.clickStats({
                            cfrom: 5304,
                            pageview: "商品详情页",
                            name: "评测",
                            tab_id: 4,
                            page_id: t.pageNum
                        })), 1 == t.total && a(t.postList[0].id, 1), t.total > 1)) {
                        var n = template("reviewTpl", {lists: t.postList});
                        $("#reviewList").html(n);
                        for (var i = document.querySelector("#reviewList").children, s = 0; s < i.length; s++) {
                            var o = i[s].children[1], r = i[s].children[2];
                            $clamp(o, {clamp: 1}), $clamp(r, {clamp: 2})
                        }
                        e(t.pageNum, t.totalPage)
                    }
                }
            })
        }

        function e(e, a) {
            h ? ($("html,body").animate({scrollTop: $(".prod-main-info").offset().top}, 0), h.render(e)) : h = new vivoPage("#page", e, a, function (e) {
                t(e)
            })
        }

        function a(t, e) {
            $.ajax({
                type: "get",
                dataType: "json",
                url: webCtx + "/product/getCommodityPostDetail?t=" + +new Date,
                data: {id: t, preview: $("#preview").val()},
                success: function (a) {
                    if (a && 200 == a.retCode) {
                        if (1 == e) n = a.post; else {
                            var a = a.post, i = $(".evaluation-dialog-box"), s = $(".prod-main-info .prod-main-box"),
                                o = $(".evaluation-dialog-from");
                            if (i.find("h1").text(a.postTitle), i.css("display", "block").find(".cut").html(a.message), s.css("z-index", 999), $("html,body").css("overflow-y", "hidden"), i.find("img").each(function () {
                                    var t = $(this), e = t.attr("file");
                                    e && t.attr("src", e)
                                }), a.source) o.hide(); else {
                                var r = "本文转自vivo社区";
                                a.author && (r += " 作者：" + a.author), o.text(r)
                            }
                            i.find(".evaluation-dialog").scrollTop(0)
                        }
                        Vtrack.clickStats({
                            cfrom: 5305,
                            pageview: "商品详情页",
                            goodid: spuId,
                            goodtype: parseInt(document.getElementById("pageNavMappingIndex").value) + 1,
                            pingce_id: t
                        })
                    }
                }
            })
        }

        var n, i = $(".prod-main-info"), s = i.find(".prod-tab-box ul li"), o = i.find(".prod-main-box"), r = 0,
            l = i.offset().top, d = i.find(".prod-main-tab"), c = d.find(".thumb-goods"),
            u = (d.find(".prod-amount-fixed"), !1);
        $.ajax({
            type: "POST",
            dataType: "json",
            url: webCtx + "/product/countRemark",
            data: {spuId: spuId, fullpaySkuIdSet: fullpaySkuIdSet},
            success: function (t) {
                $("#remarkCountSpan").text(" (" + t.remarkCount + ") ")
            }
        });
        var m = 1;
        $(".tab-evaluation").on("click", function () {
            var t = $(".prod-main-evaluation div.wrapper");
            if ("object" == typeof n && 1 == n.isView && n.message.length > 0 && 1 == m) {
                var e = '<div class="evaluation-tit-info"><h3>' + n.postTitle + "</h3>";
                if (!n.source) {
                    var a = "本文转自vivo社区";
                    n.author && (a += " 作者：" + n.author), e += "<p>" + a + "</p>"
                }
                e += "</div>", t.html(e + n.message), m = 0
            }
        });
        var f = document.getElementById("promotionWords");
        $clamp(f, {clamp: 3}), $(".evaluation-info").on("click", ".evaluation-info-list", function () {
            var t = $(this).attr("data-id");
            a(t)
        }), $(".evaluation-dialog-box .extra-icon").on("click", function () {
            $(".evaluation-dialog-box").css("display", "none"), $(".prod-main-info .prod-main-box").css("z-index", 1), $("html,body").css("overflow-y", "auto")
        }), "1" == commodityType && t(1);
        var h;
        $("#remarkHandler").click(function () {
            u || fetchRemarkHtml(), u = !0
        }), $("body").on("click", ".btn-evaluator", function () {
            !LoginConfirm.isLogin() && LoginConfirm.redirect();
            var t = spuId;
            $.ajax({
                type: "POST",
                dataType: "json",
                url: webCtx + "/my/remark/addRemarkVerify",
                data: {prodId: t},
                success: function (t) {
                    200 == t.retCode ? window.location.href = webCtx + "/my/remark/unRemark-prod" : 700 == t.retCode ? dialogModel("失败", t.retMsg, "warning") : 710 == t.retCode ? dialogModel("失败", t.retMsg, "warning") : 600 == t.retCode ? LoginConfirm.redirect() : dialogModel("失败", "系统错误！", "warning")
                }
            })
        }), $("body").on("click", ".evaluate-toolbar li", function () {
            $(this).hasClass("current") || ($(this).addClass("current").siblings().removeClass("current"), fetchRemarkHtml())
        }), $("body").on("click", ".pagination .j_go_ajax", function () {
            var t = ($(this).attr("data-url"), $(this).attr("data-total")), e = $(this).attr("pageSize"),
                a = $(this).parent().find("input").val();
            a && /^\d+$/.test(a) && parseInt(a) <= t && fetchRemarkHtml(a, e)
        }), s.on({
            click: function () {
                return $(this).hasClass("current") ? !1 : ($(this).addClass("current").siblings().removeClass("current"), 0 >= r && $("body,html").animate({scrollTop: l + 1}, 1), o.find(".prod-main-" + $(this).attr("v")).css({display: "block"}).siblings().css({display: "none"}), Vtrack.clickStats({
                    cfrom: 5304,
                    pageview: "商品详情页",
                    name: $(this).attr("data-name"),
                    tab_id: $(this).attr("data-index"),
                    page_id: $(this).attr("data-pageNum") || 1
                }), !1)
            }
        }), $(window).on({
            load: function () {
                $(this).trigger("scroll")
            }, scroll: function () {
                r = i[0].getBoundingClientRect().top, 0 >= r ? (i.css({paddingTop: 81}), d.addClass("fixed"), c.show()) : (i.css({paddingTop: 0}), d.removeClass("fixed"), c.hide())
            }
        })
    }(), void function () {
        var t = function (t) {
            t.hasClass("disabled") || t.addClass("disabled")
        }, e = function (t) {
            t.hasClass("disabled") && t.removeClass("disabled")
        }, a = {
            flash: function () {
                var t = 0, e = setInterval(function () {
                    return 5 == t ? (clearInterval(e), void($("#order-num-msg").hasClass("red") && $("#order-num-msg").toggleClass("red"))) : ($("#order-num-msg").toggleClass("red"), void t++)
                }, 300)
            }
        }, n = $("#add-num").val();
        n && parseInt(n) > 1 && $("#dec").removeClass("disabled"), $("#inc").click(function () {
            var t = parseInt($("#add-num").val());
            return t >= maxNumberPerUser ? void a.flash() : ($("#add-num").val(t + 1), t + 1 > 1 && e($("#dec")), vvsDetailskuInstallment.viewHtml(), void choiceTotal())
        }), $("#dec").click(function () {
            if ($(this).hasClass("disabled")) return !1;
            var a = parseInt($("#add-num").val());
            1 >= a || (e($(this)), $("#add-num").val(a - 1), 1 >= a - 1 && t($(this)), vvsDetailskuInstallment.viewHtml(), choiceTotal())
        })
    }(), void function () {
        $(".J_bundle_sku_box").each(function () {
            if (0 == $(this).find("span.J_enable").size()) {
                var t = $(this).parents(".J_suite_table").attr("suiteCode");
                $(".J_package_tags").find("li[suiteCode='" + t + "']").addClass("disabled")
            } else $(this).find("span.J_enable:first").addClass("selected")
        }), $("body").on("click", ".package-tags li", function () {
            if ($(this).hasClass("disabled")) return !1;
            $(this).addClass("on").siblings().removeClass("on"), $("#salePrice").val(parseFloat($(this).attr("salePrice"))), vvsDetailskuInstallment.viewHtml(), choiceTotal();
            var t = $(this).attr("suiteCode"), e = $(".package-container");
            if (void 0 == t) return void e.hide();
            e.show();
            var a = e.find("table[suiteCode='" + t + "']");
            a.show(), a.siblings().hide(), a.find(".ancillary-prod").each(function () {
                var t = $(this).find(".color-box");
                changeSuiteSkuPic(t)
            })
        }), $("body").on("click", ".color-box span", function () {
            $(this).hasClass("selected") || ($(this).addClass("selected").siblings().removeClass("selected"), changeSuiteSkuPic($(this).parent()))
        })
    }(), prodBtns()
}), $(function () {
    $(".nettype-tags > li").on("click", function () {
        var t = $(this);
        t.addClass("on").siblings().removeClass("on"), $("#netType").val(t.attr("nettype")), $("#storage").val(t.attr("storage")), $("#prod-detail-form").attr("action", webCtx + "/product/querySpuIdByParams").submit()
    }), $(".service-tags > .service-tags-item").mouseenter(function () {
        $(this).addClass("chgstat")
    }).mouseleave(function () {
        $(this).removeClass("chgstat")
    }), $(".service-tags").each(function () {
        var t = $(this), e = t.find(".j_serviceTagItem");
        e.on("click", function () {
            var t = $(this);
            t.siblings().removeClass("on"), t.toggleClass("on"), vvsDetailskuInstallment.viewHtml(), choiceTotal()
        }).on("selectstart", !1), t.find(".child-list").children().on("click", function (a) {
            a.stopPropagation();
            var n = $(this);
            n.hasClass("on") ? (n.removeClass("on"), e.removeClass("on").attr({
                "sku-id": "",
                "svc-price": 0
            })) : (n.addClass("on").siblings().removeClass("on"), t.find("label").eq(0).html(n.find("label").html()), e.addClass("on").attr({
                "sku-id": n.attr("sku-id"),
                "svc-price": n.attr("svc-price"),
                "data-flag": n.index()
            })), e.removeClass("chgstat"), vvsDetailskuInstallment.viewHtml(), choiceTotal()
        })
    });
    var t = $("#J_skuInstallment"), e = $(".add-cart, .now-buy"), a = $(".installment-buy");
    t.on("click", "li", function () {
        {
            var i = $(this);
            $("#j_colors").attr("marketable")
        }
        i.toggleClass("on").siblings().removeClass("on"), switchPayMethod().then(function (s, o, r) {
            if (this.data.productStore < 1) return !1;
            if (this.data.secondBuy && $(".second-buy").size() < 1) return !1;
            if (i.hasClass("on")) this.data.secondBuy && (isSecondBuy2iInstallment = !0), t.attr("curIndex", i.index()), a.removeClass("hidden").siblings("button").addClass("hidden"), $(".j_btnsLaser").hide().next().show(), $(".j_btnLaser-sm").addClass("hidden"); else {
                t.removeAttr("curIndex"), a.addClass("hidden").siblings("button").removeClass("hidden"), this.data.secondBuy ? (isSecondBuy2iInstallment = !1, e.addClass("hidden")) : 1 == this.data.fullpayFlag ? $(".now-buy").addClass("hidden") : r && $(".now-buy").removeClass("hidden");
                var l = $(".btn-next:first");
                l.removeClass().addClass("btn-next " + s).attr("title", o).find(".btn-inner").text(o), n.switchSelectedStatus($("#j_laserSelectTrigger").hasClass("on") && $("#j_laserSelectTrigger").is(":visible")), l.each(function () {
                    var t = $(this);
                    t.addClass(t.parent().hasClass("prod-amount-fixed") ? "btn--sm" : "btn--lg")
                })
            }
        })
    });
    var n = {
        initView: function (t) {
            var e = this;
            $.ajax({
                url: webCtx + "/laser/detail", data: {skuId: t}, success: function (t) {
                    200 == t.retCode ? $(".laser-option").show() : ($(".laser-option").hide(), $("#j_laserSelectTrigger").removeClass("on"), e.switchSelectedStatus(!1))
                }
            })
        }, switchSelectedStatus: function (t) {
            $(".installment-buy:not('.hidden')").length || $("#j_normalBtns").find("button:visible").hasClass("btn-disabled") || (t ? ($(".j_btnsLaser").show().next().hide(), $(".j_btnLaser-sm").removeClass("hidden")) : ($(".j_btnsLaser").hide().next().show(), $(".j_btnLaser-sm").addClass("hidden")))
        }, initEvent: function () {
            var t = this;
            $("#j_laserInfoTrigger").length && ($("#j_laserInfoTrigger").hover(function () {
                $("#j_laserInfoPop").fadeIn("fast")
            }, function (t) {
                t.relatedTarget == $("#j_laserInfoPop")[0] || $(t.relatedTarget).closest("#j_laserInfoPop").length || $("#j_laserInfoPop").fadeOut("fast")
            }), $("#j_laserInfoPop").on("mouseleave", function (t) {
                t.relatedTarget == $("#j_laserInfoTrigger") || $(t.relatedTarget).closest("#j_laserInfoTrigger").length || $("#j_laserInfoPop").fadeOut("fast")
            })), $("#j_laserSelectTrigger").click(function () {
                $(this).toggleClass("on"), t.switchSelectedStatus($(this).hasClass("on"))
            })
        }
    };
    n.initEvent(), $(".color-box > .sub-sku").on("click", function () {
        var t = $(this);
        if (t.hasClass("on")) return !1;
        var e = $("#prod-container-left");
        t.hasClass("disabled") && $(".prod-nogood-icon").length <= 0 ? e.find(".prod-corner-icon").hide().end().append('<div class="prod-nogood-icon" id="iconNoGood"></div>') : (e.find(".prod-corner-icon").show(), $("#iconNoGood").remove()), t.addClass("on").siblings().removeClass("on");
        var a = t.attr("sku-id"), i = $("#bigImgUl"), s = $("#smallImgUl");
        i.empty(), s.empty();
        var o = document.createElement("ul");
        o = $(o).addClass("cl"), $errorMsg.empty(), $.each(skuImageJson, function (t, e) {
            if (a == e.skuId) {
                var n = $('<li><img src="' + imgHost + e.bigPic + '" alt="商品图片" /></li>');
                i.append(n);
                var s = $('<li><a href="javascript:;" ><img src="' + imgHost + e.smallPic + '" /></a></li>');
                o.append(s)
            }
        }), s.append(o), initSwitch(), choiceTotal(), function () {
            var t = s.find("li").size() > 1 ? 1 : 0, e = s.find("li").eq(t).find("img").attr("src");
            $(".main-prod").find("img").attr("src", e)
        }(), vvsDetailskuInstallment.viewHtml(), SKU.data.secondBuy ? (showBuyNow = !1, setCountDownStatus(), n.initView(a)) : (switchPayMethod().then(function (t, e, a) {
            var n = $(".btn-next");
            n.removeClass().addClass("btn-next " + t).attr("title", e).find(".btn-inner").text(e), n.each(function () {
                var t = $(this);
                t.addClass(t.parent().hasClass("prod-amount-fixed") ? "btn--sm" : "btn--lg")
            }), $(".installment-tags").attr("curindex") && ($(".installment-tags .on").trigger("click"), $(".installment-tags").removeAttr("curindex"), $(".installment-buy").addClass("hidden")), a ? $(".now-buy").removeClass("hidden") : $(".now-buy").addClass("hidden")
        }), n.initView(a));
        var r = $("#j_CollectTrigger").parent();
        checkCollect(r, a)
    })
});
var $evaluateMain = $(".prod-main-evaluate");