<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
        <title>MedShop</title>
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
        <%@page import="java.sql.*" %>

		<%

 

		    if(request.getParameter("submit")!=null)
		
		    {
		
		        String name = request.getParameter("name");
		        String med_name = request.getParameter("med_name");
			    String qty = request.getParameter("qty");
			    String ph_no = request.getParameter("phone_no");
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
		
		        %>
		
		    <script>  
		
		        alert("We got Your request. About the requested medicines our reps will call you soon");    
		
		    </script>
		
		    <%            
		
		    }

   %>
    </head>
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
                            <a class="button is-light" href="login.html">
                                Log in
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container" style="margin-top: 60px; margin-bottom: 60px">
        <h1>DO You have any medicine that is not available in the list?<br>Lets us know</h1>
                <form method = "POST" action="#">
                	<div class="field">
					  <label class="label">Name</label>
					  <div class="control">
					    <input class="input" type="text" name="name" placeholder="Enter your name">
					  </div>
					</div>
					
					<div class="field">
					  <label class="label">Enter Medicine Name</label>
					  <div class="control has-icons-left has-icons-right">
					    <input class="input is-success" type="text" name="med_name" placeholder="Enter Medicine Name" >
					</div>
					
					<div class="field">
					  <label class="label">Enter Quantity</label>
					  <div class="control has-icons-left has-icons-right">
					    <input class="input is-success" type="text" name="qty" placeholder="Enter Quantity" >
					</div>
								
					<div class="field">
					  <label class="label">Phone Number</label>
					  <div class="control has-icons-left has-icons-right">
					    <input class="input is-success" type="text" name="ph_no" placeholder="Enter your phone no" >
					</div>
										
					<div class="field">
					  <label class="label">Any Particular Message</label>
					  <div class="control">
					    <textarea class="textarea" placeholder="Textarea" name="msg"></textarea>
					  </div>
					</div>
															
					<div class="field is-grouped">
					  <div class="control">
					    <input type="submit" value="submit" class="button is-link">
					  </div>
					</div>
                </form>
             </div>
	</body>
</html>