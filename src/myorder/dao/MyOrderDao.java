package myorder.dao;

import dao.ylx_db;
import org.json.JSONException;
import org.json.JSONObject;
import myorder.dao.MyOrder;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.lang.String;

public class MyOrderDao {
    /*
	 * 功能：返回结果集
	 */
    public JSONObject getRecord(MyOrder query) throws SQLException, IOException, JSONException {
        String tableName = "order_file";
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
            ResultSet rs = query_db.executeQuery(sql);
            while (rs.next()) {
                List list = new ArrayList();
                list.add(rs.getString("id"));
                list.add(rs.getString("orderID")); //1
                list.add(rs.getString("orderType")); //2
                list.add(rs.getString("create_time"));//3
                list.add(rs.getString("begin_time"));//5
                list.add(rs.getString("end_time"));//4
                list.add(rs.getString("orderPrice"));//6
                list.add(rs.getString("orderUser"));//7
                list.add(rs.getString("userConnect"));//8
                list.add(rs.getString("status"));//12
                list.add(rs.getString("user_id"));//9
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
        jsonObj.put("result_code", resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代
        return jsonObj;
    }

    public JSONObject modifyRecord(MyOrder Order) throws JSONException {
        //String action,String dbName,String id,String orderType,String orderPrice,String creator,String createTime
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        try {
            ylx_db query_db = new ylx_db(Order.getDbName());
            //构造sql语句，根据传递过来的查询条件参数
            String tableName = "order_file";
            String sql = "update " + tableName + " set orderType='" + Order.getorderType() + "',orderPrice='" + Order.getorderPrice() + "',begin_time='" + Order.getBeginTime() + "',end_time='" + Order.getEndTime() + "',orderUser='" + Order.getorderUser() + "',userConnect='" + Order.getUserConnect() +"',status='"+Order.getStatus()+ "' where id=" + Order.getId();
            query_db.executeUpdate(sql);
            sql = "select * from " + tableName + " order by create_time desc";
            ResultSet rs = query_db.executeQuery(sql);
            while (rs.next()) {
                List list = new ArrayList();
                list.add(rs.getString("id"));
                list.add(rs.getString("orderPrice"));
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
        jsonObj.put("action", Order.getAction());
        jsonObj.put("result_msg", resultMsg);//如果发生错误就设置成"error"等
        jsonObj.put("result_code", resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
        return jsonObj;
    }


    public void showDebug(String msg) {
        System.out.println("[" + (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date()) + "]" + msg);
    }

    public JSONObject addRecord(MyOrder Order) throws JSONException, SQLException {
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        ylx_db query_db = new ylx_db(Order.getDbName());
        //构造sql语句，根据传递过来的查询条件参数
        String tableName = "order_file";
        String status="未支付";
        String sql = "insert into " + tableName + "(orderType,orderPrice,begin_time,end_time,orderUser,user_id,userConnect,create_time,status) values('" + Order.getorderType() + "','" + Order.getorderPrice() +
                "','" + Order.getBeginTime() + "','" + Order.getEndTime() + "','" + Order.getorderUser() + "','" + Order.getUserId() + "','" + Order.getUserConnect() + "','" + Order.getCreateTime() + "','" + status + "')";
        query_db.executeUpdate(sql);
        String sql1 = "UPDATE `order_file` SET orderID=CONCAT('SD',DATE_FORMAT(now(), '%Y%m%d%H%i%s'),lpad(round(round(rand(),4)*1000),4,'0'));";
        query_db.executeUpdate(sql1);
        query_db.close();
        //下面开始构建返回的jso
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("aaData", jsonList);
        jsonObj.put("action", Order.getAction());
        jsonObj.put("result_msg", resultMsg);//如果发生错误就设置成"error"等
        jsonObj.put("result_code", resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
        showDebug(jsonObj.toString());
        return jsonObj;
    }

    public JSONObject deleteRecord(String action, String dbName, String[] ids, String createTime) throws JSONException, SQLException {
        String tableName = "order_file";
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

    /*
	 * 功能：构造历史记录查询的sql语句,type=all查询所有，type=id查询某个记录，余下按照条件设置查询
	 */
    private String createGetRecordSql(MyOrder query) {
        String sql = "";
        String where = "";
        if (query.getId() != null && !query.getId().equals("null") && !query.getId().isEmpty()) {
            where = "where id=" + query.getId();
        } else {
            if (query.getSearchName() != null && query.getSearch() !=null) {
                where = "where " + query.getSearchName() + " like '%" + query.getSearch() + "%'";
            }
        }
        if (query.getTimeFrom() != null && query.getTimeTo() != null && !query.getTimeFrom().isEmpty()) {
            if (!where.isEmpty()) {
                where = where + " and create_time between '" + query.getTimeFrom() + "' and '" + query.getTimeTo() + "'";
            } else {
                where = "where create_time between '" + query.getTimeFrom() + "' and '" + query.getTimeTo() + "'";
            }
        }
        if (query.getId() == null && query.getSearchName() == null && query.getSearch() == null && query.getOrderBy() == null && query.getSortIndex() == null) {
            sql = "select * from " + query.getTableName() + " where user_id='" + query.getUserId() + "'";
        } else {
            if (query.getId() != null && !query.getId().equals("null")) {
                sql = "select * from " + query.getTableName() + " where id=" + query.getId()+ " and user_id='" + query.getUserId()+"'";
            } else {
                if (where.isEmpty()) {
                    sql = "select * from " + query.getTableName() + " where user_id='" + query.getUserId() + "'";
                } else {
                    sql = "select * from " + query.getTableName() + " " + where + " and user_id='" + query.getUserId() + "'";
                }
            }
        }
        String orderBy = "";
      //  System.out.println("sort:"+query.getSortIndex());
        if(query.getSortIndex()!=null && !query.getSortIndex().equals("null")){
            if(query.getOrderBy()!= null) {
                orderBy = "order by " + query.getOrderBy()+" asc";
            //   System.out.println("111:::" + orderBy);
                if (where.isEmpty()) {
                    sql = "select * from " + query.getTableName() + " where user_id='" + query.getUserId() + "' " + orderBy;
                } else {
                    sql = "select * from " + query.getTableName() + " " + where + " and user_id='" + query.getUserId() + "' " + orderBy;
                }
            }
        }
        showDebug("构造ddddddddddd的sql:"+sql);
        return sql;
    }
}

