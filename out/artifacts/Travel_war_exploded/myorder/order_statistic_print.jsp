<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*"%>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.JSONArray" %>


<%
    String id = request.getParameter("id");
   // System.out.println("ddddd"+id);
    JSONObject jsonObj=new JSONObject();
    jsonObj=(JSONObject)session.getAttribute("myorder_file_record_result");
    System.out.println("fsdfsdfsdfdfsfsdfsf:"+jsonObj.toString());
    JSONArray jsonArr=(JSONArray)jsonObj.get("aaData");
    int count=jsonArr.length();
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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<input type="hidden" id="id" name="id" value="<%=id%>" />
<div class="form-group">
    <div id="result_image_div">
        <div id="result_image" style="height: 228px; width: 500px">
        </div>
    </div>
</div>
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
                                        时间段
                                    </th>
                                    <th>
                                        数量
                                    </th>
                                    <th>
                                       统计内容
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for(int i=0;i<count;i++){
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
<script type="text/javascript" src="../assets/global/plugins/jquery.min.js"></script>
<script type="text/javascript" src="../assets/global/plugins/jquery-migrate.min.js"></script>

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
<script type="text/javascript" src="../assets/global/plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="../assets/global/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
<script type="text/javascript" src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="../assets/global/plugins/jquery.blockui.min.js"></script>
<script type="text/javascript" src="../assets/global/plugins/jquery.cokie.min.js"></script>
<script type="text/javascript" src="../assets/global/plugins/uniform/jquery.uniform.min.js"></script>
<script type="text/javascript" src="../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script type="text/javascript" src="../assets/global/scripts/metronic.js"></script>
<script type="text/javascript" src="../assets/admin/layout/scripts/layout.js"></script>
<script type="text/javascript" src="../assets/admin/layout/scripts/quick-sidebar.js"></script>
<script type="text/javascript" src="../assets/admin/layout/scripts/demo.js"></script>
<script type="text/javascript" src="../assets/admin/pages/scripts/index.js"></script>
<script type="text/javascript" src="../assets/admin/pages/scripts/tasks.js"></script>
<script type="text/javascript" src="../assets/admin/pages/scripts/components-dropdowns.js"></script>
<script type="text/javascript" src="../assets/global/plugins/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="../assets/module/scripts/home/mainmenu.js?v"></script>
<script type="text/javascript" src="../assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="../assets/global/scripts/datatable.js"></script>
<!-- BEGIN DATATABLE SCRIPTS -->

<script src="../assets/module/scripts/myorder/order_statistic_print.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
