<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>问卷调查</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="author" content=""/>
    <!-- Facebook and Twitter integration -->
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="../../assets/module/scripts/project/home/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="../../assets/module/scripts/project/home/css/icomoon.css">
    <!-- Themify Icons-->
    <link rel="stylesheet" href="../../assets/module/scripts/project/home/css/themify-icons.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="../../assets/module/scripts/project/home/css/bootstrap.css">

    <!-- Magnific Popup -->
    <link rel="stylesheet" href="../../assets/module/scripts/project/home/css/magnific-popup.css">

    <!-- Owl Carousel  -->
    <link rel="stylesheet" href="../../assets/module/scripts/project/home/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../../assets/module/scripts/project/home/css/owl.theme.default.min.css">

    <!-- Theme style  -->
    <link rel="stylesheet" href="../../assets/module/scripts/project/home/css/style.css">

    <!-- Modernizr JS -->
    <script src="../../assets/module/scripts/project/home/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="../../assets/module/scripts/project/home/js/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div class="gtco-loader"></div>

<div id="page">


    <div class="page-inner">
        <nav class="gtco-nav" role="navigation">
            <div class="gtco-container">

                <div class="row">
                    <div class="col-sm-4 col-xs-12">
                        <div id="gtco-logo">
                            <a href="#">XM-13</a><br>
                            <a href="#">民宿管理平台</a>
                        </div>
                    </div>
                    <div class="col-xs-8 text-right menu-1">
                        <ul>
                            <li><a href="../view/view_WJ.jsp"><b>参与调查</b></a></li>

                            <li class="has-dropdown">
                                <a href="#" style=""><b>个人中心</b></a>
                                <ul class="dropdown">
                                    <li><a href="../view/viewMy_WJ.jsp?u_id=<%=session.getAttribute("Name")%>">我的问卷</a></li>
                                    <li><a href="#">我的信息</a></li>
                                  <!--  <li><a href="login1.jsp">切换用户</a></li>-->
                                    <li><a href="../forum/forum_list.jsp">问卷管理</a></li>
                                    <form action="logout.action" method="post">
                                        <li><a href="">注销</a></li>
                                    </form>
                                </ul>
                            </li>

                            <li class="btn-cta"><a href="../addWJ/addWJ.jsp"><span><b>创建问卷</b></span></a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </nav>

        <header id="gtco-header" class="gtco-cover" role="banner"
                style="background-image: url(../../assets/module/img/forum/bg6.png);height: 400px;">


        </header>

        <div class="gtco-section border-bottom">
            <div class="gtco-container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
                        <p>民宿调查管理问卷，帮助用户发表意见、完善民宿系统</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <a href="stay.jsp" class="fh5co-project-item">
                            <figure>
                                <div class="overlay">
                                    <i class="ti-plus"></i>
                                </div>
                                <img src="../../assets/module/img/forum/h11.jpg" alt="Image" class="img-responsive">
                            </figure>
                            <div class="fh5co-text">
                                <h2>关于民宿海澜之家调查问卷</h2>
                                <p>20道题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;100份答卷</p>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <a href="stay.jsp" class="fh5co-project-item">
                            <figure>
                                <div class="overlay">
                                    <i class="ti-plus"></i>
                                </div>
                                <img src="../../assets/module/img/forum/h2.jpg" alt="Image" class="img-responsive">
                            </figure>
                            <div class="fh5co-text">
                                <h2>关于民宿成功之家调查问卷</h2>
                                <p>18道题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;80份答卷</p>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <a href="stay.jsp" class="fh5co-project-item">
                            <figure>
                                <div class="overlay">
                                    <i class="ti-plus"></i>
                                </div>
                                <img src="../../assets/module/img/forum/h3.png" alt="Image" class="img-responsive">
                            </figure>
                            <div class="fh5co-text">
                                <h2>关于民宿张伟之家调查问卷</h2>
                                <p>26道题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;70份答卷</p>
                            </div>
                        </a>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <a href="stay.jsp" class="fh5co-project-item">
                            <figure>
                                <div class="overlay">
                                    <i class="ti-plus"></i>
                                </div>
                                <img src="../../assets/module/img/forum/h4.jpg" alt="Image" class="img-responsive">
                            </figure>
                            <div class="fh5co-text">
                                <h2>关于民宿何晨之家的调查问卷</h2>
                                <p>14道题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;120份答卷</p>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <a href="stay.jsp" class="fh5co-project-item">
                            <figure>
                                <div class="overlay">
                                    <i class="ti-plus"></i>
                                </div>
                                <img src="../../assets/module/img/forum/h5.jpg" alt="Image" class="img-responsive">
                            </figure>
                            <div class="fh5co-text">
                                <h2>关于民宿98至尊的调查问卷</h2>
                                <p>16道题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;90份答卷</p>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <a href="stay.jsp" class="fh5co-project-item">
                            <figure>
                                <div class="overlay">
                                    <i class="ti-plus"></i>
                                </div>
                                <img src="../../assets/module/img/forum/h6.png" alt="Image" class="img-responsive">
                            </figure>
                            <div class="fh5co-text">
                                <h2>关于网上购买家居的调查问卷</h2>
                                <p>18道题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;60份答卷</p>
                            </div>
                        </a>
                    </div>

                </div>
            </div>
        </div>

<!--
        <footer id="gtco-footer" role="contentinfo">
            <div class="gtco-container">
                <div class="row row-p	b-md">

                    <div class="col-md-18">
                        <div class="gtco-widget">
                            <h3>关于<span class="footer-logo">本网站</span>
                            </h3>
                            <p>问卷调查系统：用来供XM13民宿管理系统房东和房客进一步使用</p>
                        </div>
                    </div>

                  <div class="col-md-4 col-md-push-1">
                        <div class="gtco-widget">
                            <h3>内容</h3>
                            <ul class="gtco-footer-links">
                                <li><a href="#">XM13小组</a></li>
                                <li><a href="#">民宿旅游</a></li>
                                <li><a href="#">房东提问</a></li>
                                <li><a href="#">房客回答</a></li>
                                <li><a href="#">完善自我</a></li>
                            </ul>
                        </div>
                    </div>
-->
                    <div class="col-md-4">
                        <div class="gtco-widget">
                            <h3>取得联系</h3>
                            <ul class="gtco-quick-contact">
                                <li><a href="#"><i class="icon-phone"></i> +158 3098 0328</a></li>
                                <li><a href="#"><i class="icon-mail2"></i> 642103678@qq.com</a></li>
                                <li><a href="#"><i class="icon-chat"></i> 四川大学计算机学院</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
<!--
                <div class="row copyright">
                    <div class="col-md-18">
                        <p class="pull-left">
                            <small class="block">XM13 &copy; 李博洋 <a
                                    target="_blank" href="http://sc.chinaz.com/moban/"></a></small>
                        </p>
                        <p class="pull-right">


                        <ul class="gtco-social-icons pull-right">
                            <li><a href="#"><i class="icon-twitter"></i></a></li>
                            <li><a href="#"><i class="icon-facebook"></i></a></li>
                            <li><a href="#"><i class="icon-linkedin"></i></a></li>
                            <li><a href="#"><i class="icon-dribbble"></i></a></li>
                        </ul>
                        </p>
                    </div>
                </div>
    -->
            </div>
        </footer>
    </div>

</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
</div>

<!-- jQuery -->
<script src="../../assets/module/scripts/project/home/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="../../assets/module/scripts/project/home/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="../../assets/module/scripts/project/home/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="../../assets/module/scripts/project/home/js/jquery.waypoints.min.js"></script>
<!-- Carousel -->
<script src="../../assets/module/scripts/project/home/js/owl.carousel.min.js"></script>
<!-- countTo -->
<script src="../../assets/module/scripts/project/home/js/jquery.countTo.js"></script>
<!-- Magnific Popup -->
<script src="../../assets/module/scripts/project/home/js/jquery.magnific-popup.min.js"></script>
<script src="../../assets/module/scripts/project/home/js/magnific-popup-options.js"></script>
<!-- Main -->
<script src="../../assets/module/scripts/project/home/js/main.js"></script>
</body>
</html>