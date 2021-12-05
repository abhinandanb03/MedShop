<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>

<%

    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String med_name = request.getParameter("med_name");
        String qty = request.getParameter("qty");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;      

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/medshop","root","");
        pst = con.prepareStatement("update medreq set med_name = ?,qty =? where id = ?");
	    pst.setString(1, med_name);
        pst.setString(2, qty);
        pst.setString(3, id);
        pst.executeUpdate();  

        RequestDispatcher redirect = request.getRequestDispatcher("addtocart.jsp");
        redirect.include(request, response);
        %>

        <script>  

            alert("Record Updated");          

       </script>
    <%            
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>      

         <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Student Update</h1>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >                
                    <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;  
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medshop","root","");                        
                          String id = request.getParameter("id");
                        pst = con.prepareStatement("select * from medreq where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                         while(rs.next())
                         {                  
		                    %>
		                    <div alight="left">
		                        <label class="form-label">Medicine name</label>
		                        <input type="text" class="form-control" placeholder="Enter name of the medicine" value="<%= rs.getString("med_name")%>" name="med_name" required >
		                     </div>                       
		                    <div alight="left">
		                        <label class="form-label">Quantity</label>
		                        <input type="text" class="form-control" placeholder="Enter Quantity" name="qty" value="<%= rs.getString("qty")%>" required >
		                     </div>                   
		                     
		                    <% }  %>
                         </br>
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                     </div>  
                </form>
            </div>          
        </div>
    </body>
</html>