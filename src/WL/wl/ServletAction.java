package WL.wl;

import WL.excel.ExcelWriter;
import dao.ylx_db;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by H on 2019/6/10.
 */
public class ServletAction extends HttpServlet{
    String redirectPath = "";
    String module = "project";
    String sub = "wl";
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            processAction(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void processAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action.equals("get_record")){
                getRecord(request,response);
        }
        else if(action.equals("add_record")){
            addRecord(request,response);
        }
        else if(action.equals("query_record")){
            queryRecord(request,response);
        }
        else if(action.equals("sort_record")){
            sortRecord(request,response);
        }
        else if(action.equals("delete_record")){
            deleteRecord(request,response);
        }
        else if(action.equals("modify_record")){
            modifyRecord(request,response);
        }
        else if(action.equals("export_record")){
            exportRecord(request,response);
        }
        else if(action.equals("statistic_record")){
            statisticRecord(request,response);
        }
        else if(action.equals("delete_record_query")){
            deleteRecordWithContent(request,response);
        }
        else if(action.equals("modify_record_query")){
            modifyRecordWithContent(request,response);
        }
        else if(action.equals("get_statistic_record")){
            getStatisticRecord(request,response);
        }
    }

    private void getStatisticRecord(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        String dbName=(String)session.getAttribute("unit_db_name");
        String type=request.getParameter("type");
        String timeFrom=request.getParameter("time_from");
        String timeTo=request.getParameter("time_to");
        String timeInterval=request.getParameter("time_interval");
        String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");
        String userName=session.getAttribute("user_name")==null?null:(String)session.getAttribute("user_name");
        String existResultset= request.getParameter("exist_resultset");
        if((existResultset==null) ||(existResultset.equals("null") || existResultset.isEmpty())) existResultset="0";
        showDebug("getStatisticRecord收到页面传过来的参数是："+existResultset+","+timeFrom+","+timeTo+","+timeInterval);

		/*----------------------------------------数据获取完毕，开始和数据库交互*/
        JSONObject jsonObj=null;
        //检查输入参数是否正确先
        if(existResultset.equals("1")){			//如果是新查询
            //如果有就取出来，如果没有就重新查询一次，并且保存进session里
            if(session.getAttribute(module+"_"+sub+"_statistic_record_result")!=null){
                jsonObj=(JSONObject)session.getAttribute(module+"_"+sub+"_statistic_record_result");
                showDebug("取出了原来的结果");
            }else{
                jsonObj=new JSONObject();
                jsonObj.put("result_code",10);
                jsonObj.put("result_msg","session里没有找到之前统计的数据！");
                showDebug("没有结果："+module+"_"+sub+"_statistic_record_result");
            }
        }else{
            //这里无法进行新的统计
            showDebug("没有结果，而且不进行新的统计");
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
            String resultMsg="操作已经执行，请按返回按钮返回列表页面！";
            int resultCode=0;
            String redirectUrl = "record_list.jsp";
            resultMsg=java.net.URLEncoder.encode(resultMsg, "UTF-8");
            String url = "wl/statistic/record_list.jsp?result_msg="+resultMsg+"&result_code="+resultCode+"&redirect_url="+redirectUrl;
            showDebug("getStatisticRecord结果URL："+url);
            response.sendRedirect(url);
        }
    }

    private void modifyRecordWithContent(HttpServletRequest request, HttpServletResponse response) throws IOException, JSONException, SQLException {
        String id = request.getParameter("id");
        String modify_type = request.getParameter("modify_type");
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");
        String content = request.getParameter("content");
        String Dates = request.getParameter("dates");
        String spliter = ">";
        String[] D = Dates.split(spliter);
        String DateFrom = D[0];
        String DateTo = D[1];

        JSONObject jsonObject = new JSONObject();
        ArrayList data = new ArrayList();
        System.out.println("modifyRecord");
        String dbName = (String)(request.getSession().getAttribute("unit_db_name"));
        ylx_db query_db = new ylx_db(dbName);
//        modifyrecord
        String delete_sql = "update wishlist set share_type='"+modify_type+"' where user_id='"+user_id+"' and id='"+id+"'";
        System.out.println(delete_sql);
        query_db.executeUpdate(delete_sql);
//        get the updated record
        String sql = "select * from wishlist where user_id='"+user_id+"'"+" and name like '%%"+content+"%%' and create_time between '"+DateFrom+"' and '"+DateTo+"'";
        System.out.println(sql);
        ResultSet rs = query_db.executeQuery(sql);
        while(rs.next()){
            ;ArrayList item = new ArrayList();
            item.add(rs.getString("id"));
            item.add(rs.getString("name"));
            item.add(rs.getString("province"));
            item.add(rs.getString("city"));
            item.add(rs.getString("district"));
            item.add(rs.getString("address"));
            item.add(rs.getString("price"));
            item.add(rs.getString("create_time"));
            item.add(rs.getString("share_type"));
            data.add(item);
        }
        jsonObject.put("data",data);
        System.out.println(jsonObject.toString());
        boolean isAjax=true;
        if(request.getHeader("x-requested-with")==null){isAjax=false;}	//判断是异步请求还是同步请求
        if(isAjax){
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.print(jsonObject);
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            String resultMsg="操作已经执行，请按返回按钮返回列表页面！";
            int resultCode=0;
            String redirectUrl="record_list.jsp?exist_resultset=1";
            resultMsg=java.net.URLEncoder.encode(resultMsg, "UTF-8");
            String url = redirectPath+"/"+redirectUrl;
            showDebug("[getRecord]结果URL："+url);
            response.sendRedirect(url);
        }
    }

    private void deleteRecordWithContent(HttpServletRequest request, HttpServletResponse response) throws IOException, JSONException, SQLException {
        String content = request.getParameter("content");
        String Dates = request.getParameter("dates");
        String spliter = ">";
        String[] D = Dates.split(spliter);
        String DateFrom = D[0];
        String DateTo = D[1];

        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");
        JSONObject jsonObject = new JSONObject();
        ArrayList data = new ArrayList();
        System.out.println("deleteRecord");
        String dbName = (String)(request.getSession().getAttribute("unit_db_name"));
        ylx_db query_db = new ylx_db(dbName);
//        deleterecord
        String delete_sql = "delete  from wishlist where user_id='"+user_id+"' and id='"+id+"'";
        query_db.executeUpdate(delete_sql);
//        get the updated record
        String sql = "select * from wishlist where user_id='"+user_id+"'"+" and name like '%%"+content+"%%' and create_time between '"+DateFrom+"' and '"+DateTo+"'";
        System.out.println(sql);
        ResultSet rs = query_db.executeQuery(sql);
        while(rs.next()){
            ;ArrayList item = new ArrayList();
            item.add(rs.getString("id"));
            item.add(rs.getString("name"));
            item.add(rs.getString("province"));
            item.add(rs.getString("city"));
            item.add(rs.getString("district"));
            item.add(rs.getString("address"));
            item.add(rs.getString("price"));
            item.add(rs.getString("create_time"));
            data.add(item);
        }
        jsonObject.put("data",data);
        System.out.println(jsonObject.toString());
        boolean isAjax=true;
        if(request.getHeader("x-requested-with")==null){isAjax=false;}	//判断是异步请求还是同步请求
        if(isAjax){
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.print(jsonObject);
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            String resultMsg="操作已经执行，请按返回按钮返回列表页面！";
            int resultCode=0;
            String redirectUrl="record_list.jsp?exist_resultset=1";
            resultMsg=java.net.URLEncoder.encode(resultMsg, "UTF-8");
            String url = redirectPath+"/"+redirectUrl;
            showDebug("[getRecord]结果URL："+url);
            response.sendRedirect(url);
        }
    }

    private void getRecord(HttpServletRequest request, HttpServletResponse response) throws SQLException, JSONException, IOException {
//        String
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");
//        test
//        String user_id = "zhangsan";
//        test end
        JSONObject jsonObject = new JSONObject();
        ArrayList data = new ArrayList();
        System.out.println("getRecord");
        String dbName = (String)(request.getSession().getAttribute("unit_db_name"));
        ylx_db query_db = new ylx_db(dbName);

        String sql = "select * from wishlist where user_id='"+user_id+"'";
        ResultSet rs = query_db.executeQuery(sql);
        while(rs.next()){
            ;ArrayList item = new ArrayList();
            item.add(rs.getString("id"));
            item.add(rs.getString("name"));
            item.add(rs.getString("province"));
            item.add(rs.getString("city"));
            item.add(rs.getString("district"));
            item.add(rs.getString("address"));
            item.add(rs.getString("price"));
            item.add(rs.getString("create_time"));
            item.add(rs.getString("share_type"));
            data.add(item);
        }
        jsonObject.put("data",data);
        System.out.println(jsonObject.toString());
        session.setAttribute("project_wl_get_record_result",jsonObject);
        boolean isAjax=true;
        if(request.getHeader("x-requested-with")==null){isAjax=false;}	//判断是异步请求还是同步请求
        if(isAjax){
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.print(jsonObject);
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            String resultMsg="操作已经执行，请按返回按钮返回列表页面！";
            int resultCode=0;
            String redirectUrl="record_list.jsp?exist_resultset=1";
            resultMsg=java.net.URLEncoder.encode(resultMsg, "UTF-8");
            String url = redirectPath+"/"+redirectUrl;
            showDebug("[getRecord]结果URL："+url);
            response.sendRedirect(url);
        }
    }

    private void statisticRecord(HttpServletRequest request, HttpServletResponse response) throws IOException, JSONException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        String dbName=(String)session.getAttribute("unit_db_name");
        String type=request.getParameter("type");
        String timeFrom=request.getParameter("time_from");
        String timeTo=request.getParameter("time_to");
        String timeInterval=request.getParameter("time_interval");
//        String addressId=request.getParameter("address_id");
        String statisticType=request.getParameter("statistic_type");
        if(statisticType==null) statisticType="no";
        showDebug("[statisticRecord]收到页面传过来的参数是："+timeFrom+","+timeTo+","+timeInterval+",statisticType="+statisticType);
        String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");
        String userName=session.getAttribute("user_name")==null?null:(String)session.getAttribute("user_name");

        //开始查询数据库
        String resultMsg="ok";
        int resultCode=0;
        List jsonList = new ArrayList();
        int count=0;
        try {
            ylx_db query_db = new ylx_db(dbName);
            //构造sql语句，根据传递过来的查询条件参数
            String sql=getStatisticRecordSql(request);
            ResultSet rs = query_db.executeQuery(sql);
            while (rs.next()) {
                //查询出来有plate_color,time_interval,count,plate_color_name这几项
                List list = new ArrayList();
                list.add(count+"");
                list.add(rs.getString("time_interval"));
                list.add(rs.getString("count"));
                list.add("无区分");
                list.add("无区分");
                //showDebug(rs.getString("plate_color")+","+rs.getString("address_id")+","+rs.getString("time_interval")+","+rs.getString("count"));
                jsonList.add(list);
                count=count+1;
            }
            rs.close();
            query_db.close();
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
            resultCode=10;
            resultMsg="查询数据库出现错误！"+sqlexception.getMessage();
        }
        //////////数据库查询完毕，得到了json数组jsonList//////////
        //jsonList.clear();
        //下面开始构建返回的json
        JSONObject jsonObj=new JSONObject();
        jsonObj.put("aaData",jsonList);
        jsonObj.put("action",action);
        jsonObj.put("result_msg",resultMsg);//如果发生错误就设置成"error"等
        jsonObj.put("result_code",resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
//        return jsonObj;
        jsonObj.put("user_id",userId);
        jsonObj.put("user_name",userName);
        session.setAttribute(module+"_"+sub+"_statistic_record_result",jsonObj);

        showDebug("[statisticRecord]统计完毕，保存进session："+module+"_"+sub+"_statistic_record_result");

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
            resultMsg = "操作已经执行，请按返回按钮返回列表页面！";
            resultCode = 0;
            String redirectUrl = "../wl/wl_list.jsp";
            resultMsg=java.net.URLEncoder.encode(resultMsg, "UTF-8");
            String resultUrl = "./wl/statistic/wl_statistic_result.jsp";
            String url = resultUrl+"?exist_resultset=1&result_msg="+resultMsg+"&result_code="+resultCode+"&redirect_url="+redirectUrl;
            showDebug("[statisticRecord]结果URL："+url);

//			session.setAttribute(module+"_"+sub+"_get_record_result",jsonObj);

            response.sendRedirect(url);
        }
    }

    private void exportRecord(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String dbName=(String)session.getAttribute("unit_db_name");
        String action = request.getParameter("action");
        String existResultset= request.getParameter("exist_resultset");
        if((existResultset==null) ||(existResultset.equals("null") || existResultset.isEmpty())) existResultset="0";
        String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");
        String userName=session.getAttribute("user_name")==null?null:(String)session.getAttribute("user_name");
        String userRole=session.getAttribute("user_role")==null?null:(String)session.getAttribute("user_role");
        String userAvatar=session.getAttribute("user_avatar")==null?null:(String)session.getAttribute("user_avatar");
        System.out.println("do export");
        //这里可以修改成统一一个函数读取变量，下面的session里的attr可以用一个变量代替
        //检查输入参数是否正确先
        showDebug("[exportRecord]收到页面传过来的参数是："+existResultset+","+action);
		/*----------------------------------------数据获取完毕，开始和数据库交互*/
        String creator=(String)session.getAttribute("user_name");
        String createTime=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
        String fileName = "wishlist_export_"+(new SimpleDateFormat("yyyyMMddHHmmss")).format(new Date())+".xls";
        String exportFilePathName="C:\\upload\\"+fileName;
        JSONObject jsonObj=null;
        if(existResultset.equals("1")){
            //要求从session提取之前查询结果，如果有就取出来，如果没有就保存
            if(session.getAttribute(module+"_"+sub+"_get_record_result")!=null){
                jsonObj=(JSONObject)session.getAttribute(module+"_"+sub+"_get_record_result");
                //取出来以后，导出
                exportData(jsonObj,exportFilePathName);
            }else{
                //如果没有就报错
                jsonObj=new JSONObject();
                jsonObj.put("result_code",10);
                jsonObj.put("result_msg","exist_resultset参数不当，服务器当前没有结果数据！请重新设置！");
            }
        }else{
            //如果没有就报错
            jsonObj=new JSONObject();
            jsonObj.put("result_code",10);
            jsonObj.put("result_msg","exist_resultset参数不当，服务器当前没有结果数据！请重新设置！");
        }
        jsonObj.put("user_id",userId);
        jsonObj.put("user_name",userName);
        jsonObj.put("user_role",userRole);
        jsonObj.put("user_avatar",userAvatar);
        jsonObj.put("action",action);
        jsonObj.put("filename",fileName);
		/*--------------------数据查询完毕，根据交互方式返回数据--------------------*/
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
            String resultMsg="操作已经执行，文件已导出为：“"+fileName+"”，请按下载按钮下载，按返回按钮返回列表页面！";
            int resultCode=0;
            String redirectUrl="../file/hm_list.jsp";
            resultMsg=java.net.URLEncoder.encode(resultMsg, "UTF-8");
            String url = "hm/file/download_result.jsp"+"?result_msg="+resultMsg+"&result_code="+resultCode+"&redirect_url="+redirectUrl+"&redirect_param_name=exist_resultset&redirect_param=1&fileName="+fileName;
            showDebug("[exportRecord]结果URL："+url);
            response.sendRedirect(url);
        }
    }

    private void modifyRecord(HttpServletRequest request, HttpServletResponse response) throws IOException, JSONException, SQLException {
        String id = request.getParameter("id");
        String modify_type = request.getParameter("modify_type");
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");
        JSONObject jsonObject = new JSONObject();
        ArrayList data = new ArrayList();
        System.out.println("modifyRecord");
        String dbName = (String)(request.getSession().getAttribute("unit_db_name"));
        ylx_db query_db = new ylx_db(dbName);
//        modifyrecord//        modifyrecord
        String delete_sql = "update wishlist set share_type='"+modify_type+"' where user_id='"+user_id+"' and id='"+id+"'";
        query_db.executeUpdate(delete_sql);
//        get the updated record
        String sql = "select * from wishlist where user_id='"+user_id+"'";
        ResultSet rs = query_db.executeQuery(sql);
        while(rs.next()){
            ;ArrayList item = new ArrayList();
            item.add(rs.getString("id"));
            item.add(rs.getString("name"));
            item.add(rs.getString("province"));
            item.add(rs.getString("city"));
            item.add(rs.getString("district"));
            item.add(rs.getString("address"));
            item.add(rs.getString("price"));
            item.add(rs.getString("create_time"));
            item.add(rs.getString("share_type"));
            data.add(item);
        }
        jsonObject.put("data",data);
        System.out.println(jsonObject.toString());
        boolean isAjax=true;
        if(request.getHeader("x-requested-with")==null){isAjax=false;}	//判断是异步请求还是同步请求
        if(isAjax){
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.print(jsonObject);
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            String resultMsg="操作已经执行，请按返回按钮返回列表页面！";
            int resultCode=0;
            String redirectUrl="record_list.jsp?exist_resultset=1";
            resultMsg=java.net.URLEncoder.encode(resultMsg, "UTF-8");
            String url = redirectPath+"/"+redirectUrl;
            showDebug("[modifyRecord]结果URL："+url);
            response.sendRedirect(url);
        }

    }

    private void deleteRecord(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, JSONException {
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");
        JSONObject jsonObject = new JSONObject();
        ArrayList data = new ArrayList();
        System.out.println("deleteRecord");
        String dbName = (String)(request.getSession().getAttribute("unit_db_name"));
        ylx_db query_db = new ylx_db(dbName);
//        deleterecord
        String delete_sql = "delete  from wishlist where user_id='"+user_id+"' and id='"+id+"'";
        query_db.executeUpdate(delete_sql);
//        get the updated record
        String sql = "select * from wishlist where user_id='"+user_id+"'";
        ResultSet rs = query_db.executeQuery(sql);
        while(rs.next()){
            ;ArrayList item = new ArrayList();
            item.add(rs.getString("id"));
            item.add(rs.getString("name"));
            item.add(rs.getString("province"));
            item.add(rs.getString("city"));
            item.add(rs.getString("district"));
            item.add(rs.getString("address"));
            item.add(rs.getString("price"));
            item.add(rs.getString("create_time"));
            item.add(rs.getString("share_type"));
            data.add(item);
        }
        jsonObject.put("data",data);
        System.out.println(jsonObject.toString());
        boolean isAjax=true;
        if(request.getHeader("x-requested-with")==null){isAjax=false;}	//判断是异步请求还是同步请求
        if(isAjax){
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.print(jsonObject);
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            String resultMsg="操作已经执行，请按返回按钮返回列表页面！";
            int resultCode=0;
            String redirectUrl="record_list.jsp?exist_resultset=1";
            resultMsg=java.net.URLEncoder.encode(resultMsg, "UTF-8");
            String url = redirectPath+"/"+redirectUrl;
            showDebug("[deleteRecord]结果URL："+url);
            response.sendRedirect(url);
        }
    }

    private void sortRecord(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, JSONException {
//        int index = Integer.parseInt(request.getParameter("sort_index"));
        String sortContent = request.getParameter("order_by");
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");

        JSONObject jsonObject = new JSONObject();
        ArrayList data = new ArrayList();
        System.out.println("sortRecord");
        String dbName = (String)(request.getSession().getAttribute("unit_db_name"));
        ylx_db query_db = new ylx_db(dbName);

        String sql = "select * from wishlist where user_id='"+user_id+"' order by "+ sortContent;
        ResultSet rs = query_db.executeQuery(sql);
        while(rs.next()){
            ;ArrayList item = new ArrayList();
            item.add(rs.getString("id"));
            item.add(rs.getString("name"));
            item.add(rs.getString("province"));
            item.add(rs.getString("city"));
            item.add(rs.getString("district"));
            item.add(rs.getString("address"));
            item.add(rs.getString("price"));
            item.add(rs.getString("create_time"));
            item.add(rs.getString("share_type"));
            data.add(item);
        }
        jsonObject.put("data",data);
        System.out.println(jsonObject.toString());
        session.setAttribute("project_wl_get_record_result",jsonObject);
        boolean isAjax=true;
        if(request.getHeader("x-requested-with")==null){isAjax=false;}	//判断是异步请求还是同步请求
        if(isAjax){
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.print(jsonObject);
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            String resultMsg="操作已经执行，请按返回按钮返回列表页面！";
            int resultCode=0;
            String redirectUrl="record_list.jsp?exist_resultset=1";
            resultMsg=java.net.URLEncoder.encode(resultMsg, "UTF-8");
            String url = redirectPath+"/"+redirectUrl;
            showDebug("[getRecord]结果URL："+url);
            response.sendRedirect(url);
        }
    }

    private void queryRecord(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, JSONException {
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");
        String findWords = request.getParameter("content");
        String Dates = request.getParameter("dates");
        System.out.println(findWords);
        System.out.println(Dates);
        String spliter = ">";
        String[] D = Dates.split(spliter);
        String DateFrom = D[0];
        String DateTo = D[1];



        JSONObject jsonObject = new JSONObject();
        ArrayList data = new ArrayList();
        System.out.println("getRecord");
        String dbName = (String)(request.getSession().getAttribute("unit_db_name"));
        ylx_db query_db = new ylx_db(dbName);

        String sql = "select * from wishlist where name like '%%"+findWords+"%%' and create_time between '"+DateFrom+"' and '"+DateTo+"' and user_id='"+user_id+"'";
        System.out.println(sql);
        ResultSet rs = query_db.executeQuery(sql);
        while(rs.next()){
            ;ArrayList item = new ArrayList();
            item.add(rs.getString("id"));
            item.add(rs.getString("name"));
            item.add(rs.getString("province"));
            item.add(rs.getString("city"));
            item.add(rs.getString("district"));
            item.add(rs.getString("address"));
            item.add(rs.getString("price"));
            item.add(rs.getString("create_time"));
            item.add(rs.getString("share_type"));
            data.add(item);
        }
        jsonObject.put("data",data);
        jsonObject.put("content",findWords);
        jsonObject.put("dates",Dates);
        System.out.println(jsonObject.toString());
        session.setAttribute("project_wl_get_record_result",jsonObject);
        boolean isAjax=true;
        if(request.getHeader("x-requested-with")==null){isAjax=false;}	//判断是异步请求还是同步请求
        if(isAjax){
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.print(jsonObject);
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            String resultMsg="操作已经执行，请按返回按钮返回列表页面！";
            int resultCode=0;
            String redirectUrl="record_list.jsp?exist_resultset=1";
            resultMsg=java.net.URLEncoder.encode(resultMsg, "UTF-8");
            String url = redirectPath+"/"+redirectUrl;
            showDebug("[getRecord]结果URL："+url);
            response.sendRedirect(url);
        }
    }

    private void addRecord(HttpServletRequest request, HttpServletResponse response) throws IOException, JSONException, SQLException {
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");
        String id = request.getParameter("id");
        String user_name =(String)session.getAttribute("user_name");
//        String Dates = request.getParameter("dates");
//        System.out.println(findWords);
//        System.out.println(Dates);
//        String spliter = ">";
//        String[] D = Dates.split(spliter);
//        String DateFrom = D[0];
//        String DateTo = D[1];
        String share_type = request.getParameter("share_type");
        String Name = null;
        String Prov = null;
        String City = null;
        String District = null;
        String Address = null;
        String Price = null;
        String createTime=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());

        JSONObject jsonObject = new JSONObject();
        System.out.println("addRecord");
        String dbName = (String)(request.getSession().getAttribute("unit_db_name"));
        ylx_db query_db = new ylx_db(dbName);


        String sql ="select * from wishlist where house_id='"+id+"' and user_id='"+user_id+"'";
        ResultSet rs_temp = query_db.executeQuery(sql);
        int i = 0;
        while(rs_temp.next()){
            i++;
        }
        System.out.println("i="+i);
        if(i >= 1){
            jsonObject.put("result_code",10);
        }
        else{
            sql = "select * from project_hm where id='"+id+"'";
            System.out.println(sql);
            ResultSet rs = query_db.executeQuery(sql);
            while(rs.next()){
                Name = rs.getString("name");
                Prov = rs.getString("province");
                City = rs.getString("city");
                District = rs.getString("district");
                Address = rs.getString("address");
                Price = rs.getString("price");
            }

            sql = "insert into wishlist(house_id,user_id,name,province,city,district,address,price,creator,share_type,create_time) values('"+id+"','"+user_id+"','";
            sql += Name+"','"+Prov+"','"+City+"','"+District+"','"+Address+"','"+Price+"','"+user_name+"','"+share_type+"','"+createTime+"')";
            query_db.executeUpdate(sql);
            jsonObject.put("result_code",0);
        }
        System.out.println(jsonObject.toString());
        boolean isAjax=true;
        if(request.getHeader("x-requested-with")==null){isAjax=false;}	//判断是异步请求还是同步请求
        if(isAjax){
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.print(jsonObject);
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            String resultMsg="操作已经执行，请按返回按钮返回列表页面！";
            int resultCode=0;
            String redirectUrl="record_list.jsp?exist_resultset=1";
            resultMsg=java.net.URLEncoder.encode(resultMsg, "UTF-8");
            String url = redirectPath+"/"+redirectUrl;
            showDebug("[addRecord]结果URL："+url);
            response.sendRedirect(url);
        }
    }

    public void showDebug(String msg){
        System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"]["+module+"/"+sub+"/ServletAction]"+msg);
    }

    public void exportData(JSONObject jsonObj, String filePathName) throws Exception {
        if(jsonObj!=null){
            //开始导出到excel
//			JSONObject newObj = processJson(jsonObj);
            showDebug("5555555");
            ExcelWriter ew=new ExcelWriter();
            String[] cols={"name⊙text⊙民宿名称","address⊙text⊙地址","price⊙text⊙价格","create_time⊙text⊙添加时间"};	//name⊙type⊙nick

            JSONObject JObj = new JSONObject();
            ArrayList newarr = new ArrayList();
            JSONArray arr = jsonObj.getJSONArray("data");
            showDebug(arr.toString());
            for(int j=0;j<arr.length();j++) {
                ArrayList newlist = new ArrayList();
                ArrayList list = (ArrayList) arr.get(j);
                newlist.add(list.get(1));
                newlist.add((String)list.get(2)+list.get(3)+list.get(4)+list.get(5));
                newlist.add(list.get(6));
                newlist.add(list.get(7));
                newarr.add(newlist);
            }
            showDebug(newarr.toString());
            JObj.put("aaData",newarr);
            ew.CreExcel(JObj, "心愿清单统计", cols, filePathName);
            showDebug("6666666");
            jsonObj.put("result_code",0);
            jsonObj.put("result_msg","读取了上一次的查询配置");
        }
    }

    private String getStatisticRecordSql(HttpServletRequest request){
        HttpSession session = request.getSession();
        String timeInterval=request.getParameter("time_interval");
        String timeFrom=request.getParameter("time_from");
        String timeTo=request.getParameter("time_to");
        String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");

        String sql="";
        if(timeInterval.equals("hour")){
            timeInterval="%Y-%m-%d %h";
        }
        if(timeInterval.equals("day")){
            timeInterval="%Y-%m-%d";
        }
        if(timeInterval.equals("month")){
            timeInterval="%Y-%m";
        }
        sql="select date_format(create_time,\""+timeInterval+"\") as time_interval,count(*) as count from wishlist a";
        sql=sql+" where create_time between \""+timeFrom+"\" and \""+timeTo+"\"";
        sql=sql+" and user_id='"+userId+"'";
        sql=sql+" group by time_interval order by time_interval";
        return sql;
    }


}
