<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.*"%>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.JSONArray" %>
<%
	//做调试用，这里要在正式发布的时候去掉
	System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new java.util.Date())+"]=======================调试："+request.getServletPath()+"开始==============================");
%>

<link rel="stylesheet" type="text/css" href="../assets/module/css/fonts.css"/>
<link rel="stylesheet" type="text/css" href="../assets/global/plugins/font-awesome/css/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="../assets/global/plugins/simple-line-icons/simple-line-icons.min.css"/>
<link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="../assets/global/plugins/uniform/css/uniform.default.css"/>
<link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"/>
<!DOCTYPE html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<!-- BEGIN PAGE LEVEL STYLES -->
		<!-- END PAGE LEVEL SCRIPTS -->
        <style media=print>
            .no_print{display:none;}
            .page_next{page-break-after: always;}
        </style>
    </head>
<div>
    <input type="button" class="no_print" value="打印" onclick="javascript:window.print()">
    <input type="button" class="no_print" value="返回" onclick="javascript:history.back(-1);">
    </div>
	<body >
    <div class="form-group" style="float: left;">
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
                                            照片名
                                        </th>
                                        <th>
                                            照片简介
                                        </th>
                                        <th>
                                            创建时间
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
	</body>
</html>

<script type="text/javascript" src="../assets/global/plugins/jquery.min.js"></script>
<script type="text/javascript" src="../assets/global/plugins/jquery-migrate.min.js"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script type="text/javascript" src="../assets/global/plugins/jquery-ui/jquery-ui.min.js"></script>

<script src="../assets/module/scripts/album/album_print.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
