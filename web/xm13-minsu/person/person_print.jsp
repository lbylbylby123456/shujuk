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
    JSONObject jsonObj=new JSONObject();
    jsonObj=(JSONObject)session.getAttribute("person_file_get_record_result");
    JSONArray jsonArr=(JSONArray)jsonObj.get("aaData");
    ArrayList jsonRec = (ArrayList) jsonArr.get(0);
    String name=jsonRec.get(2).toString();
    String sex=jsonRec.get(3).toString();
    String birth=jsonRec.get(4).toString();
  String occupation=jsonRec.get(5).toString();
  String province=jsonRec.get(6).toString();
  String city=jsonRec.get(7).toString();
  String county=jsonRec.get(8).toString();
  String mail=jsonRec.get(9).toString();
  String connect=jsonRec.get(10).toString();
  String signature=jsonRec.get(11).toString();
  String age=jsonRec.get(12).toString();
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
                                            真实姓名
                                        </th>
                                        <th>
                                            <%=name%>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th>
                                            年龄
                                        </th>
                                    <th>
                                        <%=age%>
                                    </th>
                                    </tr>
                                    <tr>
                                        <th>
                                            性别
                                        </th>
                                    <th>
                                        <%=sex%>
                                    </th>
                                    </tr>
                                    <tr>
                                        <th>
                                            生日
                                        </th>
                                    <th>
                                        <%=birth%>
                                    </th>
                                    </tr>
                                    <tr>
                                        <th>
                                            职业
                                        </th>
                                    <th>
                                        <%=occupation%>
                                    </th>
                                    </tr>
                                    <tr>
                                        <th>
                                            所在地
                                        </th>
                                    <th>
                                        <%=province%> <%=city%> <%=county%>
                                    </th>
                                    </tr>
                                    <tr>
                                        <th>
                                            联系方式
                                        </th>
                                    <th>
                                        <%=connect%>
                                    </th>
                                    </tr>
                                    <tr>
                                        <th>
                                            邮箱
                                        </th>
                                        <th>
                                            <%=mail%>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th>
                                            个人简介
                                        </th>
                                        <th>
                                            <%=signature%>
                                        </th>
                                    </tr>
                                    </thead>
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


<!-- END PAGE LEVEL PLUGINS -->
