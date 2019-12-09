package CM.dao;

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

public class cmDao {
	/*
	 * 功能：返回结果集
	 */
	public JSONObject getRecord(cm query) throws SQLException, IOException, JSONException {
		String tableName="house_check";
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
			while (rs.next()) {
				List list = new ArrayList();
				list.add(rs.getString("id"));
				list.add(rs.getString("name"));
				list.add(rs.getString("address"));
				list.add(rs.getString("price"));
				list.add(rs.getString("status"));
				list.add(rs.getString("user_id"));
				list.add(rs.getString("creator"));
				list.add(rs.getString("create_time"));
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
		jsonObj.put("result_msg",resultMsg);//如果发生错误就设置成"error"等
		jsonObj.put("result_code",resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
		return jsonObj;
	}
	public JSONObject modifyRecord(cm cm) throws JSONException{
		//String action,String dbName,String id,String title,String content,String creator,String createTime
		String resultMsg="ok";
		int resultCode=0;
		List jsonList = new ArrayList();
		try {
			ylx_db query_db = new ylx_db(cm.getDbName());
			//构造sql语句，根据传递过来的查询条件参数
			String tableName="house_check";
			String sql="update "+tableName+" set name='"+ cm.getName()+"',address='"+ cm.getAddress()+"',price='"+ cm.getPrice()+"' where id="+ cm.getId();
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
		jsonObj.put("action", cm.getAction());
		jsonObj.put("result_msg",resultMsg);//如果发生错误就设置成"error"等
		jsonObj.put("result_code",resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
		return jsonObj;
	}
	public JSONObject getRecordById(String action,String dbName,String id) throws JSONException{
		String resultMsg="ok";
		int resultCode=0;
		List jsonList = new ArrayList();
		try {
			ylx_db query_db = new ylx_db(dbName);
			//构造sql语句，根据传递过来的查询条件参数
			String tableName="house_check";
			String sql="select * from "+tableName+" where id="+id+" order by create_time desc";
			ResultSet rs = query_db.executeQuery(sql);
			while (rs.next()) {
				List list = new ArrayList();
				list.add(rs.getString("id"));
				list.add(rs.getString("content"));
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
	public JSONObject addRecord(cm cm) throws JSONException, SQLException{
		String resultMsg="ok";
		int resultCode=0;
		List jsonList = new ArrayList();
		ylx_db query_db = new ylx_db(cm.getDbName());
		//构造sql语句，根据传递过来的查询条件参数
		String tableName="house_check";
		String sql="insert into "+tableName+"(name,address,price,status,user_id,creator,create_time,house_id) values('"+ cm.getName()+"','"+ cm.getAddress()+
				"','"+ cm.getPrice()+"','"+"未审核"+"','"+ cm.getUserId()+"','"+ cm.getCreator()+"','"+ cm.getCreateTime()+"','"+cm.getHouse_id()+"')";
		query_db.executeUpdate(sql);
		query_db.close();
		//下面开始构建返回的json
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("aaData",jsonList);
		jsonObj.put("action", cm.getAction());
		jsonObj.put("result_msg",resultMsg);//如果发生错误就设置成"error"等
		jsonObj.put("result_code",resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
		return jsonObj;
	}

	public JSONObject deleteRecordByHouseId(String House_ID, String dbName) throws JSONException {
		String tableName="house_check";
		String resultMsg="ok";
		int resultCode=0;
		List jsonList = new ArrayList();
		ylx_db query_db = new ylx_db(dbName);
		//构造sql语句，根据传递过来的查询条件参数
		String sql="delete from "+tableName+" where house_id="+House_ID;
		query_db.executeUpdate(sql);
		query_db.close();
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("aaData",jsonList);
		jsonObj.put("action","delete_record_by_house_id");
		jsonObj.put("result_msg",resultMsg);//如果发生错误就设置成"error"等
		jsonObj.put("result_code",resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
		return jsonObj;
	}

	public JSONObject deleteRecord(String action,String dbName,String[] ids,String creator,String createTime) throws JSONException, SQLException{
		String tableName="house_check";
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
	public JSONObject setRecordTop(String action,String dbName,String type,String userId,String id) throws JSONException, SQLException{
		String tableName="house_check";
		String resultMsg="ok";
		int resultCode=0;
		List jsonList = new ArrayList();
		ylx_db query_db = new ylx_db(dbName);
		ylx_db update_db = new ylx_db(dbName);
		//构造sql语句，根据传递过来的查询条件参数
		String sql="select max(priority) as priority from house_check where user_id='"+userId+"'";
		int priority=0;
		ResultSet rs=query_db.executeQuery(sql);
		if(rs.next()){
			priority=rs.getInt("priority");
		}
		query_db.close();
		update_db.executeUpdate("update house_check set priority="+(priority+1)+" where id="+id);
		update_db.close();
		//下面开始构建返回的json
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("aaData",jsonList);
		jsonObj.put("action",action);
		jsonObj.put("result_msg",resultMsg);//如果发生错误就设置成"error"等
		jsonObj.put("result_code",resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
		return jsonObj;
	}

	public void checkRecord(String id, String status, String dbName){
		ylx_db update_db = new ylx_db(dbName);
		String sql = "update house_check set status='"+status+"' where id="+id;
		update_db.executeUpdate(sql);
		update_db.close();
	}

	public String getHouseIdById(String Id,String dbName) throws SQLException {
		ylx_db query_db = new ylx_db(dbName);
		String sql = "select house_id from house_check where id="+Id;
		ResultSet rs = query_db.executeQuery(sql);
		rs.next();
		return rs.getString("house_id");
	}

	/*
	 * 功能：构造历史记录查询的sql语句,type=all查询所有，type=id查询某个记录，余下按照条件设置查询
	 */
	private String createGetRecordSql(cm query){
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
		
		if(query.getType()!=null && query.getType().equals("all")){
			sql="select * from "+query.getTableName()+" order by create_time desc";
		}else{
			if(query.getId()!=null && !query.getId().equals("null")){
				sql="select * from "+query.getTableName()+" where id="+query.getId();
			}else{
				if(where.isEmpty()){
//					sql="select * from "+query.getTableName()+" where user_id='"+query.getUserId()+"' "+orderBy;
					sql="select * from "+query.getTableName()+" "+orderBy;
				}else{
//					sql="select * from "+query.getTableName()+" "+where+" and user_id='"+query.getUserId()+"' "+orderBy;
					sql="select * from "+query.getTableName()+" "+where+ " "+orderBy;
				}
			}
		}
		return sql;
	}

}
