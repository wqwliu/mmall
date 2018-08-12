<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/9
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>登录</title>
    <link href="${pageContext.request.contextPath}/static/css/login/login.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
</head>
<body>
<div class="login_box">
    <div class="login_l_img"><img src="${pageContext.request.contextPath}/static/images/login-img.png" /></div>
    <div class="login" id="login_user">
        <div class="login_logo"><a href="#"><img src="${pageContext.request.contextPath}/static/images/login_logo.png" /></a></div>
        <div class="login_name">
            <p>用户登录</p>
        </div>
        <form method="post">
            <input name="uname" type="text" id="uname" value="用户名" onfocus="this.value=''" onblur="if(this.value==''){this.value='用户名'}">
            <span id="password_text" onclick="this.style.display='none';document.getElementById('password').style.display='block';document.getElementById('password').focus().select();" >密码</span>
            <input name="password" type="password" id="password" style="display:none;" onblur="if(this.value==''){document.getElementById('password_text').style.display='block';this.style.display='none'};"/>
            <input value="登录" style="width:100%;" type="submit" class="user_login" data-type="login">
            <div align="right" ><a id="toAdmin">管理员登录</a></div>
        </form>
    </div>
    <div class="login" style="display: none" id="login_admin">
        <div class="login_logo"><a href="#"><img src="${pageContext.request.contextPath}/static/images/login_logo.png" /></a></div>
        <div class="login_name">
            <p>管理员登录</p>
        </div>
        <form method="post">
            <input name="uname" type="text"  id="name" value="用户名" onfocus="this.value=''" onblur="if(this.value==''){this.value='账号'}">
            <%--<span id="password_text" onclick="this.style.display='none';document.getElementById('password').style.display='block';document.getElementById('password').focus().select();" >密码</span>--%>
            <input name="password" type="password" id="password1"  onblur="密码"/>
            <input value="登录" style="width:100%;" type="submit" class="admin_login" data-type="login_admin">
            <div align="right" ><a id="toUser">用户登录</a></div>
        </form>
    </div>
    <div class="copyright">ECG有限公司 版权所有©2016-2018 技术支持电话：000-00000000</div>
</div>
</body>
</html>
<script>
    $(function(){
        $("#toAdmin").click(function(){

            $("#login_user").hide();
            $("#login_admin").show();

        });
        $("#toUser").click(function(){
            $("#login_admin").hide();
            $("#login_user").show();
        });
    });
    $(".login .user_login").click(function () {

        var type = $(this).data("type");

        active[type] ? active[type].call(this) : '';

    });
    $(".login .admin_login").click(function () {

        var type = $(this).data("type");

        active[type] ? active[type].call(this) : '';

    });

    var active = {
        login:function () {
            var uname = $('#uname').val();
            var password = $('#password').val();

            $.post(
                //url
               "user/login",
                //data
            {
                uname:uname,
                password:password
            },
            function (data) {
                if(data.code==0){
                    location.href="http://localhost:86/portal/index?uname="+uname;
                }else{
                    $('#uname').val("");
                    $('#password').val("");
                    alert(data.msg);
                }
            },
                'json'

            );

        },

        login_admin:function () {

            var name = $('#name').val();
            var pwd = $('#password1').val();
            $.post(
                //url
                "user/adminLogin",
                //data
                {
                    name:name,
                    pwd:pwd
                },
                function (data) {
                    if(data.code==0){
                        location.href="./index";
                    }else{
                        $('#uname').val("");
                        $('#password').val("");
                        alert("账号或密码错误")
                    }

                },
                'json'

            );

        }


    }

</script>
