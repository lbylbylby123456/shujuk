<%@page contentType="text/html; charset=UTF-8"%>
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
    jsonObj=(JSONObject)session.getAttribute("myorder_file_get_record_result");
    int c1=0,c2=0,c3=0,c4=0,c5=0;
    double money=0;
    JSONArray jsonArr=(JSONArray)jsonObj.get("aaData");
    int count=jsonArr.length();
    for(int i=0;i<jsonArr.length();i++) {
        ArrayList jsonRec = (ArrayList) jsonArr.get(i);

        if(jsonRec.get(2).equals("大床房")){
            c1=c1+1;
        }else if(jsonRec.get(2).equals("标间")){
            c2=c2+1;
        }else if(jsonRec.get(2).equals("豪华套间")){
            c3=c3+1;
        }else if(jsonRec.get(2).equals("三人间")){
            c4=c4+1;
        }else if(jsonRec.get(2).equals("商务间")) {
            c5 = c5 + 1;
        }
        money=money+Double.parseDouble(jsonRec.get(6).toString());
    }
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
<%
    if(id==null){
%>
    <div id="chartdiv" style="position:relative;width: 300px;height: 200px;margin-top: 0px; float: left;"></div>
         <div style="width: 200px; height: 100px;margin-top: 100px; float: left;" id="allInfo">
             <span>总订单数：<%=count%></span> <br>
            <span>总付款：<%=money%>元</span>  <br>
             </div>
         </div>
    <%
        }
    %>
<input type="hidden" id="id" name="id" value="<%=id%>" />
<input type="hidden" id="c1"  value="<%=c1%>" />
<input type="hidden" id="c2"  value="<%=c2%>" />
<input type="hidden" id="c3"  value="<%=c3%>" />
<input type="hidden" id="c4"  value="<%=c4%>" />
<input type="hidden" id="c5"  value="<%=c5%>" />
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
                                            订单号
                                        </th>
                                        <th>
                                            订单创建时间
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
                                            状态
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
                                            <%=jsonRec.get(3).toString()%>
                                        </th>
                                        <th>
                                            <%=jsonRec.get(2).toString()%>
                                        </th>
                                        <th>
                                            <%=jsonRec.get(4).toString()%>
                                        </th>
                                        <th>
                                            <%=jsonRec.get(5).toString()%>
                                        </th>
                                        <th>
                                            <%=jsonRec.get(7).toString()%>
                                        </th>
                                        <th>
                                            <%=jsonRec.get(8).toString()%>
                                        </th>
                                        <th>
                                            <%=jsonRec.get(6).toString()%>
                                        </th>
                                        <th>
                                            <%=jsonRec.get(9).toString()%>
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

<script src="../assets/module/scripts/myorder/order_print.js" type="text/javascript"></script>

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
