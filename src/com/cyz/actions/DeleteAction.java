package com.cyz.actions;

import com.cyz.bean.User;
import com.cyz.bean.Wenjuan;
import com.cyz.dao.LRDao;
import com.cyz.dao.WenjuanDao;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DeleteAction extends ActionSupport {
    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();

       /* int userid = Integer.parseInt(request.getParameter("u_id"));
        System.out.println(id);
        System.out.println(userid);

        LRDao lr= new LRDao();
        User u = new User();
        int u_id = u.getU_id();
        lr.delete(u_id);

        WenjuanDao wd = new WenjuanDao();
        Wenjuan w  = new Wenjuan();*/

        response.sendRedirect("FindServlet");
        return "success";
    }
}
