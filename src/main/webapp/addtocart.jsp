<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <style>
      *{
        font-family: 'Trocchi','serif';
      }
      h1 {
        color: #7c795d;
        font-family: 'Trocchi','serif';
        font-size: 45px;
        font-weight: normal;
        line-height: 48px;
        margin: 0;
        padding-bottom: 15px;
      }

      h2 { color: #7c795d;
        font-family: 'Source Sans Pro', sans-serif;
        font-size: 28px;
        font-weight: 400;
        line-height: 32px;
        margin: 0 0 24px;
      }
    </style>
    <style>
      body {
        background-color: #ffffff!important;
      }

      .login {
        background-color: #ecf3f9;
        width: 40%;
        margin: 80px auto;
        border-radius: 10px;
        padding: 20px;
        border-left: 5px solid #009688;
        box-shadow: 0px 0px 0px 0px #3f51b5;
      }

      .login>.row>h2 {
        margin: auto;
      }

      .btn-form {
        width: 100%;
        margin-top: 20px;
      }

    </style>
</head>
<%@page import="java.sql.*" %>
        
		<%
 

		    if(request.getParameter("submit")!=null)
		
		    {
		
		        String name = request.getParameter("name");
		        String med_name = request.getParameter("med_name");
			    String qty = request.getParameter("qty");
			    String ph_no = request.getParameter("ph_no");
		        String msg = request.getParameter("msg");
		        
		        String email_id = (String)pageContext.getAttribute("email",pageContext.SESSION_SCOPE);
		        System.out.println(email_id);
	            
	            
		        Connection con;
		        PreparedStatement pst;		
		        ResultSet rs;
		
		        Class.forName("com.mysql.jdbc.Driver");		
		        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medshop","root","");		
		        pst = con.prepareStatement("insert into medreq(name,med_name,qty,phone_no,email,msg)values(?,?,?,?,?,?)");		
	
		        pst.setString(1, name);	
		        pst.setString(2, med_name);		
		        pst.setString(3, qty);
		        pst.setString(4, ph_no);
		        pst.setString(5, email_id);
		        pst.setString(6, msg);	
		        pst.executeUpdate();  
		        
		    
		        %>
		
		    <script>  
		
		        alert("We got Your request. About the requested medicines our reps will call you soon");    
		
		    </script>
			<%
			
			}
			%>
<body>
	<nav class="navbar is-fixed">
        <div class="navbar-brand">
            <a class="navbar-item" href="index.html">
                <p>MedShop</p>
            </a>
        </div>

        <div id="navbarExampleTransparentExample" class="navbar-menu">
            <div class="navbar-start">
                <a class="navbar-item" href="index.html#allProducts">
                    All Products
                </a>
                <a class="navbar-item" href="index.html#deals">
                    In Deal
                </a>
                <a class="navbar-item" href="#">
                    Contact Us
                </a>
                <a class="navbar-item" href="other.html">
                    Other Products
                </a>
            </div>

            <div class="navbar-end">
                <div class="navbar-item">
                    <div class="buttons">
                        <a class="button is-light" href="signup.html">
                            <strong>Cart</strong>
                        </a>
                        <a class="button is-primary" href="signup.html">
                            <strong>Sign up</strong>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
	<div class="container">	
			<div class="col-sm-8">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>Medicine name</th>
                                    <th>Quantity</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                            
                             <%  
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;

                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medshop","root","");

                                  String query = "select * from medreq";
                                  Statement st = con.createStatement();

                                    rs =  st.executeQuery(query);
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
                             <tr>
                                 <td><%=rs.getString("med_name") %></td>
                                 <td><%=rs.getString("qty") %></td>
                                 <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                 <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                             </tr>
                                <%                               
                                
                                 }

                               %>
                     </table>    
                 </div>
            </div> 
       </div>
</body>
</html>