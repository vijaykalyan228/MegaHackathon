/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hackathon.util;

import java.io.*;
import java.sql.*;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class dbHelperServlet extends HttpServlet {
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        try {
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/hackathon", "verizon", "verizon");
            Statement st = con.createStatement();
            int i = st.executeUpdate("insert into comments(page,comment,createdby,createdat) values(\'"+request.getParameter("page")
                    +"\',\'"+request.getParameter("comment")+"\',\'"+request.getParameter("createdby")+"\',\'"
                    +new java.sql.Timestamp(System.currentTimeMillis())+"\')");
            System.out.println("Data is successfully inserted!");
            con.commit();
            con.close();
        } catch (Exception e) {
            System.out.print(e);
            e.printStackTrace();
        }
        finally
        {
            response.sendRedirect(request.getParameter("page")+".jsp");
        }
    }

}
