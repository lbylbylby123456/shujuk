package person.dao;

import dao.ylx_db;
import org.json.JSONException;
import org.json.JSONObject;
import person.dao.Person;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.lang.String;

public class PersonDao {
                /*
	 * 功能：返回结果集
	 */
    public JSONObject getRecord(Person query) throws SQLException, IOException, JSONException {
        String tableName = "user_info";
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
                list.add(rs.getString("user_id")); //1
                list.add(rs.getString("name")); //2
                list.add(rs.getString("sex"));//3
                list.add(rs.getString("birth"));//4
                list.add(rs.getString("occupation"));//5
                list.add(rs.getString("province"));//6
                list.add(rs.getString("city"));//7
                list.add(rs.getString("county"));//8
                list.add(rs.getString("mail"));//9
                list.add(rs.getString("connect"));//10
                list.add(rs.getString("signature"));//11
                list.add(rs.getString("age"));//12
                list.add(rs.getString("path"));//13
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

    public JSONObject modifyRecord(Person Person) throws JSONException {
        //String action,String dbName,String id,String orderType,String orderPrice,String creator,String createTime
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        try {
            ylx_db query_db = new ylx_db(Person.getDbName());
            //构造sql语句，根据传递过来的查询条件参数
            String tableName = "user_info";
            String sql="";
            String bOk="yes";
            if(Person.getCity().equals("") && Person.getCounty().equals("") && Person.getProvince().equals("")){
                bOk="no";
            }
            if(bOk.equals("yes")&&(Person.getPath() == null || Person.getPath().equals("null") || Person.getPath().isEmpty())) {
                sql = "update " + tableName + " set name='" + Person.getName() + "',sex='" + Person.getSex() + "',birth='" + Person.getBirth() + "',occupation='" + Person.getOccupation() + "',province='" + Person.getProvince() + "',city='" + Person.getCity() + "',county='" + Person.getCounty() + "',mail='" + Person.getMail() + "',connect='" + Person.getConnect() + "',signature='" + Person.getSignature() + "',age='" + Person.getAge() + "' where user_id='"+Person.getUser_id()+"'";
            }else if(bOk.equals("yes")&&(Person.getPath() != null || !Person.getPath().equals("null") || !Person.getPath().isEmpty())){
                sql = "update " + tableName + " set name='" + Person.getName() + "',sex='" + Person.getSex() + "',birth='" + Person.getBirth() + "',occupation='" + Person.getOccupation() + "',province='" + Person.getProvince() + "',city='" + Person.getCity() + "',county='" + Person.getCounty() + "',mail='" + Person.getMail() + "',connect='" + Person.getConnect() + "',signature='" + Person.getSignature() + "',age='" + Person.getAge() + "',path='"+Person.getPath()+"' where user_id='"+Person.getUser_id()+"'";
            }else if(bOk.equals("no")&&(Person.getPath() == null || Person.getPath().equals("null") || Person.getPath().isEmpty())){
                sql = "update " + tableName + " set name='" + Person.getName() + "',sex='" + Person.getSex() + "',birth='" + Person.getBirth() + "',occupation='" + Person.getOccupation() + "',mail='" + Person.getMail() + "',connect='" + Person.getConnect() + "',signature='" + Person.getSignature() + "',age='" + Person.getAge() + "' where user_id='"+Person.getUser_id()+"'";
            }else{
                sql = "update " + tableName + " set name='" + Person.getName() + "',sex='" + Person.getSex() + "',birth='" + Person.getBirth() + "',occupation='" + Person.getOccupation() + "',mail='" + Person.getMail() + "',connect='" + Person.getConnect() + "',signature='" + Person.getSignature() + "',age='" + Person.getAge() + "',path='"+Person.getPath()+"' where user_id='"+Person.getUser_id()+"'";
            }
            query_db.executeUpdate(sql);
            showDebug("修改sql:"+sql);
            sql = "select * from " + tableName;
            ResultSet rs = query_db.executeQuery(sql);
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
        jsonObj.put("action", Person.getAction());
        jsonObj.put("result_msg", resultMsg);//如果发生错误就设置成"error"等
        jsonObj.put("result_code", resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
        return jsonObj;
    }
    public void showDebug(String msg) {
        System.out.println("[" + (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date()) + "]" + msg);
    }
    public JSONObject addRecord(Person Person) throws JSONException, SQLException {
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        ylx_db query_db = new ylx_db(Person.getDbName());
        //构造sql语句，根据传递过来的查询条件参数
        String tableName = "user_info";
        String sql = "insert into " + tableName + "(name,sex,birth,occupation,province,city,county,mail,connect,signature,create_time,age,user_id,path) values('" + Person.getName() + "','" + Person.getSex() +
                "','" + Person.getBirth() + "','"  + Person.getOccupation() + "','" +  Person.getProvince() + "','"  + Person.getCity() + "','"  + Person.getCounty() + "','"  + Person.getMail() + "','"  + Person.getConnect() + "','"  + Person.getSignature() + "','"  + Person.getCreate_time() + "','"+Person.getAge() +"','"+Person.getUser_id()+"','"+Person.getPath()+"')";
        query_db.executeUpdate(sql);
        query_db.close();
        //下面开始构建返回的jso
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("aaData", jsonList);
        jsonObj.put("action", Person.getAction());
        jsonObj.put("result_msg", resultMsg);//如果发生错误就设置成"error"等
        jsonObj.put("result_code", resultCode);//返回0表示正常，不等于0就表示有错误产生，错误代码
        showDebug(jsonObj.toString());
        return jsonObj;
    }

    /*
	 * 功能：构造历史记录查询的sql语句,type=all查询所有，type=id查询某个记录，余下按照条件设置查询
	 */
    private String createGetRecordSql(Person query) {
        String sql = "";
        sql = "select * from " + query.getTableName() + " where user_id='" + query.getUser_id() + "'";
        showDebug("构造的sql:"+sql);
        return sql;
    }
}

