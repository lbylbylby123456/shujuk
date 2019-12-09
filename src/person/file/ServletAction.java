package person.file;
/*
 * 待完成：用MVC模式分开DB和Action操作
 * 增删改查看导印统功能的实现
 */
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import person.dao.Person;
import person.dao.PersonDao;

import utility.LogEvent;
import utility.excel.ExcelWriter;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ServletAction extends HttpServlet {
    //这里是需要改的,module和sub
    public String module = "person";
    public String sub = "file";

    public String preFix = module + "_" + sub;
    public String resultPath = module + "/" + sub;
    public String resultPage = "person.jsp";
    public String resultUrl = resultPath + "/" + resultPage;
    public String redirectPath = module + "/" + sub;
    public String redirectPage = "person_list.jsp";
    public String redirectUrl = redirectPath + "/" + redirectPage;
    //public String databaseName="xm13-minsu";
    public SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    public LogEvent ylxLog = new LogEvent();

    /*
	 * 处理顺序：先是service，后根据情况doGet或者doPost
	 */
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        processAction(request, response);
    }

    public void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        try {
            ylxLog.setSession(session);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String action = request.getParameter("action");
        boolean actionOk = false;
        showDebug("processAction收到的action是：" + action);
        if (session.getAttribute("user_role") == null) {
            try {
                processError(request, response, 3, "session超时，请重新登录系统！");
            } catch (JSONException e) {
                e.printStackTrace();
            }
        } else {
            if (action == null) {
                try {
                    processError(request, response, 1, "传递过来的action是null！");
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            } else {
                //这几个常规增删改查功能
                if (action.equals("get_record")) {
                    actionOk = true;
                    try {
                        getRecord(request, response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } catch (JSONException e) {
                        e.printStackTrace();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (action.equals("export_record")) {
                    actionOk=true;
                    try {
                        exportRecord(request, response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } catch (JSONException e) {
                        e.printStackTrace();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (action.equals("modify_record")) {
                    actionOk=true;
                    try {
                        modifyRecord(request, response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } catch (JSONException e) {
                        e.printStackTrace();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (action.equals("add_record")) {
                    actionOk=true;
                    try {
                        addRecord(request, response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } catch (JSONException e) {
                        e.printStackTrace();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (!actionOk) {
                    try {
                        processError(request, response, 2, "[" + module + "/" + sub + "/ServletAction]没有对应的action处理过程，请检查action是否正确！action=" + action);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    public void processError(HttpServletRequest request, HttpServletResponse response, int errorNo, String errorMsg) throws JSONException, IOException {
        String action = request.getParameter("action");
        //errorNo=0->没有错误
        //errorNo=1->action是空值
        //errorNo=2->没有对应的处理该action的函数
        //errorNo=3->session超时
        showDebug("错误信息：" + errorMsg + "，代码：" + errorNo);
        JSONObject jsonObj = new JSONObject();
        boolean isAjax = true;
        if (request.getHeader("x-requested-with") == null) {
            isAjax = false;
        }    //判断是异步请求还是同步请求
        if (isAjax) {
            jsonObj.put("result_code", errorNo);
            jsonObj.put("result_msg", errorMsg);
            jsonObj.put("action", action);
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.print(jsonObj);
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            errorMsg = java.net.URLEncoder.encode(errorMsg, "UTF-8");
            String url = resultPath + "/" + resultPage + "?action=" + action + "&result_code=" + errorNo + "&redirect_path=" + redirectPath + "&redirect_page=" + redirectPage + "&result_msg=" + errorMsg;
            showDebug(url);
            response.sendRedirect(url);
        }
    }
    public void addRecord(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String dbName = (String) session.getAttribute("unit_db_name");
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String sex = request.getParameter("sex");
        String birth = request.getParameter("birth");
        String occupation = request.getParameter("occupation");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String county = request.getParameter("county");
        String mail = request.getParameter("mail");
        String connect = request.getParameter("connect");
        String signature = request.getParameter("signature");
        String path= request.getParameter("path");
		/*----------------------------------------数据获取完毕，开始和数据库交互*/
        JSONObject jsonObj=null;
        //检查输入参数是否正确先
        if(dbName!=null){
            String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");
            //String creator=(String)session.getAttribute("user_name");
            String createTime=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
			/*----------------------------------------数据获取完毕，开始和数据库交互*/
            PersonDao AlbumDao=new PersonDao();
            Person query = new Person();
            query.setId(id);
            query.setAge(age);
            query.setAction(action);
            query.setDbName(dbName);
            query.setName(name);
            query.setSex(sex);
            query.setBirth(birth);
            query.setOccupation(occupation);
            query.setProvince(province);
            query.setCity(city);
            query.setCounty(county);
            query.setMail(mail);
            query.setConnect(connect);
            query.setSignature(signature);
            query.setUser_id(userId);
            query.setCreate_time(createTime);
            query.setPath(path);
            jsonObj=AlbumDao.addRecord(query);
            ylxLog.log("用户于 "+createTime+" 添加了 ["+module+"]["+sub+"] 记录","添加记录",module);
        }
        boolean isAjax=true;
        if(request.getHeader("x-requested-with")==null){isAjax=false;}	//判断是异步请求还是同步请求
        if(isAjax){
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.print(jsonObj);
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            response.sendRedirect("person/person.jsp");
        }
    }
    /*
	 * 功能：进行一个本类测试，不用启动整个项目，测试所写的Java
	 */
    public static void main(String[] args) throws Exception {
        System.out.println("");
    }

    public void showDebug(String msg) {
        System.out.println("[" + (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date()) + "][" + module + "/" + sub + "/ServletAction]" + msg);
    }

    public void getRecord(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String dbName = (String) session.getAttribute("unit_db_name");
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String sex = request.getParameter("sex");
        String birth = request.getParameter("birth");
        String occupation = request.getParameter("occupation");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String county = request.getParameter("county");
        String mail = request.getParameter("mail");
        String connect = request.getParameter("connect");
        String signature = request.getParameter("signature");
        String path= request.getParameter("path");
        String existResultset = request.getParameter("exist_resultset");
        if ((existResultset == null) || (existResultset.equals("null") || existResultset.isEmpty()))
            existResultset = "0";
        String userId = session.getAttribute("user_id") == null ? null : (String) session.getAttribute("user_id");
        //这里可以修改成统一一个函数读取变量，下面的session里的attr可以用一个变量代替
        //检查输入参数是否正确先
        showDebug("[getRecord]收到页面传过来的参数是：" + action +","+dbName);
		/*----------------------------------------数据获取完毕，开始和数据库交互*/
        //String creator=(String)session.getAttribute("user_name");
        String createTime = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
        Person query = new Person();
        query.setId(id);
        query.setAge(age);
        query.setAction(action);
        query.setDbName(dbName);
        query.setName(name);
        query.setSex(sex);
        query.setBirth(birth);
        query.setOccupation(occupation);
        query.setProvince(province);
        query.setCity(city);
        query.setCounty(county);
        query.setMail(mail);
        query.setConnect(connect);
        query.setSignature(signature);
        query.setUser_id(userId);
        query.setCreate_time(createTime);
        query.setPath(path);
        JSONObject jsonObj = null;
        if (existResultset.equals("1")) {
            //要求提取之前查询结果，如果有就取出来，如果没有就重新查询一次，并且保存进session里
            if (session.getAttribute(module + "_" + sub + "_get_record_result") != null) {
                jsonObj = (JSONObject) session.getAttribute(module + "_" + sub + "_get_record_result");
            } else {
                //如果没有就报错
                jsonObj = new JSONObject();
                jsonObj.put("result_code", 10);
                jsonObj.put("result_msg", "exist_resultset参数不当，服务器当前没有结果数据！请重新设置！");
            }
        } else {
            //如果是新查询
            PersonDao PersonDao = new PersonDao();
            jsonObj = PersonDao.getRecord(query);
            session.setAttribute(module + "_" + sub + "_get_record_result", jsonObj);
        }
        jsonObj.put("user_id", userId);
        jsonObj.put("action", action);
		/*--------------------数据查询完毕，根据交互方式返回数据--------------------*/
        boolean isAjax = true;
        if (request.getHeader("x-requested-with") == null) {
            isAjax = false;
        }    //判断是异步请求还是同步请求
        if (isAjax) {
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.print(jsonObj);
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            String url = "person/person.jsp";
            showDebug("[getRecord]结果URL：" + url);
            response.sendRedirect(url);
        }
    }
    public void modifyRecord(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String dbName = (String) session.getAttribute("unit_db_name");
        String action = request.getParameter("action");
        //String id = request.getParameter("id");
        String age=request.getParameter("age");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String birth = request.getParameter("birth");
        String occupation = request.getParameter("occupation");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String county = request.getParameter("county");
        String mail = request.getParameter("mail");
        String connect = request.getParameter("connect");
        String signature = request.getParameter("signature");
        String path = request.getParameter("path");
        showDebug("收到的省份："+province+" "+city+" "+county);
		/*----------------------------------------数据获取完毕，开始和数据库交互*/
        JSONObject jsonObj=null;
        //检查输入参数是否正确先
        if(dbName!=null){
            String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");
            //String creator=(String)session.getAttribute("user_name");
            String createTime=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
			/*----------------------------------------数据获取完毕，开始和数据库交互*/
            PersonDao PersonDao=new PersonDao();
            Person query = new Person();
           // query.setId(id);
            query.setAge(age);
            query.setAction(action);
            query.setDbName(dbName);
            query.setName(name);
            query.setSex(sex);
            query.setBirth(birth);
            query.setOccupation(occupation);
            query.setProvince(province);
            query.setCity(city);
            query.setCounty(county);
            query.setMail(mail);
            query.setConnect(connect);
            query.setSignature(signature);
            query.setUser_id(userId);
            query.setCreate_time(createTime);
            query.setPath(path);
            jsonObj=PersonDao.modifyRecord(query);
            ylxLog.log("用户 "+userId+" 修改了 ["+module+"]["+sub+"] 记录","修改记录",module);
        }
        boolean isAjax=true;
        if(request.getHeader("x-requested-with")==null){isAjax=false;}	//判断是异步请求还是同步请求
        if(isAjax){
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.print(jsonObj);
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            response.sendRedirect("person/person.jsp");
        }
    }
    private void exportRecord(HttpServletRequest request, HttpServletResponse response) throws Exception  {
        HttpSession session = request.getSession();
        String dbName = (String) session.getAttribute("unit_db_name");
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String birth = request.getParameter("birth");
        String occupation = request.getParameter("occupation");
        String adress = request.getParameter("adress");
        String mail = request.getParameter("mail");
        String connect = request.getParameter("connect");
        String signature = request.getParameter("signature");
        String age=request.getParameter("age");
        String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");
        showDebug("[exportRecord]收到页面传过来的参数是："+action+" "+name+" "+sex+" "+birth+" "+adress+" "+mail+" "+connect+" "+signature+" "+userId);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/vnd.ms-excel");//响应正文的MIME类型，表示Excel
        ServletOutputStream out = response.getOutputStream();//响应输出流对象
        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet  sheet = wb.createSheet("个人信息");//创建工作簿
        sheet.setColumnWidth(100, 10000);
        HSSFRow titleRow = sheet.createRow(0);
        HSSFCell titleCell1 =titleRow .createCell(0);          //在行中创建第1个单元格
        titleCell1.setCellValue("真实姓名");               //设置第1个单元格的值
        HSSFCell titleCell2= titleRow.createCell(1);           //在行中创建第2个单元格
        titleCell2.setCellValue("性别");                      //设置第2个单元格的值
        HSSFCell titleCell3 =titleRow .createCell(2);          //在行中创建第3个单元格
        titleCell3.setCellValue("生日");                      //设置第3个单元格的值
        HSSFCell titleCell4= titleRow.createCell(3);           //在行中创建第4个单元格
        titleCell4.setCellValue("职业");                      //设置第4个单元格的值
        HSSFCell titleCell5= titleRow.createCell(4);           //在行中创建第5个单元格
        titleCell5.setCellValue("所在地");                      //设置第5个单元格的值
        HSSFCell titleCell6= titleRow.createCell(5);           //在行中创建第6个单元格
        titleCell6.setCellValue("邮箱");                      //设置第6个单元格的值
        HSSFCell titleCell7= titleRow.createCell(6);           //在行中创建第7个单元格
        titleCell7.setCellValue("联系方式");                      //设置第7个单元格的值
        HSSFCell titleCell8= titleRow.createCell(7);           //在行中创建第8个单元格
        titleCell8.setCellValue("个人简介");//设置第8个单元格的值
        HSSFCell titleCel19= titleRow.createCell(8);           //在行中创建第2个单元格
        titleCel19.setCellValue("年龄");

        HSSFRow valueRow = sheet.createRow(1);                    //创建第2行
        HSSFCell Cell1 = valueRow.createCell(0);              //在第2行中创建单元格
        Cell1.setCellValue(name);
        HSSFCell Cell2 = valueRow.createCell(1);
        Cell2.setCellValue(sex);
        HSSFCell Cell3 = valueRow.createCell(2);
        Cell3.setCellValue(birth);
        HSSFCell Cell4 = valueRow.createCell(3);
        Cell4.setCellValue(occupation);
        HSSFCell Cell5 = valueRow.createCell(4);              //在第2行中创建单元格
        Cell5.setCellValue(adress);
        HSSFCell Cell6 = valueRow.createCell(5);
        Cell6.setCellValue(mail);
        HSSFCell Cell7 = valueRow.createCell(6);
        Cell7.setCellValue(connect);
        HSSFCell Cell8 = valueRow.createCell(7);
        Cell8.setCellValue(signature);
        HSSFCell Cell9 = valueRow.createCell(8);
        Cell9.setCellValue(age);
        HSSFCellStyle cellStyle = wb.createCellStyle();
        wb.write(out);//将响应流输入到Excel表格中
        response.addHeader("Content-Disposition", "attachment;filename=user_info.xls");//文件临时保存在demo.xls中
        out.flush();
        out.close();
    }
}
