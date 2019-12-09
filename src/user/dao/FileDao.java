package user.dao;

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


public class FileDao {
    /*
	 * 功能：返回结果集
	 */
    public JSONObject getRecord(UserFile query) throws SQLException, IOException, JSONException {
        String tableName = "user_file";
        //开始查询数据库
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        try {
            ylx_db query_db = new ylx_db(query.getDbName());
            //构造sql语句，根据传递过来的查询条件参数
            String sql = "";
            int count = 0;
            query.setTableName(tableName);
            sql = createGetRecordSql(query);
            System.out.println("[getRecord]" + sql);
            ResultSet rs = query_db.executeQuery(sql);
            while (rs.next()) {
                List list = new ArrayList();
                list.add(rs.getString("id"));
                list.add(rs.getString("title"));
                list.add(rs.getString("content"));
                list.add(rs.getString("gender"));
                list.add(rs.getString("city"));
                list.add(rs.getString("id"));
                list.add(rs.getString("limit_time"));
                list.add(rs.getString("end_time"));
                list.add(rs.getString("end_tag"));
                list.add(rs.getString("user_id"));
                list.add(rs.getString("creator"));
                list.add(rs.getString("create_time"));
                list.add(rs.getString("status"));
                if (query.getUserId() != null && query.getUserId().equals(rs.getString("user_id"))) {
                    list.add("1");
                } else {
                    list.add("0");
                }
                list.add(count);
                count = count + 1;    //做上下记录导航用
                jsonList.add(list);
            }
            rs.close();
            query_db.close();
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
            resultCode = 10;
            resultMsg = "查询数据库出现错误！" + sqlexception.getMessage();
        }
        //////////数据库查询完毕，得到了json数组jsonList//////////
        //jsonList.clear();
        //下面开始构建返回的json
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("aaData", jsonList);
        jsonObj.put("result_msg", resultMsg);//如果发生错误就设置成"error"等
        jsonObj.put("result_code", resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
        return jsonObj;
    }

    public JSONObject modifyRecord(UserFile file) throws JSONException {
        //String action,String dbName,String id,String title,String content,String creator,String createTime
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        try {
            ylx_db query_db = new ylx_db(file.getDbName());
            //构造sql语句，根据传递过来的查询条件参数
            String tableName = "user_file";
            String sql = "update " + tableName + " set title='" + file.getTitle() + "',content='" + file.getContent()  + "',gender='" + file.getGender()  + "',city='" + file.getCity()  + "',status='" + file.getStatus() + "' where id=" + file.getId();
            query_db.executeUpdate(sql);
            sql = "select * from " + tableName + " order by create_time desc";
            ResultSet rs = query_db.executeQuery(sql);
            while (rs.next()) {
                List list = new ArrayList();
                list.add(rs.getString("id"));
                list.add(rs.getString("title"));
                list.add(rs.getString("content"));
                list.add(rs.getString("gender"));
                list.add(rs.getString("city"));
                jsonList.add(list);
            }
            rs.close();
            query_db.close();
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
            resultCode = 10;
            resultMsg = "查询数据库出现错误！" + sqlexception.getMessage();
        }
        //下面开始构建返回的json
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("aaData", jsonList);
        jsonObj.put("action", file.getAction());
        jsonObj.put("result_msg", resultMsg);//如果发生错误就设置成"error"等
        jsonObj.put("result_code", resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
        return jsonObj;
    }

    public JSONObject getRecordById(String action, String dbName, String id) throws JSONException {
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        try {
            ylx_db query_db = new ylx_db(dbName);
            //构造sql语句，根据传递过来的查询条件参数
            String tableName = "user_file";
            String sql = "hello select * from " + tableName + " where id=" + id + " order by create_time desc";
            ResultSet rs = query_db.executeQuery(sql);
            while (rs.next()) {
                List list = new ArrayList();
                list.add(rs.getString("id"));
                list.add(rs.getString("content"));
                list.add(rs.getString("gender"));
                list.add(rs.getString("city"));
                jsonList.add(list);
            }
            rs.close();
            query_db.close();
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
            resultCode = 10;
            resultMsg = "查询数据库出现错误！" + sqlexception.getMessage();
        }
        //下面开始构建返回的json
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("aaData", jsonList);
        jsonObj.put("action", action);
        jsonObj.put("result_msg", resultMsg);//如果发生错误就设置成"error"等
        jsonObj.put("result_code", resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
        return jsonObj;
    }

    public JSONObject addRecord(UserFile file) throws JSONException, SQLException {
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        ylx_db query_db = new ylx_db(file.getDbName());
        //构造sql语句，根据传递过来的查询条件参数
        String tableName = "user_file";
        String sql = "insert into " + tableName + "(parent_id,title,content,gender,city,limit_time,status,user_id,creator,create_time) values('" + file.getParentId() + "','" + file.getTitle() + "','" + file.getContent() +
                "','" + file.getGender() + "','" + file.getCity() + "','" + file.getLimitTime() + "','" + file.getStatus() + "','" + file.getUserId() + "','" + file.getCreator() + "','" + file.getCreateTime() + "')";
        showDebug("收到的gender是"+file.getGender());
        //String sql = "insert into " + tableName + "(parent_id,title,content,limit_time,status,user_id,creator,create_time) values('" + file.getParentId() + "','" + file.getTitle() + "','" + file.getContent() +
         //       "','"  + file.getLimitTime() + "','" + file.getStatus() + "','" + file.getUserId() + "','" + file.getCreator() + "','" + file.getCreateTime() + "')";
        query_db.executeUpdate(sql);
        query_db.close();
        //下面开始构建返回的json
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("aaData", jsonList);
        jsonObj.put("action", file.getAction());
        jsonObj.put("result_msg", resultMsg);//如果发生错误就设置成"error"等
        jsonObj.put("result_code", resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
        return jsonObj;
    }
    public void showDebug(String msg){
        System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"][/ServletAction]"+msg);
    }



    public JSONObject deleteRecord(String action, String dbName, String[] ids, String creator, String createTime) throws JSONException, SQLException {
        String tableName = "user_file";
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        ylx_db query_db = new ylx_db(dbName);
        //构造sql语句，根据传递过来的查询条件参数
        for (int i = 0; i < ids.length; i++) {
            String sql = "delete from " + tableName + " where id=" + ids[i];
            query_db.executeUpdate(sql);
        }
        query_db.close();
        //下面开始构建返回的json
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("aaData", jsonList);
        jsonObj.put("action", action);
        jsonObj.put("result_msg", resultMsg);//如果发生错误就设置成"error"等
        jsonObj.put("result_code", resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
        return jsonObj;
    }

    public JSONObject setRecordTop(String action, String dbName, String type, String userId, String id) throws JSONException, SQLException {
        String tableName = "user_file";
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        ylx_db query_db = new ylx_db(dbName);
        ylx_db update_db = new ylx_db(dbName);
        //构造sql语句，根据传递过来的查询条件参数
        String sql = "select max(priority) as priority from user_file where user_id='" + userId + "'";
        int priority = 0;
        ResultSet rs = query_db.executeQuery(sql);
        if (rs.next()) {
            priority = rs.getInt("priority");
        }
        query_db.close();
        update_db.executeUpdate("update user_file set priority=" + (priority + 1) + " where id=" + id);
        update_db.close();
        //下面开始构建返回的json
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("aaData", jsonList);
        jsonObj.put("action", action);
        jsonObj.put("result_msg", resultMsg);//如果发生错误就设置成"error"等
        jsonObj.put("result_code", resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
        return jsonObj;
    }

    /*
	 * 功能：构造历史记录查询的sql语句,type=all查询所有，type=id查询某个记录，余下按照条件设置查询
	 */
    private String createGetRecordSql(UserFile query) {
        String sql = "";
        String where = "";
        if (query.getId() != null && !query.getId().equals("null")) {
            where = "where id=" + query.getId();
        }
        if (query.getTitle() != null && !query.getTitle().equals("null") && !query.getTitle().isEmpty()) {
            if (!where.isEmpty()) {
                where = where + " and title like '%" + query.getTitle() + "%'";
            } else {
                where = "where title like '%" + query.getTitle() + "%'";
            }
        }
        if (query.getTimeFrom() != null && query.getTimeTo() != null && !query.getTimeFrom().isEmpty()) {
            if (!where.isEmpty()) {
                where = where + " and limit_time between '" + query.getTimeFrom() + "' and '" + query.getTimeTo() + "'";
            } else {
                where = "where limit_time between '" + query.getTimeFrom() + "' and '" + query.getTimeTo() + "'";
            }
        }

        if (query.getId() == null && query.getOrderBy() == null && query.getTitle() == null && query.getSortIndex() == null && query.getSortIndex() == null) {
            sql = "select * from " + query.getTableName() + " order by limit_time ";
        } else {
            if (query.getId() != null && !query.getId().equals("null")) {
                sql = "select * from " + query.getTableName() + " where id=" + query.getId();
            } else {
                if (where.isEmpty()) {
                    sql = "select * from " + query.getTableName() + " where user_id='" + query.getUserId() + "' order by limit_time ";
                } else {
                    sql = "select * from " + query.getTableName() + " " + where + " and user_id='" + query.getUserId() + "' order by limit_time ";
                }
            }
        }

		/*-----------构造排序条件--------*/
        System.out.println(query.getSortIndex());
        System.out.println(query.getOrderBy());
        String orderBy = "";
        if ((query.getSortIndex() != null) && !query.getSortIndex().equals("null")) {
            if (query.getOrderBy() != null) {
                orderBy = " order by " + query.getOrderBy();
                if (query.getId() != null && !query.getId().equals("null")) {
                    sql = "select * from " + query.getTableName() + " where id=" + query.getId();
                } else {
                    if (where.isEmpty()) {
                        sql = "select * from " + query.getTableName() + " where user_id='" + query.getUserId() + "'" + orderBy + " desc";
                    } else {
                        sql = "select * from " + query.getTableName() + " " + where + " and user_id='" + query.getUserId() + "'" + orderBy + " desc";
                    }
                }
            }
        }
		/*-----------构造排序完毕--------*/

        return sql;
    }
}
