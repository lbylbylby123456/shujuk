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
									<i class="fa fa-gift"></i>修改记录
								</div>
								<div class="tools">
									<a href="" class="reload"> </a>
									<a href="" class="remove"> </a>
								</div>
							</div>
							<div class="portlet-body form">
								<form class="form-horizontal" role="form" id="page_form" name="page_form" action="#">
									<input type="hidden" id="action" name="action" value="modify_record" />
									<input type="hidden" id="id" name="id" value="<%=id%>" />
									<input type="hidden" id="exist_resultset" name="exist_resultset" value="<%=existResultset%>" />
									<div class="form-body">
										<div class="form-group">
											<label class="col-md-3" id="record_list_tip">
											</label>
										</div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">
                                                房间类型
                                            </label>
                                            <div class="col-md-2">
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
                                            <div class="col-md-1">
                                                <input   onblur='fun()' type="text" id="orderPrice" name="orderPrice" class="form-control" placeholder="价格" value=""/>
                                            </div>
                                            <label  style="color: red; margin-top: 5px">（请输入正确数字）</label>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">房客</label>
                                            <div class="col-md-1">
                                                <input type="text" onblur='fun1()' id="orderUser" name="orderUser" class="form-control" placeholder="姓名" value=""/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">联系方式</label>
                                            <div class="col-md-2">
                                                <input onblur="upperCase()" type="text" id="userConnect" name="userConnect" class="form-control" placeholder="请输入联系方式" value=""/>
                                            </div>
                                            <label  style="color: red; margin-top: 5px">（请输入正确的手机或电话号码）</label>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">入住时间</label>
                                            <div class="col-md-2">
                                                <input type="text" id="begin_time" name="begin_time" class="form-control" readonly="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">退房时间</label>
                                            <div class="col-md-2">
                                                <input type="text" id="end_time" name="end_time" class="form-control" readonly="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">订单状态</label>
                                            <div class="col-md-2">
                                            <select class="table-group-action-input form-control input-medium" id="status" name="status">
                                                <option value="未支付">未支付</option>
                                                <option value="已支付">已支付</option>
                                            </select>
                                                </div>
                                        </div>
									<div class="form-actions right1">
										<button type="button" id="first_button" class="btn green" title="跳到首记录">
											第一个
										</button>
										<button type="button" id="prev_button" class="btn green" title="跳到前一个记录">
											前一个
										</button>
										<button type="button" id="next_button" class="btn green" title="跳到后一个记录">
											后一个
										</button>
										<button type="button" id="last_button" class="btn green" title="跳到最后一条记录">
											最后一个
										</button>

									</div>
									<div class="form-actions right1">
										<button type="button" id="submit_button" class="btn green" title="把修改好的信息提交到后台保存">
											提交修改
										</button>
										<button type="button" id="return_button" class="btn green">
											返回
										</button>
									</div>
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
<script type="text/javascript" src="../../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE SCRIPTS -->
<script src="../../assets/module/scripts/order/file/order_view.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script language=javascript>
    function fun()
    {
        var b=document.getElementById('orderPrice').value;
        if(isNaN(b)==true)
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