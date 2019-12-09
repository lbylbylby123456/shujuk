<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*"%>
<%
    //做调试用，这里要在正式发布的时候去掉
    System.out.println("[" + (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new java.util.Date()) + "]=======================调试：" + request.getServletPath() + "开始==============================");
%>
<%
    String id = request.getParameter("id");
    String existResultset = request.getParameter("exist_resultset");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>XM13心愿清单统计结果</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="../../assets/index/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="../../assets/index/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="../../assets/index/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="../../assets/index/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="../../assets/index/img/apple-touch-icon-144x144-precomposed.png">

    <!-- BASE CSS -->
    <link href="../../assets/index/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../assets/index/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="../../assets/index/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

    <link href="../../assets/index/css/style.css" rel="stylesheet">
    <link href="../../assets/index/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="../../assets/index/css/custom.css" rel="stylesheet">

</head>

<body onload="getStatisticResult()">

<div id="page">

    <header class="header menu_fixed">
                    <div style="float: left;margin-top: 10px">
                <iframe scrolling="no" src="https://tianqiapi.com/api.php?style=ya&skin=pitaya&color=FF0000" frameborder="0" width="320" height="200" allowtransparency="true"></iframe>
            </div>
        <%--<ul id="top_menu">--%>
            <%--<li><a href="cart-1.html" class="cart-menu-btn" title="Cart"><strong>4</strong></a></li>--%>
            <%--<li><a href="#sign-in-dialog" id="sign-in" class="login" title="Sign In">Sign In</a></li>--%>
            <%--<li><a href="wishlist.html" class="wishlist_bt_top" title="Your wishlist">Your wishlist</a></li>--%>
        <%--</ul>--%>
        <!-- /top_menu -->
        <a href="#menu" class="btn_mobile">
            <div class="hamburger hamburger--spin" id="hamburger">
                <div class="hamburger-box">
                    <div class="hamburger-inner"></div>
                </div>
            </div>
        </a>
        <nav id="menu" class="main-menu">
            <ul>
                <li><span><a href="../../index/index.jsp">首页</a></span>
                </li>
                <li><span><a href="../../xm13-minsu/login/login3.jsp">我是房东</a></span>
                </li>
                <li><span><a href="#">个人中心</a></span>
                    <ul>
                        <li><a href="../../person/person.jsp">个人信息</a></li>
                        <li><a href="../../myorder/order_list.jsp">我的订单</a></li>
                        <li><a href="../../album/album_list.jsp">照片墙</a></li>
                        <li><a href="../../wl/main/index.jsp">心愿清单</a></li>
                    </ul>
                </li>
                <li><span><a href="../questionary/main">发布评论</a></span>
                </li>
            </ul>
        </nav>
    </header>
    <!-- /header -->

    <main>

        <section class="hero_in tours">
            <div class="wrapper">
                <div class="container">
                    <h1 class="fadeInUp"><span></span>心愿清单</h1>
                </div>
            </div>
        </section>
        <!--/hero_in-->

        <form class="container margin_60_35">
            <div style="text-align: center">
                <a href="../file/wl_query.jsp" role="button" class="btn btn-warning">查询清单</a>
                <a href="#" role="button" class="btn btn-warning">导出清单</a>
                <a href="../file/wl_print.jsp?exist_resultset=1" role="button" class="btn btn-warning">打印清单</a>
                <a href="../file/wl_statistic.jsp" role="button" class="btn btn-warning">统计清单</a>
            </div>
            <div class="divider"></div>
            <div class="wrapper-grid">
                <input type="hidden" id="saved_content" value="">
                <div id="wishlist_content" class="row">

                    <!-- /box_grid -->
                </div>
                <!-- /row -->
            </div>
            <!-- /isotope-wrapper -->
        </form>
<!-- /container -->
        <div class="container">
            <div class="col-md-12" id="result_image_div" style="height: 250px"></div>
            <div id="record_list"></div>
            <%--<table id="record_list"></table>--%>

        </div>


<%--<div class="bg_color_1">--%>
    <%--<div class="container margin_60_35">--%>
        <%--<div class="row">--%>
            <%--<div class="col-md-4">--%>
                <%--<a href="#0" class="boxed_list">--%>
                    <%--<i class="pe-7s-help2"></i>--%>
                    <%--<h4>Need Help? Contact us</h4>--%>
                    <%--<p>Cum appareat maiestatis interpretaris et, et sit.</p>--%>
                <%--</a>--%>
            <%--</div>--%>
            <%--<div class="col-md-4">--%>
                <%--<a href="#0" class="boxed_list">--%>
                    <%--<i class="pe-7s-wallet"></i>--%>
                    <%--<h4>Payments</h4>--%>
                    <%--<p>Qui ea nemore eruditi, magna prima possit eu mei.</p>--%>
                <%--</a>--%>
            <%--</div>--%>
            <%--<div class="col-md-4">--%>
                <%--<a href="#0" class="boxed_list">--%>
                    <%--<i class="pe-7s-note2"></i>--%>
                    <%--<h4>Cancel Policy</h4>--%>
                    <%--<p>Hinc vituperata sed ut, pro laudem nonumes ex.</p>--%>
                <%--</a>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<!-- /row -->--%>
    <%--</div>--%>
    <%--<!-- /container -->--%>
<%--</div>--%>
<!-- /bg_color_1 -->

</main>
<!--/main-->

    <footer>
        <div class="container margin_60_35">

            <!--/row-->
            <%--<hr>--%>
            <div class="row">
                <div class="col-xl-4 m-auto" style="text-align: center">
                    <ul id="additional_links">
                        <li>Terms and conditions</li>
                        <li>Privacy</li>
                        <li><span>© 2019 Minsu13</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
<!--/footer-->
</div>
<!-- page -->

<!-- Sign In Popup -->
<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
    <div class="small-dialog-header">
        <h3>Sign In</h3>
    </div>
    <form>
        <div class="sign-in-wrapper">
            <a href="#0" class="social_bt facebook">Login with Facebook</a>
            <a href="#0" class="social_bt google">Login with Google</a>
            <div class="divider"><span>Or</span></div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control" name="email" id="email">
                <i class="icon_mail_alt"></i>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password" id="password" value="">
                <i class="icon_lock_alt"></i>
            </div>
            <div class="clearfix add_bottom_15">
                <div class="checkboxes float-left">
                    <label class="container_check">Remember me
                        <input type="checkbox">
                        <span class="checkmark"></span>
                    </label>
                </div>
                <div class="float-right mt-1"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
            </div>
            <div class="text-center"><input type="submit" value="Log In" class="btn_1 full-width"></div>
            <div class="text-center">
                Don’t have an account? <a href="register.html">Sign up</a>
            </div>
            <div id="forgot_pw">
                <div class="form-group">
                    <label>Please confirm login email below</label>
                    <input type="email" class="form-control" name="email_forgot" id="email_forgot">
                    <i class="icon_mail_alt"></i>
                </div>
                <p>You will receive an email containing a link allowing you to reset your password to a new preferred one.</p>
                <div class="text-center"><input type="submit" value="Reset Password" class="btn_1"></div>
            </div>
        </div>
    </form>
    <!--form -->
</div>
<!-- /Sign In Popup -->

<div id="toTop"></div><!-- Back to top button -->

<!-- COMMON SCRIPTS -->
<script src="../../assets/index/js/jquery-2.2.4.min.js"></script>
<script src="../../assets/module/scripts/wl/jquery.dataTables.min.js"></script>
<script src="../../assets/module/scripts/wl/jquery.uniform.min.js"></script>
<script src="../../assets/index/js/moment.min.js"></script>
<%--<script src="../../assets/index/js/daterangepicker.js"></script>--%>
<script src="../../assets/index/js/jquery.form.js"></script>
<script src="../../assets/index/js/common_scripts.js"></script>
<script src="../../assets/index/js/main.js"></script>
<script src="../../assets/index/js/bootstrap-select.min.js"></script>
<script src="../../assets/index/assets/validate.js"></script>
<script src="../../assets/index/js/bootstrap-datetimepicker.js"></script>
<script src="../../assets/module/scripts/wl/wl_statistic.js"></script>
<script src="../../assets/module/scripts/wl/echarts.min.js"></script>
<%--<link href="../../assets/index/css/daterangepicker.css" rel="stylesheet">--%>
<%--<link href="../../assets/index/css/font-awesome.min.css" rel="stylesheet">--%>

<script>
    $('.wish_bt.liked').on('click', function (c) {
        $(this).parent().parent().parent().fadeOut('slow', function (c) {});
    });

    function getStatisticResult(){
        var action="get_statistic_record";
        var url="../../project_wl_servlet_action?action="+action+"&exist_resultset=1";
        $.post(url,function(json){
            console.log(JSON.stringify(json));
            if(json.result_code==0){
                var list=json.aaData;
                if(list!=null){
//                    showStatisticList(json);
                    showStatisticImage(list);
                    showStatisticList(list);
                }
            }else{
                if(Page!=null){
                    Page.processError(json);
                }
            }
        });
    }

    function  showStatisticList(list){
        var html = "<table class=\"table table-bordered\">";
        html +="<thead>";
        html +="    <tr>";
        html +="        <th>时间段</th>";
        html +="        <th>数量</th>";
        html +="    </tr>";
        html +="</thead>";
        html +="<tbody>";
        for(var i =0; i < list.length; i++){
            html +="<tr>";;
            html +="    <td>"+list[i][1]+"</td>";
            html +="     <td>"+list[i][2]+"</td>";
            html +="</tr>";
        }
        html +="<tbody>";
        html +="</table>";
        $("#record_list").html(html);
    }

    function showStatisticImage(list){
        //$("#result_image").attr("src","../../../"+imageFile+"?"+Math.random());
        var myChart = echarts.init(document.getElementById('result_image_div'))
        var cate = [];
        var stat = [];
        for(var i = 0; i < list.length; i++){
            cate.push(list[i][1]);
            stat.push(parseInt(list[i][2]));
        }

        console.log(cate);
        console.log(stat);

        option = {
            xAxis: {
                type: 'category',
                data: cate
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: stat,
                type: 'bar'
            }]
        };
        myChart.setOption(option);
        window.onresize = function () {
            myChart.resize();
        }
    }

</script>



</body>
</html>