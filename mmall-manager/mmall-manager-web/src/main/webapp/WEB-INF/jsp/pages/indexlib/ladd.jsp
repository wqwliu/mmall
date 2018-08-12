<%@ page import="javax.servlet.descriptor.TaglibDescriptor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加订单-后台管理系统-Admin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/treeselect.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/treeselect.js" charset="utf-8"></script>--%>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/admin.js"></script>
    <![endif]-->
</head>

<body>
<div class="weadmin-body">
    <form class="layui-form">
        <%--<div class="layui-form-item">
            <label for="cid" class="layui-form-label">
                <span class="we-red">*</span>商品状态
            </label>
            <div class="layui-input-inline">
                <input type="text" name="pstatus"  id="cid" lay-filter="demo" autocomplete="off" class="layui-input">
            </div>
        </div>--%>
        <%--<div class="layui-form-item">
            <label for="title" class="layui-form-label">
                <span class="we-red">*</span>轮播图描述
            </label>
            <div class="layui-input-inline">
                <input type="text" id="title" value="${aabbcc.idesc}" name="idesc" required="" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>--%>
        <div class="layui-form-item layui-form-text">
            <label for="sellPoint" class="layui-form-label">关联商品描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入描述" id="sellPoint"   name="idesc" class="layui-textarea">${aabbcc.idesc}</textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label for="sellPoint" class="layui-form-label">跳转目标地址</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入地址" id=""   name="address" class="layui-textarea">${aabbcc.address}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="priceView" class="layui-form-label">
                <span class="we-red">*</span>关联商品名字
            </label>
            <div class="layui-input-inline">
                <input type="text" id="priceView" name="pname" value="${aabbcc.pname}" required="" lay-verify="" autocomplete="off"
                       class="layui-input">
                <%--<input type="hidden" id="price" name="shopPrice">--%>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="num" class="layui-form-label">
                <span class="we-red">*</span>关联商品id
            </label>
            <div class="layui-input-inline">
                <input type="text" id="num" name="pid" required="" value="${aabbcc.pid}" lay-verify="number" autocomplete="off"
                       class="layui-input">
                <%--<input type="hidden" name="pid" value="${aabbcc.pid}">--%>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="barcode" class="layui-form-label">
                <span class="we-red">*</span>关联商品排序
            </label>
            <div class="layui-input-inline">
                <input type="text" id="barcode" name="sort" required=""  value="${aabbcc.sort}" lay-verify="number" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label for="" class="layui-form-label">轮播图</label>
            <div class="layui-input-block">
                <%--第一步--%>
                <input id="111a" type="hidden"  value="">
                <textarea id="idesc"  class="layui-textarea" style="display: none" >${aabbcc.idesc}</textarea>

            </div>
        </div>
        <div class="layui-form-item">
            <label for="add" class="layui-form-label">
            </label>
            <button id="add" class="layui-btn" lay-filter="add" lay-submit="">增加</button>
        </div>
    </form>
</div>
<script>
    layui.extend({
        admin: '{/}../../static/js/admin',
        treeselect: '{/}../../static/js/treeselect'
    });
    layui.use(['form', 'admin','layer', 'layedit', 'treeselect','jquery'], function () {
        var $ = layui.jquery,
            form = layui.form,
            //admin = layui.admin,
            layer = layui.layer,
            layedit = layui.layedit,
            treeselect = layui.treeselect;

        //初始化树形下拉框


        //第二步
        //初始化富文本编辑器
        var index =  layedit.build('idesc', {
            height: 170,//设置编辑器高度
            uploadImage:{
                url:'../../admin/uploadImage',
                type:'post'
            }
        });



        //监听提交
        form.on('submit(add)', function (data) {
            var content = layedit.getContent(index);
            console.log(content);
            data.field.image=content;
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {
                icon: 6
            }, $.post(
                '../../admin/index/add/addlimage',
                {'a':JSON.stringify(data.field)},
                function(){
                    // 获得frame索引
                    var index = parent.layer.getFrameIndex(window.name);
                    //关闭当前frame
                    parent.layer.close(index);
                },
                'json'
            ));
            return false;
        });

    });
</script>
</body>

</html>