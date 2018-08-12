<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/2 0002
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>carousel模块快速使用</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css" media="all">
</head>
<style>
    .main{
        position:absolute;
        top:50%;
        left:50%;
        margin-left:350px;
        margin-top:150px;
        width:300px;
        height:200px;
        background-color:orange;
    }
</style>
<body>

<div class="layui-carousel" id="test1">
    <div carousel-item>
        <c:forEach items="${list}" var="li" varStatus="vs">
            <div class="main"  id="firstname" >
                <a name="lunbo" class="lunbo" href="html/activity/1524466990.html" target="_blank"><img  id="lunbo_1" alt="放价过五一" src="${li}" /></a>
            </div>
        </c:forEach>
        <%--<div>条目1</div>
        <div>条目2</div>
        <div>条目3</div>
        <div>条目4</div>
        <div>条目5</div>--%>
    </div>
</div>
<!-- 条目中可以是任意内容，如：<img src=""> -->

<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,arrow: 'always' //始终显示箭头
            ,anim: 'updown' //切换动画方式
            ,full: 'true'
        });
    });
</script>
</body>
</html>
