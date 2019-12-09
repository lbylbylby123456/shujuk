package HM.dao;
import dao.ylx_db;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class hmDao{
	/*
	 * 功能：返回结果集
	 */
	public JSONObject getRecord(hm query) throws SQLException, IOException, JSONException {
		String tableName="project_hm";
		//开始查询数据库
		String resultMsg="ok";
		int resultCode=0;
		List jsonList = new ArrayList();
		try {
			ylx_db query_db = new ylx_db(query.getDbName());
			//构造sql语句，根据传递过来的查询条件参数
			String sql="";
			int count=0;
			query.setTableName(tableName);
			sql=createGetRecordSql(query);
			System.out.println("[getRecord]"+sql);
			System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"]"+ sql);
			ResultSet rs = query_db.executeQuery(sql);
			String totalAddress;

			while (rs.next()) {
				List list = new ArrayList();
				list.add(rs.getString("id"));
				list.add(rs.getString("name"));
				totalAddress = "";
				totalAddress =totalAddress+rs.getString("province")+rs.getString("city")+rs.getString("district")+rs.getString("address");
//				list.add(rs.getString("address"));
				list.add(totalAddress);
				list.add(rs.getString("price"));
				list.add(rs.getString("limit_time"));
				//下面是后加上的
				list.add(rs.getString("time_from"));
				list.add(rs.getString("time_to"));

				list.add(rs.getString("end_tag"));
				list.add(rs.getString("user_id"));
				list.add(rs.getString("creator"));
				list.add(rs.getString("create_time"));
				list.add(rs.getString("status"));
				if(query.getUserId()!=null && query.getUserId().equals(rs.getString("user_id"))){
					list.add("1");
				}else{
					list.add("0");
				}
				list.add(count);
				count=count+1;	//做上下记录导航用
				jsonList.add(list);
			}
			rs.close();
			query_db.close();
		}
		catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
			resultCode=10;
			resultMsg="查询数据库出现错误！"+sqlexception.getMessage();
		}
		//////////数据库查询完毕，得到了json数组jsonList//////////
		//jsonList.clear();
		//下面开始构建返回的json
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("aaData",jsonList);
		jsonObj.put("result_msg",resultMsg);//如果发生错误就设置成"error"等
		jsonObj.put("result_code",resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
		return jsonObj;
	}
	public JSONObject modifyRecord(hm Hm) throws JSONException{
		//String action,String dbName,String id,String title,String content,String creator,String createTime
		String resultMsg="ok";
		int resultCode=0;
		List jsonList = new ArrayList();
		try {
			ylx_db query_db = new ylx_db(Hm.getDbName());
			//构造sql语句，根据传递过来的查询条件参数
			String tableName="project_hm";
			String sql="update "+tableName+" set name='"+Hm.getName()+"',address='"+Hm.getAddress()+"',price='"+Hm.getPrice()+"' where id="+Hm.getId();
			query_db.executeUpdate(sql);
			sql="select * from "+tableName+" order by create_time desc";
			ResultSet rs = query_db.executeQuery(sql);
			while (rs.next()) {
				List list = new ArrayList();
				list.add(rs.getString("id"));
				list.add(rs.getString("address"));
				list.add(rs.getString("price"));
				list.add(rs.getString("name"));
				jsonList.add(list);
			}
			rs.close();
			query_db.close();
		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
			resultCode=10;
			resultMsg="查询数据库出现错误！"+sqlexception.getMessage();
		}
		//下面开始构建返回的json
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("aaData",jsonList);
		jsonObj.put("action",Hm.getAction());
		jsonObj.put("result_msg",resultMsg);//如果发生错误就设置成"error"等
		jsonObj.put("result_code",resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
		return jsonObj;
	}
	public JSONObject getRecordById(String action,String dbName,String tableName,String id) throws JSONException
	{
		String resultMsg="ok";
		int resultCode=0;
		List jsonList = new ArrayList();
		try {
			System.out.println("getdbName:"+dbName);
			ylx_db query_db = new ylx_db(dbName);
			//构造sql语句，根据传递过来的查询条件参数
//			String tableName="project_hm";
			String sql="select * from "+tableName+" where id="+id+" order by create_time desc";
			ResultSet rs = query_db.executeQuery(sql);
			while (rs.next()) {
				List list = new ArrayList();
				list.add(rs.getString("id"));
				list.add(rs.getString("province")+rs.getString("city")+rs.getString("district")+rs.getString("address"));
				list.add(rs.getString("price"));
				list.add(rs.getString("name"));
				list.add(rs.getString("status"));
				list.add(rs.getString("user_id"));
				//后加的
				list.add(rs.getString("time_from"));
				list.add(rs.getString("time_to"));

				jsonList.add(list);
			}
			rs.close();
			query_db.close();
		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
			resultCode=10;
			resultMsg="查询数据库出现错误！"+sqlexception.getMessage();
		}
		//下面开始构建返回的json
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("aaData",jsonList);
		jsonObj.put("action",action);
		jsonObj.put("result_msg",resultMsg);//如果发生错误就设置成"error"等
		jsonObj.put("result_code",resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
		return jsonObj;
	}
	public JSONObject addRecord(hm Hm) throws JSONException, SQLException
	{
		String resultMsg="ok";
		int resultCode=0;
		List jsonList = new ArrayList();
		ylx_db query_db = new ylx_db(Hm.getDbName());
		//构造sql语句，根据传递过来的查询条件参数


		//String tableName="project_Hm";
		String tableName="project_hm";


		String sql="insert into "+tableName+"(name,address,price,status,user_id,creator,create_time,province,city,district,time_from,time_to) values('"+Hm.getName()+"','"+Hm.getAddress()+
				"','"+Hm.getPrice()+"','"+"未上架"+"','"+Hm.getUserId()+"','"+Hm.getCreator()+"','"+Hm.getCreateTime()+
				"','"+Hm.getProvince()+"','"+Hm.getCity()+"','"+Hm.getDistrict()+"','"+Hm.gettimefrom()+"','"+Hm.gettimeto()+"')";
		query_db.executeUpdate(sql);
		query_db.close();
		//下面开始构建返回的json
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("aaData",jsonList);
		jsonObj.put("action",Hm.getAction());
		jsonObj.put("result_msg",resultMsg);//如果发生错误就设置成"error"等
		jsonObj.put("result_code",resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
		return jsonObj;
	}
	public JSONObject deleteRecord(String action,String dbName,String[] ids,String creator,String createTime) throws JSONException, SQLException{
		String tableName="project_hm";
		String resultMsg="ok";
		int resultCode=0;
		List jsonList = new ArrayList();
		ylx_db query_db = new ylx_db(dbName);
		//构造sql语句，根据传递过来的查询条件参数
		for(int i=0;i<ids.length;i++){
			String sql="delete from "+tableName+" where id="+ids[i];
			query_db.executeUpdate(sql);
		}
		query_db.close();
		//下面开始构建返回的json
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("aaData",jsonList);
		jsonObj.put("action",action);
		jsonObj.put("result_msg",resultMsg);//如果发生错误就设置成"error"等
		jsonObj.put("result_code",resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
		return jsonObj;
	}
	public JSONObject setRecordTop(String action,String dbName,String type,String userId,String id) throws JSONException, SQLException
	{
		String tableName="project_Hm";
		String resultMsg="ok";
		int resultCode=0;
		List jsonList = new ArrayList();
		ylx_db query_db = new ylx_db(dbName);
		ylx_db update_db = new ylx_db(dbName);
		//构造sql语句，根据传递过来的查询条件参数
		String sql="select max(priority) as priority from project_Hm where user_id='"+userId+"'";
		int priority=0;
		ResultSet rs=query_db.executeQuery(sql);
		if(rs.next()){
			priority=rs.getInt("priority");
		}
		query_db.close();
		update_db.executeUpdate("update project_Hm set priority="+(priority+1)+" where id="+id);
		update_db.close();
		//下面开始构建返回的json
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("aaData",jsonList);
		jsonObj.put("action",action);
		jsonObj.put("result_msg",resultMsg);//如果发生错误就设置成"error"等
		jsonObj.put("result_code",resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
		return jsonObj;
	}
	/*
	 * 功能：构造历史记录查询的sql语句,type=all查询所有，type=id查询某个记录，余下按照条件设置查询
	 */
	private String createGetRecordSql(hm query)
	{
		String sql="";
		String where="";
		if(query.getId()!=null && !query.getId().equals("null")){
			where="where id="+query.getId();
		}
		if(query.getName()!=null && !query.getName().equals("null") && !query.getName().isEmpty()){
			if(!where.isEmpty()){
				where=where+" and name like '%"+query.getName()+"%'";
			}else{
				where="where name like '%"+query.getName()+"%'";
			}
		}
		if(query.getTimeFrom()!=null && query.getTimeTo()!=null && !query.getTimeFrom().isEmpty()){
			if(!where.isEmpty()){
				where=where+" and create_time between '"+query.getTimeFrom()+"' and '"+query.getTimeTo()+"'";
			}else{
				where="where create_time between '"+query.getTimeFrom()+"' and '"+query.getTimeTo()+"'";
			}
		}
		
		String orderBy = "";
		if(query.getSortIndex()!=null && !query.getSortIndex().equals("null")){
			if(query.getOrderBy()!= null){
				orderBy = "order by "+ query.getOrderBy();
				System.out.println("111:::"+orderBy);
			}
		}
		
		if(query.getType()!=null && query.getType().equals("all") && query.getUserRole().equals("manager")){
			sql="select * from "+query.getTableName()+" order by create_time desc";
		}else{
			if(query.getId()!=null && !query.getId().equals("null")){
				sql="select * from "+query.getTableName()+" where id="+query.getId();
			}else{
				if(where.isEmpty()){
					sql="select * from "+query.getTableName()+" where user_id='"+query.getUserId()+"' "+orderBy;
				}else{
					sql="select * from "+query.getTableName()+" "+where+" and user_id='"+query.getUserId()+"' "+orderBy;
				}
			}
		}
		return sql;
	}

	public JSONObject modifyRecordStatus(hm Hm) throws JSONException
	{
		//String action,String dbName,String id,String title,String content,String creator,String createTime
		String resultMsg="ok";
		int resultCode=0;
		List jsonList = new ArrayList();
		try {
			ylx_db query_db = new ylx_db(Hm.getDbName());
			//构造sql语句，根据传递过来的查询条件参数
			String tableName="project_hm";
			String sql="update "+tableName+" set status='"+Hm.getStatus()+"' where id="+Hm.getId();
			query_db.executeUpdate(sql);
			sql="select * from "+tableName+" order by create_time desc";
			ResultSet rs = query_db.executeQuery(sql);
			while (rs.next()) {
				List list = new ArrayList();
				list.add(rs.getString("id"));
				list.add(rs.getString("address"));
				list.add(rs.getString("price"));
				list.add(rs.getString("name"));
				jsonList.add(list);
			}
			rs.close();
			query_db.close();
		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();
			resultCode=10;
			resultMsg="查询数据库出现错误！"+sqlexception.getMessage();
		}
		//下面开始构建返回的json
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("aaData",jsonList);
		jsonObj.put("action",Hm.getAction());
		jsonObj.put("result_msg",resultMsg);//如果发生错误就设置成"error"等
		jsonObj.put("result_code",resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
		return jsonObj;
	}

	public void checkRecord(String id, String status, String dbName)
	{
		ylx_db update_db = new ylx_db(dbName);
		String sql = "update project_hm set status='"+status+"' where id="+id;
		update_db.executeUpdate(sql);
		update_db.close();
	}


//	private String getOrderBy(String OrderName){
//		if(OrderName.equals("by_date")){
//			OrderName ="create_time";
//		}
//		if(OrderName.equals("by_name")){
//			OrderName ="name";
//		}
//		if(OrderName.equals("by_price")){
//			OrderName ="price";
//		}
//		return OrderName;
//	}
}
