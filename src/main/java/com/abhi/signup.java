package com.abhi;

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class signup extends HttpServlet {
   

   @Override
   public void doGet(HttpServletRequest req, HttpServletResponse res) 
         throws ServletException, IOException {

      PrintWriter out = null;

      res.setContentType("text/html");
      out = res.getWriter();
      
      PreparedStatement pst;
      Connection con = null;
      try {
      Class.forName("com.mysql.jdbc.Driver").newInstance();
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medshop", "root", "");
      String email = req.getParameter("email");
      String pass = req.getParameter("password");
      pst = con.prepareStatement("insert into userdetails(email,password)values(?,?)");
      pst.setString(1, email);
      pst.setString(2, pass);
      pst.executeUpdate();  
      String msg = "User Created";
      out.println("User Created"); 
      }
      catch (Exception e)
      {
      out.println("An error occurred."+e);
      }
      }
   

   @Override
   public void doPost(HttpServletRequest req, HttpServletResponse res) 
         throws ServletException, IOException {
      doGet(req, res);
   }
}