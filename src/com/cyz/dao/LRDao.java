package com.cyz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import com.cyz.bean.User;
import com.cyz.bean.User_g;
import com.cyz.bean.User_d;
import com.cyz.util.BaseConnection;

public class LRDao {
    User user;
    User_g user_g;
    User_d user_d;

    public String Login(User u) {
        String id = null;
        String sql = "select * from user where username=? and password=?";
        try {
            Connection conn = BaseConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ResultSet rs = ps.executeQuery();
            rs.next();
            id = rs.getString("u_id");
            return id;
        } catch (Exception e) {
            e.printStackTrace();// TODO: handle exception

        }
        return null;
    }

   // public boolean Login_g(User_g g) {
   public String Login_g(User_g g) {
//        String sql = "select count(*) as count from user_g where username_g=? and password_g=?";
//        try {
//            Connection conn = BaseConnection.getConnection();
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, g.getUsername_g());
//            ps.setString(2, g.getPassword_g());
//            ResultSet rs = ps.executeQuery();
//            rs.next();
//
//            if (rs.getInt("count") != 0)
//                return true;
//            else
//                return false;
//
//        } catch (Exception e) {
//            e.printStackTrace();// TODO: handle exception
//            return false;
//        }
       String id = null;
       String sql = "select * from user_g where username_g=? and password_g=?";
       try {
           Connection conn = BaseConnection.getConnection();
           PreparedStatement ps = conn.prepareStatement(sql);
           ps.setString(1, g.getUsername_g());
           ps.setString(2, g.getPassword_g());
           ResultSet rs = ps.executeQuery();
           rs.next();
           id = rs.getString("id");
           return id;
       } catch (Exception e) {
           e.printStackTrace();// TODO: handle exception

       }
       return null;
    }

    public String Login_d(User_d d) {
        String id = null;
        String sql = "select * from user_d where username_d=? and password_d=?";
        try {
            Connection conn = BaseConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, d.getUsername_d());
            ps.setString(2, d.getPassword_d());
            ResultSet rs = ps.executeQuery();
            rs.next();
            id = rs.getString("id_d");
            return id;
        } catch (Exception e) {
            e.printStackTrace();// TODO: handle exception

        }
        return null;
    }





    //该方法负责将传递过来的news对象中的数据 存入数据库中。方法二：（推荐使用占位符）
    public boolean insert(User u) {
        boolean b = false;
        try {
            Connection conn = BaseConnection.getConnection();
            PreparedStatement ps = null;
            String sql = "insert into user (username,password) " +
                    "values (?,?)";//占位符

            ps = conn.prepareStatement(sql);//将写好的数据传递到数据库
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());

            int a = ps.executeUpdate();//这个方法用于改变数据库数据
            if (a > 0) {
                b = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public boolean insert(User_g g) {
        boolean b = false;
        try {
            Connection conn = BaseConnection.getConnection();
            PreparedStatement ps = null;
            String sql = "insert into user_g (username_g,password_g) " +
                    "values (?,?)";//占位符

            ps = conn.prepareStatement(sql);//将写好的数据传递到数据库
            ps.setString(1, g.getUsername_g());
            ps.setString(2, g.getPassword_g());

            int a = ps.executeUpdate();//这个方法用于改变数据库数据
            if (a > 0) {
                b = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public boolean insert(User_d d) {
        boolean b = false;
        try {
            Connection conn = BaseConnection.getConnection();
            PreparedStatement ps = null;
            String sql = "insert into user_d (username_d,password_d) " +
                    "values (?,?)";//占位符

            ps = conn.prepareStatement(sql);//将写好的数据传递到数据库
            ps.setString(1, d.getUsername_d());
            ps.setString(2, d.getPassword_d());

            int a = ps.executeUpdate();//这个方法用于改变数据库数据
            if (a > 0) {
                b = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }


    public ArrayList<User> getListAll() throws Exception {
        //1.创建ArrayList用于存储数据库中传来的数据
        ArrayList<User> ar = new ArrayList<User>();
        //2.通过写好的Connection对象获取数据库连接（引入Java.sql包）
        Connection conn = BaseConnection.getConnection();
        //3.SQL执行器对象（PreparedStatement比 Statement更好）
        Statement ps = null;
        //声明ResultSet的对象（结果集对象）
        ResultSet rs = null;
        try {
            String sql = "select * from user"; //+
            //" where user.u_id = wenjuan.w_title";

            ps = conn.createStatement();
            rs = ps.executeQuery(sql);
            while (rs.next()) {
                User u = new User(null, null);
                u.setU_id(rs.getInt("u_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                ar.add(u);


            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return ar;

    }

    public ArrayList<User_g> getListAll_g() throws Exception {
        //1.创建ArrayList用于存储数据库中传来的数据
        ArrayList<User_g> ar = new ArrayList<User_g>();
        //2.通过写好的Connection对象获取数据库连接（引入Java.sql包）
        Connection conn = BaseConnection.getConnection();
        //3.SQL执行器对象（PreparedStatement比 Statement更好）
        Statement ps = null;
        //声明ResultSet的对象（结果集对象）
        ResultSet rs = null;
        try {
            String sql = "select * from user_g"; //+
            //" where user.u_id = wenjuan.w_title";

            ps = conn.createStatement();
            rs = ps.executeQuery(sql);

            while (rs.next()) {
                User_g u = new User_g(null, null);
                u.setU_id_g(rs.getInt("id"));
                u.setUsername_g(rs.getString("username_g"));
                u.setPassword_g(rs.getString("password_g"));
                ar.add(u);


            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return ar;

    }

    public ArrayList<User_d> getListAll_d() throws Exception {
        //1.创建ArrayList用于存储数据库中传来的数据
        ArrayList<User_d> ar = new ArrayList<User_d>();
        //2.通过写好的Connection对象获取数据库连接（引入Java.sql包）
        Connection conn = BaseConnection.getConnection();
        //3.SQL执行器对象（PreparedStatement比 Statement更好）
        Statement ps = null;
        //声明ResultSet的对象（结果集对象）
        ResultSet rs = null;
        try {
            String sql = "select * from user_d"; //+
            //" where user.u_id = wenjuan.w_title";

            ps = conn.createStatement();
            rs = ps.executeQuery(sql);

            while (rs.next()) {
                User_d u = new User_d(null, null);
                u.setU_id_d(rs.getInt("id_d"));
                u.setUsername_d(rs.getString("username_d"));
                u.setPassword_d(rs.getString("password_d"));
                ar.add(u);


            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return ar;

    }






    public boolean delete(int id) {
        boolean b = false;
        try {
            Connection conn = BaseConnection.getConnection();
            PreparedStatement ps = null;
            String sql = "delete from user where u_id = ?";

            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int a = ps.executeUpdate();
            if (a > 0) {
                b = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //BaseConnection.closeRes( ps, conn);
        }
        return b;
    }


}
