<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%
	//做调试用，这里要在正式发布的时候去掉

    Date date = new Date();
    //设置要获取到什么样的时间
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    //获取String类型的时间
    String begindate = sdf.format(date);
	System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new java.util.Date())+"]=======================调试："+request.getServletPath()+"开始==============================");
%>
<!DOCTYPE html>
	<head>
		<title>管理系统</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<%@include file="../../home/frame/frame_style.jsp"%>
		<!-- BEGIN PAGE LEVEL STYLES -->
		<link rel="stylesheet" type="text/css" href="../../assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />
		<!-- END PAGE LEVEL SCRIPTS -->
	</head>
	<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-container-bg-solid">
		<%@include file="../../home/frame/frame_top.jsp"%>
		<div class="clearfix"></div>
		<!-- BEGIN CONTAINER -->
		<div class="page-container">
			<%@include file="../../home/frame/frame_left.jsp"%>
			<div class="page-content-wrapper">
				<!-- BEGIN CONTENT -->
				<div class="page-content">
					<%@include file="../../home/frame/frame_portlet.jsp"%>
					<%@include file="../../home/frame/frame_theme_color.jsp"%>
					<%@include file="../../home/frame/frame_page_header.jsp"%>
					<!-- BEGIN PAGE CONTENT-->
					<!-- ----------------------------------------页面开始，替换这里即可---------------------------------------- -->
					<div class="row">
						<div class="col-md-12">
							<div class="portlet box blue ">
								<div class="portlet-title">
									<div class="caption">
										<i class="fa fa-gift"></i>添加记录
									</div>
									<div class="tools">
										<a href="" class="reload"> </a>
										<a href="" class="remove"> </a>
									</div>
								</div>
								<div class="portlet-body form">
									<form class="form-horizontal" role="form" id="page_form" name="page_form" action="#">
										<input type="hidden" id="action" name="action" value="add_record"/>
										<div class="form-body">
											<div class="form-group">
												<label class="col-md-3 control-label">
													房间类型
												</label>
												<div class="col-md-9">
													<select class="table-group-action-input form-control input-medium" id="orderType" name="orderType">
														<option value="大床房">大床房</option>
														<option value="标间">标间</option>
														<option value="豪华套间">豪华套间</option>
														<option value="三人间">三人间</option>
														<option value="商务间">商务间</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">房间价格</label>
												<div class="col-md-2">
													<input  onblur='fun()' type="text" id="orderPrice" name="orderPrice" class="form-control" placeholder="请输入价格" value=""/>
												</div>
                                                <label  style="color: red; margin-top: 5px">（请输入正确数字）</label>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">房客</label>
												<div class="col-md-2">
													<input  onblur='fun1()' type="text" id="orderUser" name="orderUser" class="form-control" placeholder="请输入姓名" value=""/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">联系方式</label>
												<div class="col-md-2">
													<input onblur="upperCase()" id="userConnect" name="userConnect" style="ime-mode:Disabled" class="form-control" placeholder="请输入联系方式" value=""/>
                                                </div>
                                                <label  style="color: red; margin-top: 5px">（请输入正确的手机或电话号码）</label>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">入住时间</label>
                                                <div class="col-md-2">
                                                    <input type="text" data-date-format="yyyy-mm-dd" id="begin_time" name="begin_time"  class="form-control" value="" readonly="true"/>
                                                </div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">退房时间</label>
                                                    <div class="col-md-2">
                                                        <input type="text"  data-date-format="yyyy-mm-dd" id="end_time" name="end_time" class="form-control" value="" readonly="true"/>
                                                    </div>
											</div>
										</div>
										<div class="form-actions right1">
											<button type="button" id="submit_button" class="btn green">
												添加记录
											</button>
											<button type="button" id="return_button" class="btn green">
												返回
											</button>
											<%--<button type="button" id="help_button" class="btn green" title="在线帮助">--%>
												<%--<i class="fa fa-question"></i>--%>
											<%--</button>--%>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- ----------------------------------------页面结束，替换上面即可---------------------------------------- -->
					<!-- END PAGE CONTENT-->
				</div>
				<!-- END CONTENT -->
				<%@include file="../../home/frame/frame_sidebar.jsp"%>
			</div>
			<!-- END CONTENT WRAPPER-->
		</div>
		<!-- END CONTAINER -->
		<%@include file="../../home/frame/frame_bottom.jsp"%>
		<%@include file="../../home/frame/frame_ajax_modal.jsp"%>
	</body>
</html>
<%@include file="../../home/frame/frame_page_component.jsp"%>
<%@include file="../../home/frame/frame_javascript.jsp"%>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="../../assets/global/plugins/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="../../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE SCRIPTS -->
<script type="text/javascript" src="../../assets/module/scripts/order/file/order_add.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
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
        var phoneReg = /^((0\d{2,3}-\d{7,8})|(1[34578]\d{9}))$/;
        if(!(phoneReg.test(phone)) && phone!=null){
            alert("手机或电话号码有误，请重填");
            document.getElementById('userConnect').value='';
            return false;
        }
    }
</script>
