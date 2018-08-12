<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <label for="sellPoint" class="layui-form-label">父id</label>
            <div class="layui-input-block">
                <select name="parendId" lay-verify="">
                    <option value="">--请选择--</option>
                    <option value="1">手机 电话卡</option>
                    <option value="2">电视 盒子</option>
                    <option value="3">笔记本 平板</option>
                    <option value="4">家电 插线板</option>
                    <option value="5">出行 穿戴</option>
                    <option value="6">智能 路由器</option>
                    <option value="7">电源 配件</option>
                    <option value="8">个护 儿童</option>
                    <option value="9">耳机 音箱</option>
                    <option value="10">生活 箱包</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label for="sellPoint" class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入地址" id=""   name="title" class="layui-textarea"></textarea>
            </div>
        </div>

            <div class="layui-form-item layui-form-text">
                <label for="itemDesc" class="layui-form-label">描述</label>
                <div class="layui-input-block">
                    <%--第一步--%>
                    <input id="111a" type="hidden"  value="">
                    <textarea id="itemDesc"  class="layui-textarea" style="display: none" ></textarea>

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
    layui.use(['form', 'admin','layer', 'layedit','jquery','treeselect'], function () {
        var form = layui.form,
            admin = layui.admin,
            layer = layui.layer,
            $ = layui.jquery,
            layedit = layui.layedit,
            treeselect = layui.treeselect;

        //初始化树形下拉框

        //第二步
        //初始化富文本编辑器
        var index = layedit.build('itemDesc', {
            height: 100,//设置编辑器高度
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
                    '../../admin/index/addIndexOther',
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