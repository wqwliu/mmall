<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/12 0012
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>首页 - 许弋后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta content="十只羊九只蹲在羊圈里,一只蹲在猪圈里" />
    <meta content="Mosheng" name="author" />


    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/assets/images/favicon.ico">

    <!-- App css -->
    <link href="${pageContext.request.contextPath}/static/css/main/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/css/main/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/css/main/css/app.min.css" rel="stylesheet" type="text/css" />

</head>

<body>
    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box">
                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="#">admin</a></li>
                            <li class="breadcrumb-item active">后台</li>
                        </ol>
                    </div>
                    <h4 class="page-title">后台</h4>
                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-xl-3 col-lg-6">
                <div class="card widget-flat">
                    <div class="card-body p-0">
                        <div class="p-3 pb-0">
                            <div class="float-right">
                                <i class="mdi mdi-cart text-primary widget-icon"></i>
                            </div>
                            <h5 class="text-muted font-weight-normal mt-0">商品总数</h5>
                            <h3 class="mt-2">3,543</h3>
                        </div>
                        <div id="sparkline1"></div>
                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div> <!-- end col-->

            <div class="col-xl-3 col-lg-6">
                <div class="card widget-flat">
                    <div class="card-body p-0">
                        <div class="p-3 pb-0">
                            <div class="float-right">
                                <i class="mdi mdi-currency-usd text-danger widget-icon"></i>
                            </div>
                            <h5 class="text-muted font-weight-normal mt-0">销售总数</h5>
                            <h3 class="mt-2">21,287</h3>
                        </div>
                        <div id="sparkline2"></div>
                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div> <!-- end col-->

            <div class="col-xl-3 col-lg-6">
                <div class="card widget-flat">
                    <div class="card-body p-0">
                        <div class="p-3 pb-0">
                            <div class="float-right">
                                <i class="mdi mdi-account-multiple text-primary widget-icon"></i>
                            </div>
                            <h5 class="text-muted font-weight-normal mt-0">用户总数</h5>
                            <h3 class="mt-2">5,387</h3>
                        </div>
                        <div id="sparkline3"></div>
                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div> <!-- end col-->

            <div class="col-xl-3 col-lg-6">
                <div class="card widget-flat">
                    <div class="card-body p-0">
                        <div class="p-3 pb-0">
                            <div class="float-right">
                                <i class="mdi mdi-eye-outline text-danger widget-icon"></i>
                            </div>
                            <h5 class="text-muted font-weight-normal mt-0">访问量</h5>
                            <h3 class="mt-2">74,315</h3>
                        </div>
                        <div id="sparkline4"></div>
                    </div> <!-- end card-body-->
                </div> <!-- end card-->
            </div> <!-- end col-->
        </div>
        <!-- end row -->

        <div class="row">
            <div class="col-xl-8">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title">销售分析</h4>

                        <canvas id="bar" height="350" class="mt-4"></canvas>

                    </div>
                </div>
            </div>
            <div class="col-xl-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title">高级市场</h4>

                        <canvas id="doughnut" height="350" class="mt-4"></canvas>

                    </div>
                </div>
            </div>
        </div>
        <!-- end row -->

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title">客户列表</h4>

                        <div class="table-responsive mt-3">
                            <table class="table table-hover table-centered mb-0">
                                <thead>
                                <tr>
                                    <th>用户ID</th>
                                    <th>基本信息</th>
                                    <th>手机号</th>
                                    <th>地址</th>
                                    <th>注册时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>


                                <tbody>
                                <tr>
                                    <td><b>#0121</b></td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/static/assets/images/users/avatar-2.jpg" alt="contact-img" height="36" title="contact-img" class="rounded-circle float-left mr-2" />
                                        <p class="mb-0 font-weight-bold"><a href="javascript: void(0);">许抑洋顿挫</a></p>
                                        <span class="font-13">3494490@qq.com</span>
                                    </td>

                                    <td>
                                        155-0000-0000
                                    </td>

                                    <td>
                                        中国·荷兰
                                    </td>

                                    <td>
                                        2018/08/10
                                    </td>

                                    <td>
                                        <div class="btn-group dropdown">
                                            <a href="javascript: void(0);" class="dropdown-toggle arrow-none btn btn-light btn-sm" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal"></i></a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-pencil mr-1 text-muted"></i>编辑</a>
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-delete mr-1 text-muted"></i>删除</a>
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-email mr-1 text-muted"></i>发送邮件</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>#0121</b></td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/static/assets/images/users/avatar-2.jpg" alt="contact-img" height="36" title="contact-img" class="rounded-circle float-left mr-2" />
                                        <p class="mb-0 font-weight-bold"><a href="javascript: void(0);">许二洋受成</a></p>
                                        <span class="font-13">3494490@qq.com</span>
                                    </td>

                                    <td>
                                        155-0000-0000
                                    </td>

                                    <td>
                                        中国·荷兰
                                    </td>

                                    <td>
                                        2018/08/10
                                    </td>

                                    <td>
                                        <div class="btn-group dropdown">
                                            <a href="javascript: void(0);" class="dropdown-toggle arrow-none btn btn-light btn-sm" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal"></i></a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-pencil mr-1 text-muted"></i>编辑</a>
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-delete mr-1 text-muted"></i>删除</a>
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-email mr-1 text-muted"></i>发送邮件</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>#0121</b></td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/static/assets/images/users/avatar-2.jpg" alt="contact-img" height="36" title="contact-img" class="rounded-circle float-left mr-2" />
                                        <p class="mb-0 font-weight-bold"><a href="javascript: void(0);">许三洋开泰</a></p>
                                        <span class="font-13">3494490@qq.com</span>
                                    </td>

                                    <td>
                                        155-0000-0000
                                    </td>

                                    <td>
                                        中国·荷兰
                                    </td>

                                    <td>
                                        2018/08/10
                                    </td>

                                    <td>
                                        <div class="btn-group dropdown">
                                            <a href="javascript: void(0);" class="dropdown-toggle arrow-none btn btn-light btn-sm" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal"></i></a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-pencil mr-1 text-muted"></i>编辑</a>
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-delete mr-1 text-muted"></i>删除</a>
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-email mr-1 text-muted"></i>发送邮件</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>#0121</b></td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/static/assets/images/users/avatar-2.jpg" alt="contact-img" height="36" title="contact-img" class="rounded-circle float-left mr-2" />
                                        <p class="mb-0 font-weight-bold"><a href="javascript: void(0);">许四洋方尊</a></p>
                                        <span class="font-13">3494490@qq.com</span>
                                    </td>

                                    <td>
                                        155-0000-0000
                                    </td>

                                    <td>
                                        中国·荷兰
                                    </td>

                                    <td>
                                        2018/08/10
                                    </td>

                                    <td>
                                        <div class="btn-group dropdown">
                                            <a href="javascript: void(0);" class="dropdown-toggle arrow-none btn btn-light btn-sm" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal"></i></a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-pencil mr-1 text-muted"></i>编辑</a>
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-delete mr-1 text-muted"></i>删除</a>
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-email mr-1 text-muted"></i>发送邮件</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>#0121</b></td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/static/assets/images/users/avatar-2.jpg" alt="contact-img" height="36" title="contact-img" class="rounded-circle float-left mr-2" />
                                        <p class="mb-0 font-weight-bold"><a href="javascript: void(0);">许别来五洋</a></p>
                                        <span class="font-13">3494490@qq.com</span>
                                    </td>

                                    <td>
                                        155-0000-0000
                                    </td>

                                    <td>
                                        中国·荷兰
                                    </td>

                                    <td>
                                        2018/08/10
                                    </td>

                                    <td>
                                        <div class="btn-group dropdown">
                                            <a href="javascript: void(0);" class="dropdown-toggle arrow-none btn btn-light btn-sm" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal"></i></a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-pencil mr-1 text-muted"></i>编辑</a>
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-delete mr-1 text-muted"></i>删除</a>
                                                <a class="dropdown-item" href="#"><i class="mdi mdi-email mr-1 text-muted"></i>发送邮件</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end row -->


    </div> <!-- end container -->
</div>
<!-- end wrapper -->


<!-- Footer Start -->
<footer class="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                Mosheng Admin &copy; 2018 - tecms.net
            </div>
            <div class="col-md-6">
                <div class="text-md-right footer-links d-none d-sm-block">
                    <a href="#">关于我们</a>
                    <a href="#">帮助</a>
                    <a href="#">联系我们</a>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- end Footer -->


<!-- App js -->
<script src="${pageContext.request.contextPath}/static/js/main/vendor.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/main/app.min.js"></script>

<!-- Plugins js -->
<script src="${pageContext.request.contextPath}/static/js/main/vendor/Chart.bundle.js"></script>
<script src="${pageContext.request.contextPath}/static/js/main/vendor/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/main/vendor/jquery.knob.min.js"></script>

<script src="${pageContext.request.contextPath}/static/js/main/pages/dashboard.init.js"></script>

</body>
</html>

