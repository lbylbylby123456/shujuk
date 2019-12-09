<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*"%>
<%
    String user_id=(String)session.getAttribute("user_id");
    System.out.print(user_id);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>我的订单</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="../assets/index/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="../assets/index/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="../assets/index/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="../assets/index/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="../assets/index/img/apple-touch-icon-144x144-precomposed.png">

    <!-- BASE CSS -->
    <link href="../assets/index/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/index/css/style.css" rel="stylesheet">
	<link href="../assets/index/css/vendors.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="../assets/index/css/blog.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="../assets/index/css/custom.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />
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
            top: 10%;
            left: 35%;
            width: 40%;
            height: 120%;
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
                        <li><a href="../wl/main/index.jsp">心愿清单</a></li>
					</ul>
				</li>
                <li><span><a href="../questionary/main">发布评论</a></span>
                </li>
			</ul>
		</nav>

	</header>
	<!-- /header -->
        <div id="fade" class="black_overlay" onclick="CloseDiv('MyDiv','fade')">
        </div>
        <div id="MyDiv" class="white_content">
            <%--<div class="main_title_2">--%>
                <%--<h2>添加订单</h2>--%>
                <%--<span><em></em></span>--%>
            <%--</div>--%>
            <form id="page_form" role="form" >
                <input type="hidden" id="action" name="action" value="add_record"/>
                    <div class="form-group col-md-6"  style="margin-left: 100px; margin-right: 100px">
                        <label>房间类型</label>
                        <select class="table-group-action-input form-control input-medium" id="orderType" name="orderType">
                            <option value="大床房">大床房</option>
                            <option value="标间">标间</option>
                            <option value="豪华套间">豪华套间</option>
                            <option value="三人间">三人间</option>
                            <option value="商务间">商务间</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3"   style="margin-left: 100px; margin-right: 100px">
                        <label>房间价格</label>
                        <input onblur='fun()' class="form-control" type="text" id="orderPrice" name="orderPrice"/>
                    </div>
                    <div class="form-group col-md-3"   style="margin-left: 100px; margin-right: 100px">
                        <label>房客</label>
                        <input onblur='fun1()' class="form-control" type="text" id="orderUser" name="orderUser" />
                    </div>
                    <div class="form-group col-md-6"   style="margin-left: 100px; margin-right: 100px">
                        <label>联系方式</label>
                        <input onblur="upperCase()" class="form-control" type="text" id="userConnect" name="userConnect" />
                    </div>
                    <div class="form-group col-md-6"   style="margin-left: 100px; margin-right: 100px">
                        <label>入住时间</label>
                        <input class="form-control" type="text" id="begin_time" name="begin_time" readonly="true" />
                    </div>
                    <div class="form-group col-md-6"   style="margin-left: 100px; margin-right: 100px">
                        <label>退房时间</label>
                        <input class="form-control" type="text" id="end_time" name="end_time" readonly="true"/>
                    </div>
                </form>
            <div style="margin-left: 100px; ">
            <button id="addButton" class="btn_1 rounded"  type="button" style="margin-right: 20px; ">确定</button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="close" class="btn_1 rounded"  type="button" value="取消"  onclick="CloseDiv('MyDiv','fade')"/>
            </div>
              </div>
	<main>


		<section class="hero_in tours">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>我的订单</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->
		<div class="container margin_60_35">
            <div style="margin-bottom: 20px;">
             <%--<input id="Button1" class="btn_1 rounded"  type="button" value="添加订单" onclick="ShowDiv('MyDiv','fade')" />--%>


                <button  id="print_button" class="btn_1 rounded"> 打印</button>
                <button  id="export_button" class="btn_1 rounded"> 下载</button>
                <button  id="query_button" class="btn_1 rounded">查询订单</button>
                <button id="statistic_button" class="btn_1 rounded"> 统计订单</button>
            </div>
            <div class="form-body">

                <div class="form-group">
                    <label  style="float: left">排序显示</label>
                    <div  class="col-md-3" style="float: left">
                        <select id="sort_01"  class="table-group-action-input form-control input-medium" onchange="Page.sortRecord(1);">
                            <option value="">请选择字段1</option>
                             <option value="orderID">按订单号</option>
                            <option value="begin_time">按入住时间</option>
                            <option value="end_time">按退房时间</option>
                        </select>
                    </div>
                    <div  class="col-md-3" style="float: left">
                    <select  id="sort_02"  class="table-group-action-input form-control input-medium" onchange="Page.sortRecord(2);">
                        <option value="">请选择字段2</option>
                         <option value="orderID">按订单号</option>
                            <option value="begin_time">按入住时间</option>
                            <option value="end_time">按退房时间</option>
                    </select>
                        </div>
                </div>
            </div>
			<div class="row" style="float: left">
                <div class="form-group">
                    <div class="col-md-12">

                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="portlet grey-cascade box">
                                    <div class="portlet-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover table-bordered table-striped">
                                                <thead>
                                                <tr>
                                                    <th>
                                                        订单号
                                                    </th>
                                                    <th>
                                                        订单类型
                                                    </th>
                                                    <th>
                                                        入住时间
                                                    </th>
                                                    <th>
                                                        退房时间
                                                    </th>
                                                    <th>
                                                        房客
                                                    </th>
                                                    <th>
                                                        联系方式
                                                    </th>
                                                    <th>
                                                        订单价格
                                                    </th>
                                                    <th>
                                                        操作
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody id="record_list_div">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				<!-- /col -->
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
<script type="text/javascript">
    //弹出隐藏层
    function ShowDiv(show_div,bg_div)
    {
        document.getElementById(show_div).style.display='block';
        document.getElementById(bg_div).style.display='block' ;
        var bgdiv = document.getElementById(bg_div);
        bgdiv.style.width = document.body.scrollWidth;
        $("#"+bg_div).height($(document).height());
    };
    //关闭弹出层
    function CloseDiv(show_div,bg_div)
    {
        document.getElementById(show_div).style.display='none';
        document.getElementById(bg_div).style.display='none';
    };
</script>
<!-- COMMON SCRIPTS -->
<script src="../assets/index/js/jquery-2.2.4.min.js"></script>
<script src="../assets/index/js/common_scripts.js"></script>
<script src="../assets/index/js/main.js"></script>
<script src="../assets/index/assets/validate.js"></script>
<!-- INPUT QUANTITY  -->
<script type="text/javascript" src="../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="../assets/module/scripts/myorder/order_list.js"></script>
<script language=javascript>
    function fun()
    {
        var b=document.getElementById('orderPrice').value;
        if(isNaN(b)==true || b=="")
        {
            alert('请输入数字');
            document.getElementById('orderPrice').value='';
        }
    }
    function fun1()
    {
        var c=document.getElementById('orderUser').value;
        var regu = "^[a-zA-Z\u4e00-\u9fa5]+$";
        var re = new RegExp(regu);
        if (!re.test(c)) {
            alert("请正确输入中文或英文！");
            document.getElementById('orderUser').value='';
        }
    }
    function upperCase()
    {
        var phone = document.getElementById('userConnect').value;
        console.log("success",phone);

        var phoneReg = /^((0\d{2,3}-\d{7,8})|(1[34578]\d{9}))$/;
        if(!(phoneReg.test(phone)) && phone!=null){
            alert("手机或电话号码有误，请重填");
            document.getElementById('userConnect').value='';
            return false;
        }
    }
</script>
