<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.*"%>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.JSONArray" %>
<%
	//做调试用，这里要在正式发布的时候去掉
	System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new java.util.Date())+"]=======================调试："+request.getServletPath()+"开始==============================");
%>
<%
    String id = request.getParameter("id");
   // System.out.println("ddddd"+id);
    JSONObject jsonObj=new JSONObject();
    jsonObj=(JSONObject)session.getAttribute("album_file_query_record_result");
    JSONArray jsonArr=(JSONArray)jsonObj.get("aaData");
   // System.out.println(money);
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
                                    <tbody>
                                    <%
                                        for(int i=0;i<jsonArr.length();i++){
                                            ArrayList jsonRec = (ArrayList) jsonArr.get(i);
                                    %>
                                    <tr>
                                        <th>
                                            <%=jsonRec.get(1).toString()%>
                                        </th>
                                        <th>
                                            <%=jsonRec.get(2).toString()%>
                                        </th>
                                        <th>
                                            <%=jsonRec.get(3).toString()%>
                                        </th>
                                    </tr>
                                    <%
                                        }
                                    %>
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
<%@include file="../home/frame/frame_page_component.jsp"%>
<%@include file="../home/frame/frame_javascript.jsp"%>

<script src="../assets/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/radar.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/themes/light.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/themes/patterns.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/themes/chalk.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/ammap/ammap.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/ammap/maps/js/worldLow.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amstockcharts/amstock.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
