<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>

<%

        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medshop","root","");
        pst = con.prepareStatement("delete from medreq where id = ?");
        pst.setString(1, id);
        pst.executeUpdate();  

        RequestDispatcher red = request.getRequestDispatcher("addtocart.jsp");
        red.include(request, response);

        %>

        <script>
            alert("item removed");
       </script>