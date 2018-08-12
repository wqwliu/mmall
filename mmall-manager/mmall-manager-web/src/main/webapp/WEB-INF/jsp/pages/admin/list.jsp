<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>管理员列表-后台管理系统-Admin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/html" id="caozuo">

        <%--<a onclick="member_stop(this,'10001')" href="javascript:;" title="启用">
            <i class="layui-icon">&#xe601;</i>
        </a>&nbsp;&nbsp;--%>
        <a title="编辑"  href="javascript:;"lay-event="edit">
            <i class="layui-icon">&#xe642;</i>
        </a>&nbsp;&nbsp;
        <a title="删除" href="javascript:;" lay-event="del">
            <i class="layui-icon">&#xe640;</i>
        </a>
</script>
    <script type="text/html" id="zhuangtai">
        <input type="checkbox" name="statu" id="{{d.uid}}" value="{{d.statu}}" lay-skin="switch" lay-text="正常|封停" lay-filter="zhuangtai" {{d.statu =='1'? 'checked':'' }}>
    </script>
</head>

<body>
<div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">管理员管理</a>
        <a>
          <cite>管理员列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search">
            <div class="layui-inline">
                <input class="layui-input" placeholder="开始日" name="start" id="start" autocomplete="off">
            </div>
            <div class="layui-inline">
                <input class="layui-input" placeholder="截止日" name="end" id="end" autocomplete="off">
            </div>
            <div class="layui-inline">
                <input type="text" id="uname" name="uname" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
            <button class="layui-btn" type="button" data-type="reload"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <div class="weadmin-block">
        <button class="layui-btn layui-btn-danger" data-type="getCheckData"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="WeAdminShow('添加用户','./add')"><i class="layui-icon"></i>添加</button>
        <span class="fr" style="line-height:40px"></span>
    </div>
    <table class="layui-table" id="articleList" lay-filter="dataTable" lay-data="{id:'table1'}">
        <%-- <thead>

         <tbody>
         <tr>
              <td>
                 <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
             </td>

            <td class="td-status">
                 <span class="layui-btn layui-btn-normal layui-btn-xs">已启用</span></td>
             <td class="td-manage">
                 <a onclick="member_stop(this,'10001')" href="javascript:;" title="启用">
                     <i class="layui-icon">&#xe601;</i>
                 </a>
                 <a title="编辑" onclick="WeAdminShow('编辑','./edit')" href="javascript:;">
                     <i class="layui-icon">&#xe642;</i>
                 </a>
                 <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                     <i class="layui-icon">&#xe640;</i>
                 </a>
             </td>
            </tr>
        </tbody>--%>
    </table>
</div>
<script type="text/javascript">
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['laydate','jquery','admin','table','form','layer'], function() {
        var laydate = layui.laydate,
            $ = layui.jquery,
            admin = layui.admin;

        var table = layui.table,
            form = layui.form,
            $ = layui.jquery,
            layer = layui.layer,
            thisTitle='用户';

        var table11=table.render({
            //表格属性
            //要渲染的容器
            page: true,

            elem: '#articleList',
            //异步请求
            url: '../../user/getUserList',
            //列
            cols: [[
                //field title 列属性
                {type: 'checkbox', fixed: 'left'},
                {
                    field: 'uid',
                    title: '用户编号',
                    width: 100,
                    style: 'background-color: #D0D0D0; color: #fff;',
                    sort: true,
                    edit: 'text',
                    fixed: 'left'
                },
                {field: 'uname', title: '用户名', width: 200, sort: true},
                {field:'usex',title:'性别',width:80,sort:true},
                {field: 'uphone', title: '手机号', width: 200, sort: true},
                {field: 'uemail', title: '邮箱', width: 250, sort: true, edit: 'text'},
                {field: 'createdate', title: '注册时间', width: 120, sort: true, edit: 'date'},
                {width:100,align:'center',title:'状态',templet:'#zhuangtai',fixed:'right'},
                {width: 158, align: 'center', title: '操作', toolbar: '#caozuo', fixed: 'right'}
            ]],
        });
        table.on('tool(dataTable)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('确认删除吗?', function(index){
                    _acDel(data.uid);
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
               /* /!* _add('编辑'+thisTitle,'edit?pid='+data.pid);*!/*/
               /* _acEdit('编辑'+thisTitle,'../../user/getUserById?uid='+data.uid);*/
               _acEdit(data.uid);

            } else if(obj.event === 'view'){
                _add(thisTitle+'报表','view?czid='+data.id,'95%','95%');
            }
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });
        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });



        /*用户-停用*/
        /*function member_stop(obj, id) {
            layer.confirm('确认要停用吗？', function(index) {
                if($(obj).attr('title') == '启用') {
                    //发异步把用户状态进行更改
                    $(obj).attr('title', '停用')
                    $(obj).find('i').html('&#xe62f;');
                    $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                    layer.msg('已停用!', {
                        icon: 5,
                        time: 1000
                    });
                } else {
                    $(obj).attr('title', '启用')
                    $(obj).find('i').html('&#xe601;');
                    $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                    layer.msg('已启用!', {
                        icon: 5,
                        time: 1000
                    });
                }
            });
        }*/

        /*用户-删除*/

        /*function delAll(argument) {
            var data = tableCheck.getData();
            layer.confirm('确认要删除吗？' + data, function(index) {
                //捉到所有被选中的，发异步进行删除
                layer.msg('删除成功', {
                    icon: 1
                });
                $(".layui-form-checked").not('.header').parents('tr').remove();
            });
        }*/

        //响应删除执行
        function _acDel(uid) {
            console.log(uid);
            $.ajax({

                url: '../../user/deleteUser?uid='+uid+'',
                type: "post",
                dataType: "json",
                success: function (data) {
                    //停留在原来页面刷新
                    /*$(".layui-laypage-btn").click();*/
                    table11.reload('dataTable', {});
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


        //响应编辑执行
        function _acEdit(uid) {
            console.log(uid);
            $.ajax({

                url: '../../user/getUserById?uid='+uid+'',
                type: "post",
                dataType: "json",
                success: function (data) {
                    //停留在原来页面刷新
                   /* /!*$(".layui-laypage-btn").click();*!/*/
                    layer.open({
                            type: 2,
                            area: [900 + 'px', 400 + 'px'],
                            fix: false, //不固定
                            maxmin: true,
                            shadeClose: true,
                            shade: 0.4,
                            title: data.title,
                            content: './edit',
                            success: function(data) {
                                //向iframe页的id=house的元素传值  // 参考 https://yq.aliyun.com/ziliao/133150
                                table11.reload('articleList', {});
                                /*var body = layer.getChildFrame('body', index);*/
                              /* /!* body.contents().find("#dataId").val(id);*!/*/


                            },
                            error: function(layero, index) {
                                alert("aaa");
                            }
                        }

                    )
                    table11.reload('articleList', {});
                   /* table.reload('dataTable', {});*/
                   /* layer.msg("恭喜，修改成功！", {icon: 1});*/

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.tips('修改失败');
                },
                beforeSend: function () {
                },
                complete: function () {
                }
            });
        }

        //批量删除点击事件
        $(".weadmin-block .layui-btn-danger").click(function () {
            //获取按钮的data-type属性
           var type = $(this).data('type');

            active[type] ? active[type].call(this) : '';

        });

        var active = {

            reload:function() {
                //获取搜索条件
                 var start = $('#start').val();
                 var end = $('#end').val();
                var uname = $('#uname').val();
                console.log(start);

                if ($.trim(uname).length > 0 || start != null || end != null) {

                table.reload('articleList', {
                    page: {curr: 1},
                    where: {
                        start: start,
                        end: end,
                        uname: uname
                    }
                });
              }
            },
            getCheckData:function(){

                var data = table.checkStatus('articleList').data;
                if(data.length>0){

                    var ids = [];
                    for (var i = 0 ;i < data.length;i++){
                        ids.push(data[i].uid);

                    }
                    $.post(
                        //url
                        '../../user/removeUserAll',
                        //data
                        {'ids[]':ids},

                        //function
                        function(data){
                            console.log(data);

                        }

                        //dataType

                    )
                    table11.reload('articleList', {});


                }else {
                    //没有选中
                    layer.msg('请至少选中一行再进行删除！',{icon:2})
                }


            }
        }
        //修改状态
        form.on('switch(zhuangtai)', function(obj){
            console.log(this);
            var uid=this.id;
            var statu=this.name;
            var val=obj.elem.checked?'1':'2';

            _acFun(uid,statu,val);
        });

        function _acFun(uid,statu,val) {
            console.log(uid);
            console.log(statu);
            console.log(val);
            $.ajax({
                url: '../../user/updateUserStatu?uid='+uid+'&'+statu+'='+val,
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


        //搜索点击事件
       $('.weadmin-body .layui-btn').on('click',function(){
             var type = $(this).data('type');
                console.log(type);
             active[type] ? active[type].call(this) : '';

        });

    });


</script>
</body>

</html>