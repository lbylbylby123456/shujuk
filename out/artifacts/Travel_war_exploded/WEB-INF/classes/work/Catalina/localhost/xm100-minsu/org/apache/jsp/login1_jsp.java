/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.39
 * Generated at: 2019-05-28 06:02:46 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("\t\t");
      out.write('\r');
      out.write('\n');
      out.write('	');
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<meta name=\"description\" content=\"\">\r\n");
      out.write("<meta name=\"author\" content=\"\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("<title>普通用户登录</title>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("function chang() {\r\n");
      out.write("\tdocument.getElementById(\"image\").src=document.getElementById(\"image\").src + \"?nocache=\"+new Date().getTime();\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<style>\r\n");
      out.write("body {\r\n");
      out.write("\tbackground: url(img/bg.png) repeat-x;\r\n");
      out.write("    background-color:blue;\r\n");
      out.write("\tmin-height: 600px;\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("* {\r\n");
      out.write("\tfont-family: \"微软雅黑\";\r\n");
      out.write("\tmargin: 0;\r\n");
      out.write("\tpadding: 0;\r\n");
      out.write("\tborder: 0;\r\n");
      out.write("\tfont-size: 14px;\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("html, body {\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\twidth: 100%;;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".kuico {\r\n");
      out.write("\tbackground: url(img/denglu.jpg) no-repeat;\r\n");
      out.write("\tdisplay: inline-block;\r\n");
      out.write("\twidth: 26px;\r\n");
      out.write("\theight: 16px;\r\n");
      out.write("\tmargin-right: 5px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".kuintro {\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("\tpadding-right: 5px;\r\n");
      out.write("\trgba(255,\r\n");
      out.write("\t255,\r\n");
      out.write("\t255,\r\n");
      out.write("\t0.8);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".kutrg {\r\n");
      out.write("\tbackground: url(img/denglu.jpg) no-repeat;\r\n");
      out.write("\tdisplay: inline-block;\r\n");
      out.write("\twidth: 10px;\r\n");
      out.write("\theight: 6px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("a {\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("\tcolor: rgba(255, 255, 255, 255);\r\n");
      out.write("\tcursor: pointer;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".robot {\r\n");
      out.write("\tbackground: url(img/denglu1.jpg) no-repeat;\r\n");
      out.write("\tdisplay: inline-block;\r\n");
      out.write("\twidth: 18px;\r\n");
      out.write("\theight: 20px;\r\n");
      out.write("\tpadding-right: 5px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".question {\r\n");
      out.write("\tbackground: url(img/question.png) no-repeat;\r\n");
      out.write("\tdisplay: inline-block;\r\n");
      out.write("\twidth: 20px;\r\n");
      out.write("\theight: 20px;\r\n");
      out.write("\tpadding-right: 5px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".downIntro, .introYun, .account {\r\n");
      out.write("\tfloat: left;\r\n");
      out.write("\tmargin-right: 25px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".name, .pwd {\r\n");
      out.write("\twidth: 310px;\r\n");
      out.write("\theight: 44px;\r\n");
      out.write("\tline-height: 44px;\r\n");
      out.write("\tpadding-left: 15px;\r\n");
      out.write("\toutline: none;\r\n");
      out.write("\tborder-radius: 20px;\r\n");
      out.write("\tbackground-color: #0A3C78;\r\n");
      out.write("\tborder: 1px solid #329BE0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".name:hover, .pwd:hover, .name:focus, .pwd:focus {\r\n");
      out.write("\tbackground-color: #052b64;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#login {\r\n");
      out.write("\tbackground: #3fb9ff;\r\n");
      out.write("\tfont-size: 18px;\r\n");
      out.write("\twidth: 329px;\r\n");
      out.write("\theight: 44px;\r\n");
      out.write("\toutline: none;\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("\tbackground: -webkit-linear-gradient(#3fb9ff, #099be7, #229de3);\r\n");
      out.write("\tbackground: -o-linear-gradient(#3fb9ff, #099be7, #229de3);\r\n");
      out.write("\tbackground: -moz-linear-gradient(#3fb9ff, #099be7, #229de3);\r\n");
      out.write("\tbackground: linear-gradient(#3fb9ff, #099be7, #229de3);\r\n");
      out.write("\tborder-radius: 20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#login:hover {\r\n");
      out.write("\tbackground: -webkit-linear-gradient(#229de3, #099be7, #3fb9ff);\r\n");
      out.write("\tbackground: -o-linear-gradient(#229de3, #099be7, #3fb9ff);\r\n");
      out.write("\tbackground: -moz-linear-gradient(#229de3, #099be7, #3fb9ff);\r\n");
      out.write("\tbackground: linear-gradient(#229de3, #099be7, #3fb9ff);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#hLeft {\r\n");
      out.write("\tfloat: left;\r\n");
      out.write("\theight: 32px;\r\n");
      out.write("\tvertical-align: middle;\r\n");
      out.write("\tline-height: 32px;\r\n");
      out.write("\twidth: 172px;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\tcursor: pointer;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#hright {\r\n");
      out.write("\tfloat: right;\r\n");
      out.write("\tmargin-right: 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#head {\r\n");
      out.write("\theight: 50px;\r\n");
      out.write("\tpadding-top: 25px;\r\n");
      out.write("\tmargin-left: 14px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#middle {\r\n");
      out.write("\tmargin-top: 100px;\r\n");
      out.write("\t/* height:600px; */\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#footer {\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\tbottom: 15px;\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#footer a {\r\n");
      out.write("\tcolor: black;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#middle li {\r\n");
      out.write("\tlist-style-type: none;\r\n");
      out.write("\tmargin-top: 15px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#children li {\r\n");
      out.write("\tlist-style-type: none;\r\n");
      out.write("\theight: 42px;\r\n");
      out.write("\tline-height: 42px;\r\n");
      out.write("\tborder-bottom: 1px double rgb(5, 33, 113);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#children li a {\r\n");
      out.write("\tcolor: rgba(255, 255, 255);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".register {\r\n");
      out.write("\tpadding-right: 25px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".downApk {\r\n");
      out.write("\tbackground: url(img/denglu1.jpg) no-repeat 30px;\r\n");
      out.write("\ttext-indent: 25px;\r\n");
      out.write("\tdisplay: inline-block;\r\n");
      out.write("\theight: 32px;\r\n");
      out.write("\tline-height: 32px;\r\n");
      out.write("\twidth: 232px;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".downApk:hover {\r\n");
      out.write("\tbackground-color: #354d8d;\r\n");
      out.write("\tborder-radius: 16px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".introduce {\r\n");
      out.write("\tbackground: url(img/question.png) no-repeat 20px;\r\n");
      out.write("\ttext-indent: 20px;\r\n");
      out.write("\tdisplay: inline-block;\r\n");
      out.write("\theight: 32px;\r\n");
      out.write("\tline-height: 32px;\r\n");
      out.write("\twidth: 140px;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".introduce:hover {\r\n");
      out.write("\tbackground-color: #354d8d;\r\n");
      out.write("\tborder-radius: 16px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".reg {\r\n");
      out.write("\theight: 32px;\r\n");
      out.write("\tline-height: 32px;\r\n");
      out.write("\twidth: 129px;\r\n");
      out.write("\tdisplay: inline-block;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".reg:hover {\r\n");
      out.write("\tbackground-color: #354d8d;\r\n");
      out.write("\tborder-radius: 16px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".forgetPwd {\r\n");
      out.write("\theight: 32px;\r\n");
      out.write("\tline-height: 32px;\r\n");
      out.write("\twidth: 129px;\r\n");
      out.write("\tdisplay: inline-block;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".forgetPwd:hover {\r\n");
      out.write("\tbackground-color: #354d8d;\r\n");
      out.write("\tborder-radius: 16px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#children {\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\tmargin-top: 35px;\r\n");
      out.write("\tleft: 14px;\r\n");
      out.write("\twidth: 172px;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\tbackground-color: #1f377f;\r\n");
      out.write("\tdisplay: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#hLeft:hover {\r\n");
      out.write("\tbackground-color: #1f377f;\r\n");
      out.write("\tborder-radius: 16px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#children li:hover {\r\n");
      out.write("\tbackground-color: #354d8d;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#cloud {\r\n");
      out.write("\tbackground: url(img/cloud.png) repeat;\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 356px;\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\tbottom: 0px;\r\n");
      out.write("\t-webkit-animation: cloud 60s linear infinite alternate;\r\n");
      out.write("\t-moz-animation: clouds 60s linear infinite alternate;\r\n");
      out.write("\tz-index: -10;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@\r\n");
      out.write("-webkit-keyframes cloud { 0%{\r\n");
      out.write("\tbackground-position: top left\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("100%{\r\n");
      out.write("background-position\r\n");
      out.write(":top\r\n");
      out.write(" \r\n");
      out.write("right\r\n");
      out.write("}\r\n");
      out.write("}\r\n");
      out.write("@\r\n");
      out.write("-moz-keyframes clouds { 0%{\r\n");
      out.write("\tbackground-position: top left\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("100%{\r\n");
      out.write("background-position\r\n");
      out.write(":top\r\n");
      out.write(" \r\n");
      out.write("right\r\n");
      out.write("}\r\n");
      out.write("}\r\n");
      out.write("#err {\r\n");
      out.write("\tdisplay: none;\r\n");
      out.write("\tcolor: red;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#sky {\r\n");
      out.write("\tbackground: url(img/denglu.jpg) repeat;\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theigth: 100%;\r\n");
      out.write("\tz-index: -20;\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\ttop: 0px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#valid {\r\n");
      out.write("\theight: 44px;\r\n");
      out.write("\twidth: 150px;\r\n");
      out.write("\ttext-indent: 1em;\r\n");
      out.write("\tvertical-align: middle;\r\n");
      out.write("\tline-height: 46px;\r\n");
      out.write("\toutline: none;\r\n");
      out.write("\tborder-radius: 20px;\r\n");
      out.write("\tbackground-color: #0A3C78;\r\n");
      out.write("\tborder: 1px solid #329BE0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#validcode {\r\n");
      out.write("\tdisplay: inline-block;\r\n");
      out.write("\twidth: 100px;\r\n");
      out.write("\theight: 30px;\r\n");
      out.write("\tmargin-left: 5px;\r\n");
      out.write("\tvertical-align: middle;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#changeimg {\r\n");
      out.write("\tmargin-left: 15px;\r\n");
      out.write("\tcursor: pointer;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#tlogin:focus {\r\n");
      out.write("\toutline: none;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/bootstrap.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div id=\"sky\"></div>\r\n");
      out.write("\t<div id=\"head\"></div>\r\n");
      out.write("\t<div id=\"middle\">\r\n");
      out.write("\t\t<form action=\"login1.action\" method=\"post\">\r\n");
      out.write("\t\t\t<ul style=\"text-align: center;\">\r\n");
      out.write("\t\t\t\t<li style=\"font-size: 48px\">民&nbsp;宿&nbsp;旅&nbsp;游&nbsp;平&nbsp;台</li>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<li><input class=\"name\" name=\"username\" placeholder=\"请输入用户名\" style=\"margin-top: 25px;\"></li>\r\n");
      out.write("\t\t\t\t<li><input type=\"password\" name=\"password\" class=\"pwd\"placeholder=\"请输入密码\"></li>\r\n");
      out.write("\t\t\t\t\t<li id=\"verifyCode\" style=\"display: block;\">\r\n");
      out.write("                    <input id=\"valid\"name=\"rand\" placeholder=\"请输入验证码\" maxlength=\"4\">\r\n");
      out.write("                    <span id=\"validcode\">\r\n");
      out.write("                        <img id=\"image\" id=\"img_captcha\"src=\"imgAction\">\r\n");
      out.write("                    </span>\r\n");
      out.write("                    <span id=\"changeimg\" onclick=\"chang()\">换一张</span></li>\r\n");
      out.write("\t\t\t\t<li><button id=\"login\">立即登录</button></li>\r\n");
      out.write("\t\t\t\t<li><span id=\"err\" style=\"display: inline-block;\"></span></li>\r\n");
      out.write("\t\t\t\t<li></li>\r\n");
      out.write("\t\t\t\t<li><span><a href=\"login2.jsp\" style=\"color: blue;\">管理员身份登录</a>&nbsp; &nbsp;|&nbsp; &nbsp;\r\n");
      out.write("\t\t\t\t<a href=\"register.jsp\" style=\"color: blue;\">注册</a></span></li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div id=\"footer\">\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- <a>关于我们@qq50330690 &nbsp; &nbsp;|&nbsp; &nbsp;</a> <a>Copyright © 2015\r\n");
      out.write("\t\t\t宋安伟 保留所有权利 沪ICP备110号-1</a> -->\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div id=\"cloud\"></div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<script src=\"js/jquery-2.1.1.js\" type=\"text/javascript\" charset=\"UTF-8\"></script>\r\n");
      out.write("\t<script language='javascript' type='text/javascript'>\r\n");
      out.write("\t\t$(document).ready(function() {\r\n");
      out.write("\t\t\tinit();\r\n");
      out.write("\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\tfunction init() {\r\n");
      out.write("\r\n");
      out.write("\t\t\t$(\".name,.pwd\").keyup(function(event) {\r\n");
      out.write("\t\t\t\tif (event.keyCode === 13) {\r\n");
      out.write("\t\t\t\t\t$('#login').click();\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\t$(\"form\").submit(function(event) {\r\n");
      out.write("\t\t\t\tvar account = $(\".name\").val();\r\n");
      out.write("\t\t\t\tvar pwd = $(\".pwd\").val();\r\n");
      out.write("\t\t\t\tif (!account || !pwd) {\r\n");
      out.write("\t\t\t\t\t$(\"#err\").css(\"display\", \"inline-block\");\r\n");
      out.write("\t\t\t\t\t$(\"#err\").text(\"请输入用户名或密码\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tvar code = $(\"#valid\").val().toLocaleLowerCase();\r\n");
      out.write("\t\t\t\tcode = $.trim(code);\r\n");
      out.write("\t\t\t\tif (code.length < 4) {\r\n");
      out.write("\t\t\t\t\t$(\"#err\").css(\"display\", \"inline-block\");\r\n");
      out.write("\t\t\t\t\t$(\"#err\").text(\"验证码错误\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t\t$('#changeimg').click(function() {\r\n");
      out.write("\t\t\t\t$('#verifyCodePic')[0].src = '/jcaptcha.jpg?' + Math.random();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
