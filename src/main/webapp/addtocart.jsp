<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.sql.*" %>
        
		<%
			out.println("hello");
 

		    if(request.getParameter("submit")!=null)
		
		    {
		
		        String name = request.getParameter("name");
		        String med_name = request.getParameter("med_name");
			    String qty = request.getParameter("qty");
			    String ph_no = request.getParameter("ph_no");
		        String msg = request.getParameter("msg");
		
		        Connection con;
		        PreparedStatement pst;		
		        ResultSet rs;
		
		        Class.forName("com.mysql.jdbc.Driver");		
		        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medshop","root","");		
		        pst = con.prepareStatement("insert into medreq(name,med_name,qty,phone_no,msg)values(?,?,?,?,?)");		
	
		        pst.setString(1, name);	
		        pst.setString(2, med_name);		
		        pst.setString(3, qty);
		        pst.setString(4, ph_no);
		        pst.setString(5, msg);	
		        pst.executeUpdate();  
		        String email_id = (String)pageContext.getAttribute("email",pageContext.SESSION_SCOPE);
	            out.print("pagecontextdata email: "+email_id);
		    
		        %>
		
		    <script>  
		
		        alert("We got Your request. About the requested medicines our reps will call you soon");    
		
		    </script>
			<%
			}
			%>
</body>
</html>