<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String url=(String)session.getAttribute("url1");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>照片墙</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="../assets/index/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="../assets/index/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="../assets/index/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="../assets/index/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="../assets/index/img/apple-touch-icon-144x144-precomposed.png">

    <link href="../assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>


    <!-- BASE CSS -->
    <link href="../assets/index/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/index/css/style.css" rel="stylesheet">
	<link href="../assets/index/css/vendors.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="../assets/index/css/blog.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="../assets/index/css/custom.css" rel="stylesheet">
    <style>
        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=80);
        }
        .white_content {
            display: none;
            position: absolute;
            top: 15%;
            left: 35%;
            width: 40%;
            height: 30%;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }
    </style>
</head>

<body>
	<div id="page">
	<header class="header menu_fixed">
		            <div style="float: left;margin-top: 10px">
                <iframe scrolling="no" src="https://tianqiapi.com/api.php?style=ya&skin=pitaya&color=FF0000" frameborder="0" width="320" height="200" allowtransparency="true"></iframe>
            </div>
		<a href="#menu" class="btn_mobile">
			<div class="hamburger hamburger--spin" id="hamburger">
				<div class="hamburger-box">
					<div class="hamburger-inner"></div>
				</div>
			</div>
		</a>
	<nav id="menu" class="main-menu">
			<ul>
				<li><span><a href="../index/index.jsp">首页</a></span>
				</li>
				<li><span><a href="../xm13-minsu/login/login3.jsp">我是房东</a></span>
				</li>
				<li><span><a href="#">个人中心</a></span>
					<ul>
						<li><a href="../person/person.jsp">个人信息</a></li>
						<li><a href="../myorder/order_list.jsp">我的订单</a></li>
						<li><a href="../album/album_list.jsp">照片墙</a></li>
                        <li><a href="../wl/main">心愿清单</a></li>
					</ul>
				</li>
                <li><span><a href="../questionary/main">发布评论</a></span>
                </li>
			</ul>
		</nav>

	</header>
	<!-- /header -->
        <div id="fade" class="black_overlay">
        </div>
        <div id="MyDiv" class="white_content">
            <div class="main_title_2">
                <span><em></em></span>
                <h2>上传图片</h2>
                <span><em></em></span>
            </div>
            <div class="form-group " style="margin-left: 100px; margin-right: 100px">
                <label >选择图片</label>
                <div class="col-md-9">
                    <div class="fileinput fileinput-new" data-provides="fileinput">
                        <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="border:black solid 0.5px;width: 200px; height: 150px;">
                        </div>
                        <div>
                                                        <form action="FileUpLoad" enctype="multipart/form-data" method="post">
													         <input type="file" name="file1">
                                                             <input type="submit" value="上传"/>
                                                        </form>
                              <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput">
                                移除</a>
                            <a href="<%=url%>" target="_blank">下载文件：<%=url%></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group" style="margin-left: 100px; margin-right: 300px">
                    <label>图片名</label>
                    <input class="form-control" type="text" id="album_id" />
                </div>
                    <div class="form-group"   style="margin-left: 100px; margin-right: 100px">
                        <label>图片简介</label>
                        <input class="form-control" type="text" id="album_info" />
                        <%--<i class="ti-user"></i>--%>
                    </div>
            <div style="margin-right: 100px; margin-left: 100px">
            <input id="addButton" class="btn_1 rounded"  type="button" value="确定"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="close" class="btn_1 rounded"  type="button" value="取消"  onclick="CloseDiv('MyDiv','fade')"/>
            </div>
              </div>
	<main>
		<section class="hero_in general">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>照片墙</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->
		<div class="container margin_60_35">
            <div style="margin-bottom: 20px;">
                <button id="add_button" class="btn_1 rounded">上传图片</button>
                <button id="query_button" class="btn_1 rounded"> 查询图片</button>
            <button  id="print_button" class="btn_1 rounded"> 打印</button>
            <button  id="export_button" class="btn_1 rounded"> 导出</button>
                <button  id="statistic_button" class="btn_1 rounded"> 统计</button>
            </div>
			<div class="row">
				<div class="col-lg-9" id="list">
				</div>
				<!-- /col -->
				<aside class="col-lg-3">
                    <div class="form-body">
                        <div class="form-group">
                            <label style="float: left;color: green" >排序显示</label>
                            <div  class="col-md-10">
                                <select style="float: left" id="sort_01" class="table-group-action-input form-control input-medium" onchange="Page.sortRecord(1);">
                                    <option value="">请选择字段1</option>
                                    <option value="create_time">按创建日期</option>
                                    <option value="album_id">按相册名</option>
                                    <option value="album_info">按简介</option>
                                </select>
                            </div>
                            <br>
                            <div  class="col-md-10">
                                <select style="float: left"  id="sort_02" class="table-group-action-input form-control input-medium" onchange="Page.sortRecord(2);">
                                    <option value="">请选择字段2</option>
                                    <option value="create_time">按创建日期</option>
                                    <option value="album_id">按相册名</option>
                                    <option value="album_info">按简介</option>
                                </select>
                            </div>
                        </div>
                    </div>
				</aside>
				<!-- /aside -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</main>
	<!--/main-->
	</div>
	<!-- page -->
	<div id="toTop"></div><!-- Back to top button -->
</body>
</html>

<!-- COMMON SCRIPTS -->
<script src="../assets/index/js/jquery-2.2.4.min.js"></script>
<script src="../assets/index/js/common_scripts.js"></script>
<script src="../assets/index/js/main.js"></script>
<script src="../assets/index/assets/validate.js"></script>
<!-- INPUT QUANTITY  -->

<script type="text/javascript" src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"></script>


<script type="text/javascript" src="../assets/module/scripts/album/album_list.js"></script>
<script type="text/javascript">
    //弹出隐藏层
    function ShowDiv(show_div,bg_div){
        document.getElementById(show_div).style.display='block';
        document.getElementById(bg_div).style.display='block' ;
        var bgdiv = document.getElementById(bg_div);
        bgdiv.style.width = document.body.scrollWidth;
        $("#"+bg_div).height($(document).height());
    }
    //关闭弹出层
    function CloseDiv(show_div,bg_div)
    {
        document.getElementById(show_div).style.display='none';
        document.getElementById(bg_div).style.display='none';
    }
</script>
