package myorder.file;
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
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.data.DefaultCategoryDataset;
import org.jfree.data.DefaultPieDataset;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import myorder.dao.MyOrder;
import myorder.dao.MyOrderDao;
import myorder.dao.Statistic;
import myorder.dao.StatisticDao;

import utility.LogEvent;
import utility.excel.ExcelWriter;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ServletAction extends HttpServlet {
	//这里是需要改的,module和sub
	public String module = "myorder";
	public String sub = "file";
	
	public String preFix = module + "_" + sub;
	public String resultPath = module + "/" + sub;
	public String resultPage = "result.jsp";
	public String resultUrl=resultPath+"/"+resultPage;
	public String redirectPath = module + "/" + sub;
	public String redirectPage = "record_list.jsp";
	public String redirectUrl=redirectPath+"/"+redirectPage;
	//public String databaseName="xm13-minsu";
	public SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public LogEvent ylxLog = new LogEvent();

	/*
	 * 处理顺序：先是service，后根据情况doGet或者doPost
	 */
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		processAction(request,response);
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
		showDebug("processAction收到的action是："+action);
		if(session.getAttribute("user_role")==null){
			try {
				processError(request, response,3,"session超时，请重新登录系统！");
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}else{
			if (action == null){
				try {
					processError(request, response,1,"传递过来的action是null！");
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}else{
				//这几个常规增删改查功能
				if (action.equals("get_record")) {
					actionOk=true;
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
                if (action.equals("download_record")) {
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
                if (action.equals("get_record_view")) {
                    actionOk=true;
                    try {
                        getRecordView(request, response);
                    } catch (Throwable e) {
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
				if (action.equals("delete_record")) {
					actionOk=true;
					try {
						deleteRecord(request, response);
					} catch (SQLException e) {
						e.printStackTrace();
					} catch (JSONException e) {
						e.printStackTrace();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
                if (action.equals("query_record")) {
                    actionOk=true;
                    try {
                        queryRecord(request, response);
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
                        downloadRecord(request, response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } catch (JSONException e) {
                        e.printStackTrace();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (action.equals("statistic_record")) {
                    actionOk=true;
                    try {
                        statisticRecord(request, response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } catch (JSONException e) {
                        e.printStackTrace();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (action.equals("get_statistic_record")) {
                    actionOk=true;
                    try {
                        getStatisticRecord(request, response);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (action.equals("export_query_record")) {
                    actionOk=true;
                    try {
                        exportQueryRecord(request, response);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
				if (!actionOk) {
					try {
						processError(request, response,2,"["+module+"/"+sub+"/ServletAction]没有对应的action处理过程，请检查action是否正确！action="+action);
					} catch (JSONException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

    public void processError(HttpServletRequest request, HttpServletResponse response,int errorNo,String errorMsg) throws JSONException, IOException{
		String action = request.getParameter("action");
		//errorNo=0->没有错误
		//errorNo=1->action是空值
		//errorNo=2->没有对应的处理该action的函数
		//errorNo=3->session超时
		showDebug("错误信息："+errorMsg+"，代码："+errorNo);
		JSONObject jsonObj=new JSONObject();
		boolean isAjax=true;
		if(request.getHeader("x-requested-with")==null){isAjax=false;}	//判断是异步请求还是同步请求
		if(isAjax){
			jsonObj.put("result_code",errorNo);
			jsonObj.put("result_msg",errorMsg);
			jsonObj.put("action",action);
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
			errorMsg = java.net.URLEncoder.encode(errorMsg, "UTF-8");
			String url = resultPath+"/"+resultPage+"?action="+action+"&result_code="+errorNo+"&redirect_path=" + redirectPath + "&redirect_page=" + redirectPage + "&result_msg=" + errorMsg;
			showDebug(url);
			response.sendRedirect(url);
		}
	}
	/*
	 * 功能：进行一个本类测试，不用启动整个项目，测试所写的Java
	 */
	public static void main(String[] args) throws Exception {
		System.out.println("");
	}
	public void showDebug(String msg){
		System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"]["+module+"/"+sub+"/ServletAction]"+msg);
	}
    public void statisticRecord(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        String dbName=(String)session.getAttribute("unit_db_name");
        String content=request.getParameter("content");
        String timeFrom=request.getParameter("time_from");
        String timeTo=request.getParameter("time_to");
        String timeInterval=request.getParameter("time_interval");
        //	String addressId=request.getParameter("address_id");
        String statisticType=request.getParameter("statistic_type");
        //if(statisticType==null) statisticType="no";
        showDebug("[statisticRecord]收到页面传过来的参数是："+timeFrom+","+timeTo+","+timeInterval+",statisticType="+statisticType+"content="+content);
        String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");
        String userName=session.getAttribute("user_name")==null?null:(String)session.getAttribute("user_name");

		/*----------------------------------------数据获取完毕，开始和数据库交互*/
        JSONObject jsonObj=null;
        //检查输入参数是否正确先
        if(dbName!=null){
            String creator=(String)session.getAttribute("user_name");
            String createTime=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
            StatisticDao statisticDao=new StatisticDao();
            Statistic statistic=new Statistic();
            statistic.setTimeFrom(timeFrom);
            statistic.setTimeTo(timeTo);
            statistic.setUserId(userId);
            statistic.setTimeInterval(timeInterval);
            //statistic.setAddressId(addressId);
            statistic.setStatisticType(statisticType);
            statistic.setContent(content);
			/*---------------------------------把状态保存进session---------------------------*/
            if(timeFrom!=null){session.setAttribute(module+"_"+sub+"_query_time_from",timeFrom);}
            if(timeTo!=null){session.setAttribute(module+"_"+sub+"_query_time_to",timeTo);}
            if(timeInterval!=null){session.setAttribute(module+"_"+sub+"_query_timeinterval",timeInterval);}
            //	if(addressId!=null){session.setAttribute(module+"_"+sub+"_statistic_query_addressid",addressId);}
			/*---------------------------------开始进行统计---------------------------*/
            jsonObj=statisticDao.statisticRecord(action,dbName,statistic);
            jsonObj.put("user_id",userId);
            jsonObj.put("user_name",userName);
        }
        //获取完毕，开始生成统计图
        //HttpSession session,String dbName,JSONObject json,String title,String column,int statisticImage,int chartWidth,int chartHeight
        String fileName=getStatisticGraph(session,dbName,jsonObj,"待办事项统计图","测试Column",statisticType,1,1280,768);
        jsonObj.put("result_image",fileName);
        session.setAttribute(module+"_"+sub+"_record_result",jsonObj);
        showDebug("[statisticRecord]统计完毕，保存进session："+module+"_"+sub+"_record_result");

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
            int resultCode=0;
            resultUrl="myorder/order_statistic_result.jsp";
            String url = resultUrl+"?exist_resultset=1&result_code="+resultCode;
            showDebug("[statisticRecord]结果URL："+url);
            response.sendRedirect(url);
        }
    }
    public String getStatisticGraph(HttpSession session,String dbName,JSONObject json,String title,String column,String statisticType,int statisticImage,int chartWidth,int chartHeight) throws SQLException, IOException, JSONException{
        //要改动的
        String chartTitle = "统计图";
        String tmpDir = "/chart";
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        DefaultPieDataset pieDataSet =new DefaultPieDataset();
        showDebug("statisticImage的值是："+statisticImage+",column="+column+",title="+title);
        JSONArray arr=json.getJSONArray("aaData");
        showDebug(arr.toString());
        for(int i=0;i<arr.length();i++) {
            String timeInterval=(String)((List)(arr.get(i))).get(1);
            Integer count=Integer.parseInt((String)((List)(arr.get(i))).get(2));
            String countName="";
            if(statisticType.equals("null")){
                countName="所有订单";
            }else{
                countName=(String)((List)(arr.get(i))).get(3);
                //	countName=(String)((List)(arr.get(i))).get(4);
            }
            dataset.addValue(count,countName,timeInterval);
            //pieDataSet.setValue(json.getString("colTime"),json.getInt("colCount"));
        }
        JFreeChart chart=null;
        if(statisticImage==1)
            chart = ChartFactory.createBarChart3D(chartTitle, title, "数量", dataset, PlotOrientation.VERTICAL, true, false, false);
        if(statisticImage==2)
            chart = ChartFactory.createLineChart(chartTitle,title,"数量", dataset, PlotOrientation.VERTICAL, true, false, false);
        if(statisticImage==3)
            chart = ChartFactory.createPieChart(chartTitle,pieDataSet,true,false,false);
        String chartFilename= ServletUtilities.saveChartAsJPEG(chart, chartWidth, chartHeight, null, session);
        chartFilename = tmpDir + "/" + chartFilename;
        return chartFilename;
    }
    public void getStatisticRecord(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        String dbName=(String)session.getAttribute("unit_db_name");
        String statisticType=request.getParameter("statistic_type");
        String timeFrom=request.getParameter("time_from");
        String timeTo=request.getParameter("time_to");
        String timeInterval=request.getParameter("time_interval");
        String content=request.getParameter("content");
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
            if(session.getAttribute(module+"_"+sub+"_record_result")!=null){
                jsonObj=(JSONObject)session.getAttribute(module+"_"+sub+"_record_result");
                showDebug("取出了原来的结果");
            }else{
                jsonObj=new JSONObject();
                jsonObj.put("result_code",10);
                jsonObj.put("result_msg","session里没有找到之前统计的数据！");
                showDebug("没有结果："+module+"_"+sub+"_record_result");
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
            redirectUrl="record_list.jsp";
            resultMsg=java.net.URLEncoder.encode(resultMsg, "UTF-8");
            String url = resultUrl+"?result_msg="+resultMsg+"&result_code="+resultCode+"&redirect_url="+redirectUrl;
            showDebug("getStatisticRecord结果URL："+url);
            response.sendRedirect(url);
        }
    }
    private void downloadRecord(HttpServletRequest request, HttpServletResponse response) throws Exception  {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");
        JSONObject jsonObj = null;
            jsonObj=(JSONObject)session.getAttribute(module+"_"+sub+"_get_record_result");
        showDebug(jsonObj.toString());
        JSONArray jsonArr=(JSONArray)jsonObj.get("aaData");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/vnd.ms-excel");//响应正文的MIME类型，表示Excel
        ServletOutputStream out = response.getOutputStream();//响应输出流对象
        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet  sheet = wb.createSheet("订单信息");//创建工作簿
        sheet.setColumnWidth(100, 10000);
        HSSFRow titleRow = sheet.createRow(0);
        HSSFCell titleCell1 =titleRow .createCell(0);          //在行中创建第1个单元格
        titleCell1.setCellValue("订单号");               //设置第1个单元格的值
        HSSFCell titleCell2= titleRow.createCell(1);           //在行中创建第2个单元格
        titleCell2.setCellValue("订单创建时间");                      //设置第2个单元格的值
        HSSFCell titleCell3 =titleRow .createCell(2);          //在行中创建第3个单元格
        titleCell3.setCellValue("订单类型");                      //设置第3个单元格的值
        HSSFCell titleCell4= titleRow.createCell(3);           //在行中创建第4个单元格
        titleCell4.setCellValue("入住时间");                      //设置第4个单元格的值
        HSSFCell titleCell5= titleRow.createCell(4);           //在行中创建第5个单元格
        titleCell5.setCellValue("退房时间");                      //设置第5个单元格的值
        HSSFCell titleCell6= titleRow.createCell(5);           //在行中创建第6个单元格
        titleCell6.setCellValue("房客");                      //设置第6个单元格的值
        HSSFCell titleCell7= titleRow.createCell(6);           //在行中创建第7个单元格
        titleCell7.setCellValue("联系方式");                      //设置第7个单元格的值
        HSSFCell titleCell8= titleRow.createCell(7);           //在行中创建第8个单元格
        titleCell8.setCellValue("订单状态");//设置第8个单元格的值
        HSSFCell titleCell9= titleRow.createCell(8);           //在行中创建第8个单元格
        titleCell9.setCellValue("订单价格");//设置第8个单元格的值
        for(int i=0;i<jsonArr.length();i++) {
            ArrayList jsonRec = (ArrayList) jsonArr.get(i);
            HSSFRow valueRow = sheet.createRow(i + 1);
            String orderID = jsonRec.get(1).toString();
            String orderType = jsonRec.get(2).toString();
            String create_time = jsonRec.get(3).toString();
            String begin_time = jsonRec.get(4).toString();
            String end_time = jsonRec.get(5).toString();
            String orderPrice = jsonRec.get(6).toString();
            String orderUser = jsonRec.get(7).toString();
            String userConnect = jsonRec.get(8).toString();
            String status = jsonRec.get(9).toString();
            for (int j = 0; j < 9; j++) {
                HSSFCell Cell1 = valueRow.createCell(0);              //在第2行中创建单元格
                Cell1.setCellValue(orderID);
                HSSFCell Cell2 = valueRow.createCell(1);
                Cell2.setCellValue(create_time);
                HSSFCell Cell3 = valueRow.createCell(2);
                Cell3.setCellValue(orderType);
                HSSFCell Cell4 = valueRow.createCell(3);
                Cell4.setCellValue(begin_time);
                HSSFCell Cell5 = valueRow.createCell(4);              //在第2行中创建单元格
                Cell5.setCellValue(end_time);
                HSSFCell Cell6 = valueRow.createCell(5);
                Cell6.setCellValue(orderUser);
                HSSFCell Cell7 = valueRow.createCell(6);
                Cell7.setCellValue(userConnect);
                HSSFCell Cell8 = valueRow.createCell(7);
                Cell8.setCellValue(status);
                HSSFCell Cell9 = valueRow.createCell(8);
                Cell9.setCellValue(orderPrice);
            }
        }
        HSSFCellStyle cellStyle = wb.createCellStyle();
        wb.write(out);//将响应流输入到Excel表格中
        response.addHeader("Content-Disposition", "attachment;filename=order.xls");//文件临时保存在demo.xls中
        out.flush();
        out.close();
    }

    private void exportQueryRecord(HttpServletRequest request, HttpServletResponse response) throws Exception  {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");
        JSONObject jsonObj = null;
        jsonObj=(JSONObject)session.getAttribute(module+"_"+sub+"_query_record_result");
        showDebug(jsonObj.toString());
        JSONArray jsonArr=(JSONArray)jsonObj.get("aaData");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/vnd.ms-excel");//响应正文的MIME类型，表示Excel
        ServletOutputStream out = response.getOutputStream();//响应输出流对象
        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet  sheet = wb.createSheet("订单信息");//创建工作簿
        sheet.setColumnWidth(100, 10000);
        HSSFRow titleRow = sheet.createRow(0);
        HSSFCell titleCell1 =titleRow .createCell(0);          //在行中创建第1个单元格
        titleCell1.setCellValue("订单号");               //设置第1个单元格的值
        HSSFCell titleCell2= titleRow.createCell(1);           //在行中创建第2个单元格
        titleCell2.setCellValue("订单创建时间");                      //设置第2个单元格的值
        HSSFCell titleCell3 =titleRow .createCell(2);          //在行中创建第3个单元格
        titleCell3.setCellValue("订单类型");                      //设置第3个单元格的值
        HSSFCell titleCell4= titleRow.createCell(3);           //在行中创建第4个单元格
        titleCell4.setCellValue("入住时间");                      //设置第4个单元格的值
        HSSFCell titleCell5= titleRow.createCell(4);           //在行中创建第5个单元格
        titleCell5.setCellValue("退房时间");                      //设置第5个单元格的值
        HSSFCell titleCell6= titleRow.createCell(5);           //在行中创建第6个单元格
        titleCell6.setCellValue("房客");                      //设置第6个单元格的值
        HSSFCell titleCell7= titleRow.createCell(6);           //在行中创建第7个单元格
        titleCell7.setCellValue("联系方式");                      //设置第7个单元格的值
        HSSFCell titleCell8= titleRow.createCell(7);           //在行中创建第8个单元格
        titleCell8.setCellValue("订单状态");//设置第8个单元格的值
        HSSFCell titleCell9= titleRow.createCell(8);           //在行中创建第8个单元格
        titleCell9.setCellValue("订单价格");//设置第8个单元格的值
        for(int i=0;i<jsonArr.length();i++) {
            ArrayList jsonRec = (ArrayList) jsonArr.get(i);
            HSSFRow valueRow = sheet.createRow(i + 1);
            String orderID = jsonRec.get(1).toString();
            String orderType = jsonRec.get(2).toString();
            String create_time = jsonRec.get(3).toString();
            String begin_time = jsonRec.get(4).toString();
            String end_time = jsonRec.get(5).toString();
            String orderPrice = jsonRec.get(6).toString();
            String orderUser = jsonRec.get(7).toString();
            String userConnect = jsonRec.get(8).toString();
            String status = jsonRec.get(9).toString();
            for (int j = 0; j < 9; j++) {
                HSSFCell Cell1 = valueRow.createCell(0);              //在第2行中创建单元格
                Cell1.setCellValue(orderID);
                HSSFCell Cell2 = valueRow.createCell(1);
                Cell2.setCellValue(create_time);
                HSSFCell Cell3 = valueRow.createCell(2);
                Cell3.setCellValue(orderType);
                HSSFCell Cell4 = valueRow.createCell(3);
                Cell4.setCellValue(begin_time);
                HSSFCell Cell5 = valueRow.createCell(4);              //在第2行中创建单元格
                Cell5.setCellValue(end_time);
                HSSFCell Cell6 = valueRow.createCell(5);
                Cell6.setCellValue(orderUser);
                HSSFCell Cell7 = valueRow.createCell(6);
                Cell7.setCellValue(userConnect);
                HSSFCell Cell8 = valueRow.createCell(7);
                Cell8.setCellValue(status);
                HSSFCell Cell9 = valueRow.createCell(8);
                Cell9.setCellValue(orderPrice);
            }
        }
        HSSFCellStyle cellStyle = wb.createCellStyle();
        wb.write(out);//将响应流输入到Excel表格中
        response.addHeader("Content-Disposition", "attachment;filename=order_query.xls");//文件临时保存在demo.xls中
        out.flush();
        out.close();
    }

    private void exportRecord(HttpServletRequest request, HttpServletResponse response) throws Exception  {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");
        JSONObject jsonObj = null;
        jsonObj=(JSONObject)session.getAttribute(module+"_"+sub+"_record_result");
        showDebug(jsonObj.toString());
        JSONArray jsonArr=(JSONArray)jsonObj.get("aaData");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/vnd.ms-excel");//响应正文的MIME类型，表示Excel
        ServletOutputStream out = response.getOutputStream();//响应输出流对象
        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet  sheet = wb.createSheet("统计信息");//创建工作簿
        sheet.setColumnWidth(100, 10000);
        HSSFRow titleRow = sheet.createRow(0);
        HSSFCell titleCell1 =titleRow .createCell(0);          //在行中创建第1个单元格
        titleCell1.setCellValue("时间");               //设置第1个单元格的值
        HSSFCell titleCell2= titleRow.createCell(1);           //在行中创建第2个单元格
        titleCell2.setCellValue("数量");                      //设置第2个单元格的值
        HSSFCell titleCell3 =titleRow .createCell(2);          //在行中创建第3个单元格
        titleCell3.setCellValue("统计类型");                      //设置第3个单元格的值
        for(int i=0;i<jsonArr.length();i++) {
            ArrayList jsonRec = (ArrayList) jsonArr.get(i);
            HSSFRow valueRow = sheet.createRow(i + 1);
            String time = jsonRec.get(1).toString();
            String count = jsonRec.get(2).toString();
            String type = jsonRec.get(3).toString();
            for (int j = 0; j < 9; j++) {
                HSSFCell Cell1 = valueRow.createCell(0);              //在第2行中创建单元格
                Cell1.setCellValue(time);
                HSSFCell Cell2 = valueRow.createCell(1);
                Cell2.setCellValue(count);
                HSSFCell Cell3 = valueRow.createCell(2);
                Cell3.setCellValue(type);

            }
        }
        HSSFCellStyle cellStyle = wb.createCellStyle();
        wb.write(out);//将响应流输入到Excel表格中
        response.addHeader("Content-Disposition", "attachment;filename=statistic_result.xls");//文件临时保存在demo.xls中
        out.flush();
        out.close();
    }
    /*

	 * 功能：查询记录
	 */
	public void getRecord(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String dbName=(String)session.getAttribute("unit_db_name");
		String action = request.getParameter("action");
		String id=request.getParameter("id");
		String searchName=request.getParameter("searchName");
		String search=request.getParameter("search");
        String sortIndex= request.getParameter("sort_index");
        String orderBy= request.getParameter("order_by");
		String type= request.getParameter("type");
		String timeFrom= request.getParameter("time_from");
		String timeTo= request.getParameter("time_to");
        String status = request.getParameter("status");
        String isPrint=request.getParameter("isPrint");
		String existResultset= request.getParameter("exist_resultset");
		if((existResultset==null) ||(existResultset.equals("null") || existResultset.isEmpty())) existResultset="0";
		String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");
		String userName=session.getAttribute("user_name")==null?null:(String)session.getAttribute("user_name");
		String userRole=session.getAttribute("user_role")==null?null:(String)session.getAttribute("user_role");
		String userAvatar=session.getAttribute("user_avatar")==null?null:(String)session.getAttribute("user_avatar");
		//这里可以修改成统一一个函数读取变量，下面的session里的attr可以用一个变量代替
		//检查输入参数是否正确先
		showDebug("[getRecord]收到页面传过来的参数是："+existResultset+","+action+","+type+","+id+","+timeFrom+","+timeTo+","+isPrint);
		/*----------------------------------------数据获取完毕，开始和数据库交互*/
		//String creator=(String)session.getAttribute("user_name");
		String createTime=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
		MyOrder query=new MyOrder();
		query.setId(id);
		query.setAction(action);
		query.setDbName(dbName);
		query.setType(type);
		query.setSearch(search);
		query.setSearchName(searchName);
        query.setSortIndex(sortIndex);
        query.setOrderBy(orderBy);
		query.setTimeFrom(timeFrom);
		query.setTimeTo(timeTo);
		query.setUserId(userId);
		query.setUserRole(userRole);
        query.setStatus(status);
		JSONObject jsonObj=null;
		if(existResultset.equals("1")){
			//要求提取之前查询结果，如果有就取出来，如果没有就重新查询一次，并且保存进session里
			if(session.getAttribute(module+"_"+sub+"_get_record_result")!=null){
				jsonObj=(JSONObject)session.getAttribute(module+"_"+sub+"_get_record_result");
			}else{
				//如果没有就报错
				jsonObj=new JSONObject();
				jsonObj.put("result_code",10);
				jsonObj.put("result_msg","exist_resultset参数不当，服务器当前没有结果数据！请重新设置！");
			}
		}else{
			//如果是新查询
            MyOrderDao MyOrderDao=new MyOrderDao();
			jsonObj=MyOrderDao.getRecord(query);
			session.setAttribute(module+"_"+sub+"_get_record_result",jsonObj);
		}
		jsonObj.put("user_id",userId);
		jsonObj.put("user_name",userName);
		jsonObj.put("user_role",userRole);
		jsonObj.put("user_avatar",userAvatar);
		jsonObj.put("action",action);
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
			String url ="myorder/record_list.jsp";
			showDebug("[getRecord]结果URL："+url);
			response.sendRedirect(url);
		}
	}

    public void queryRecord(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String dbName=(String)session.getAttribute("unit_db_name");
        String action = request.getParameter("action");
        String id=request.getParameter("id");
        String searchName=request.getParameter("searchName");
        String search=request.getParameter("search");
        String timeFrom= request.getParameter("time_from");
        String timeTo= request.getParameter("time_to");
        String existResultset= request.getParameter("exist_resultset");
        if((existResultset==null) ||(existResultset.equals("null") || existResultset.isEmpty())) existResultset="0";
        String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");
        String userName=session.getAttribute("user_name")==null?null:(String)session.getAttribute("user_name");
        String userRole=session.getAttribute("user_role")==null?null:(String)session.getAttribute("user_role");
        String userAvatar=session.getAttribute("user_avatar")==null?null:(String)session.getAttribute("user_avatar");
        //这里可以修改成统一一个函数读取变量，下面的session里的attr可以用一个变量代替
        //检查输入参数是否正确先
        showDebug("[queryRecord]收到页面传过来的参数是："+existResultset+","+action+","+timeFrom+","+timeTo);
		/*----------------------------------------数据获取完毕，开始和数据库交互*/
        //String creator=(String)session.getAttribute("user_name");
        String createTime=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());

        MyOrder query=new MyOrder();
        query.setAction(action);
        query.setId(id);
        query.setDbName(dbName);
        query.setSearch(search);
        query.setSearchName(searchName);
        query.setTimeFrom(timeFrom);
        query.setTimeTo(timeTo);
        query.setUserId(userId);
        query.setUserRole(userRole);
        JSONObject jsonObj=null;
        MyOrderDao OrderDao=new MyOrderDao();
        jsonObj=OrderDao.getRecord(query);
        System.out.println("ssssss"+jsonObj.toString());
        session.setAttribute(module+"_"+sub+"_query_record_result",jsonObj);
        jsonObj.put("user_id",userId);
        jsonObj.put("user_name",userName);
        jsonObj.put("user_role",userRole);
        jsonObj.put("user_avatar",userAvatar);
        jsonObj.put("action",action);
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
            String url ="myorder/record_list.jsp?exist_resultset=1";
            showDebug("[queryRecord]结果URL："+url);
            response.sendRedirect(url);
        }
    }
    public void getRecordView(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        String dbName=(String)session.getAttribute("unit_db_name");
        String id=request.getParameter("id");
        String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");
        String userName=session.getAttribute("user_name")==null?null:(String)session.getAttribute("user_name");
        //检查输入参数是否正确先
        showDebug("收到页面传过来的参数是：action="+action+",id="+id);
		/*----------------------------------------数据获取完毕，开始和数据库交互*/
        JSONObject jsonObj=null;
        MyOrder query=new MyOrder();
        query.setAction(action);
        query.setDbName(dbName);
        query.setUserId(userId);
        query.setId(id);
                MyOrderDao MyOrderDao=new MyOrderDao();
                jsonObj=MyOrderDao.getRecord(query);
                jsonObj.put("user_id",userId);
                jsonObj.put("user_name",userName);
                jsonObj.put("action",action);
                session.setAttribute(module+"_"+sub+"_get_record_result",jsonObj);
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
            redirectUrl="record_list.jsp";
            resultMsg=java.net.URLEncoder.encode(resultMsg, "UTF-8");
            String url = resultUrl+"?result_msg="+resultMsg+"&result_code="+resultCode+"&redirect_url="+redirectUrl;
            showDebug("getRecordById结果URL："+url);
            response.sendRedirect(url);
        }
    }
    private JSONObject getResultSetNavigateId(String id,String index,JSONObject json) throws NumberFormatException, JSONException{
        //然后找到对应id的记录
        JSONArray jsonList=new JSONArray();
        //根据id获得index
        if(id!=null && !id.isEmpty()){
            index=getRecordIndexFromId(id,json);
        }
        ArrayList list=(ArrayList)json.getJSONArray("aaData").get(Integer.parseInt(index));
        jsonList.put(list);
        int count=json.getJSONArray("aaData").length();
        JSONObject jsonObj=new JSONObject();
        jsonObj.put("first",0);
        if(Integer.parseInt(index)>0)
            jsonObj.put("prev",Integer.parseInt(index)-1);
        else
            jsonObj.put("prev",0);
        if(Integer.parseInt(index)<(count-1))
            jsonObj.put("next",Integer.parseInt(index)+1);
        else
            jsonObj.put("next",count-1);
        jsonObj.put("last",count-1);
        jsonObj.put("total",count);
        jsonObj.put("current_index",index);
        jsonObj.put("aaData",jsonList);
        return jsonObj;
    }
    private String getRecordIndexFromId(String id,JSONObject json) throws JSONException{
        String index="-1";
        JSONArray jsonArr=(JSONArray)json.getJSONArray("aaData");
        for(int i=0;i<jsonArr.length();i++){
            ArrayList list=(ArrayList)jsonArr.get(i);
            if(id.equals(list.get(0)+"")){
                index=list.get(11)+"";
                break;
            }
        }
        return index;
    };
	public void addRecord(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String dbName=(String)session.getAttribute("unit_db_name");
		String orderType=request.getParameter("orderType");
		String orderPrice=request.getParameter("orderPrice");
		String begin_time=request.getParameter("begin_time");
		String end_time=request.getParameter("end_time");
        System.out.println(begin_time+"  "+end_time);
		String orderUser=request.getParameter("orderUser");
        String userConnect=request.getParameter("userConnect");
        String status=request.getParameter("status");
		/*----------------------------------------数据获取完毕，开始和数据库交互*/
		JSONObject jsonObj=null;
		//检查输入参数是否正确先
		if(dbName!=null){
			String userId=session.getAttribute("user_id")==null?null:(String)session.getAttribute("user_id");
			//String creator=(String)session.getAttribute("user_name");
			String createTime=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
			/*----------------------------------------数据获取完毕，开始和数据库交互*/
            MyOrderDao MyOrderDao=new MyOrderDao();
            MyOrder Order=new MyOrder();
			Order.setAction(action);
			Order.setDbName(dbName);
			Order.setorderType(orderType);
			Order.setorderPrice(orderPrice);
			Order.setBeginTime(begin_time);
			Order.setEndTime(end_time);
			Order.setUserId(userId);
			Order.setUserConnect(userConnect);
			Order.setCreateTime(createTime);
			Order.setorderUser(orderUser);
            Order.setStatus(status);
			jsonObj=MyOrderDao.addRecord(Order);
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
			String url = "myorder/order_list.jsp";
			showDebug("[addRecord]结果URL："+url);
			response.sendRedirect(url);
		}
	}
	/*
	 * 功能：修改记录
	 */
	public void modifyRecord(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String dbName=(String)session.getAttribute("unit_db_name");
		String id=request.getParameter("id");
        String user_id=request.getParameter("user_id");
		String orderType=request.getParameter("orderType");
		String orderPrice=request.getParameter("orderPrice");
		String beginTime=request.getParameter("begin_time");
		String endTime=request.getParameter("end_time");
		String orderUser=request.getParameter("orderUser");
        String userConnect=request.getParameter("userConnect");
        String status = request.getParameter("status");
        System.out.println(status);
		/*----------------------------------------数据获取完毕，开始和数据库交互*/
		JSONObject jsonObj=null;
		//检查输入参数是否正确先
		if(id!=null && dbName!=null){
			//String creator=(String)session.getAttribute("user_name");
			String createTime=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
            MyOrderDao MyOrderDao=new MyOrderDao();
            MyOrder Order=new MyOrder();
			Order.setId(id);
			Order.setDbName(dbName);
			Order.setorderType(orderType);
			Order.setorderPrice(orderPrice);
			Order.setBeginTime(beginTime);
			Order.setEndTime(endTime);
			Order.setUserConnect(userConnect);
			Order.setCreateTime(createTime);
			Order.setorderUser(orderUser);
            Order.setStatus(status);
			jsonObj=MyOrderDao.modifyRecord(Order);
			ylxLog.log("用户于 "+user_id+" 修改了 ["+module+"]["+sub+"] 记录","修改记录",module);
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
            String url="myorder/order_list.jsp";
			showDebug("[modifyRecord]结果URL："+url);
			response.sendRedirect(url);
		}
	}
	public void deleteRecord(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String dbName=(String)session.getAttribute("unit_db_name");
		String[] ids = request.getParameterValues("id");

		/*----------------------------------------数据获取完毕，开始和数据库交互*/
		JSONObject jsonObj=null;
		//检查输入参数是否正确先
		if(ids!=null && dbName!=null){
			//String creator=(String)session.getAttribute("user_name");
			String createTime=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
			/*----------------------------------------数据获取完毕，开始和数据库交互*/
            MyOrderDao MyOrderDao=new MyOrderDao();
			jsonObj=MyOrderDao.deleteRecord(action,dbName,ids,createTime);
			ylxLog.log("用户于 "+createTime+" 删除了 ["+module+"]["+sub+"] 记录","删除记录",module);
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
			String url = "myorder/order_list.jsp";
			showDebug("[deleteRecord]结果URL："+url);
			response.sendRedirect(url);
		}
	}

}
