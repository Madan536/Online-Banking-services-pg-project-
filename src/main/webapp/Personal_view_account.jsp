<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Bank</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
<!-- Style -->
 
<style>

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;800&display=swap');

body{   
    font-family: 'Poppins', sans-serif;
    background-image: url("writing.jpg");  
        background-size: cover;
        min-height: 100vh;
        background-position: center;
        background-repeat:no-repeat;
}

.navbar-brand{
    margin-left: 30px;
    color: greenyellow !important;
    font-weight: bold;
    letter-spacing: 1px;
}

.container{
        display: flex;
        justify-content: center;
        min-height: 100vh;
        align-items: center;
     }
     .container .box p{
         margin-top:70px;
         font-weight:bold;     
     }
</style>
</head>
<body>
           
           <nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">MADAN</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse " id="navbarNavDropdown">
            <ul class="navbar-nav mx-auto ">
              <li class="nav-item">
                <a class="nav-link " aria-current="page" href="personal_home_page.jsp?ac=<%= request.getParameter("ac")%>&name=<%= request.getParameter("name")%>">Home</a>
              </li>
              <li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Account Information
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  <li><a class="dropdown-item" href="Personal_view_account.jsp?ac=<%= request.getParameter("ac")%>&name=<%= request.getParameter("name")%>">View Profile</a></li>
                  <li><a class="dropdown-item" href="password_change.jsp?ac=<%= request.getParameter("ac") %>&name=<%= request.getParameter("name")%>">Change Password</a></li>
                </ul>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle"  id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Transaction
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  <li><a class="dropdown-item" href="Send_money.jsp?ac=<%= request.getParameter("ac") %>&name=<%= request.getParameter("name")%>">Send Money</a></li>
                </ul>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle"  id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                 Report
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  <li><a class="dropdown-item" href="Personal_All_Transaction.jsp?ac=<%= request.getParameter("ac") %>&name=<%= request.getParameter("name")%>">All Transaction</a></li>
                  <li><a class="dropdown-item" href="Personal_debit_show.jsp?ac=<%= request.getParameter("ac") %>&name=<%= request.getParameter("name")%>">Debit</a></li>
                  <li><a class="dropdown-item" href="Personal_credit_Transaction_show.jsp?ac=<%= request.getParameter("ac") %>&name=<%= request.getParameter("name")%>">Credit</a></li>
                </ul>
                <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="Balance.jsp?ac=<%= request.getParameter("ac") %>&name=<%= request.getParameter("name")%>">Balance</a>
                  </li>
            </ul>
            <ul class="navbar-nav me-2">
        <li class="nav">
           <h4 class="btn btn-primary"><%out.println(request.getParameter("name"));
           
           %></h4>
          </li>
          </ul>
            <ul class="navbar-nav ms-3 mb-2 mb-lg-0">
              <li class="nav-item">
                <a href="Login.jsp?msg=out"><button class="btn btn-outline-success" type="submit">Logout</button></a>
                
              </li>
            </ul>
          </div>
        </div>
      </nav>
      
      
      
      <% String url ="jdbc:mysql://localhost:3306/Bank";
      	  try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				try {
					Connection con=DriverManager.getConnection(url,"root","root123*");
					System.out.println(" Acount =="+request.getParameter("an"));
					PreparedStatement ps=con.prepareStatement("select * from createaccount where AccountNo="+request.getParameter("ac"));
					ResultSet rs=ps.executeQuery();
					
					if(rs.next()){ %>
					 
		             
		            
  
    <div class="container">
      <div class="box">
            <p class="text-center">View Profile</p>
            <form>  
        <div class="row">
            <div class="inputbox col-6">
                <label class="form-label">Account No</label>
                <input class="form-control" type="text" name="an" value="<%= rs.getString(2) %>" disabled>
            </div>
            <div class="inputbox col-6">
                <label class="form-label">Full Name</label>
                <input class="form-control" type="text" name="fn" value="<%= rs.getString(3) %>" disabled>
            </div>
        </div>  
        <div class="row">
            <div class="inputbox col-6">
                <label class="form-label">Email</label>
                <input class="form-control" type="email"  name="e" value="<%= rs.getString(5) %>" disabled required>
            </div>
            <div class="inputbox col-6">
                <label class="form-label">Phone Number</label>
                <input class="form-control" type="number" maxlength="10"  name="pn" value="<%= rs.getString(6) %>" disabled required>
            </div>
        </div>
        <div class="row">
            <div class="inputbox col-6">
                <label class="form-label">DOB</label>
                <input class="form-control " type="date" name="dob" value="<%= rs.getString(7) %>" disabled>
            </div>
            <div class="inputbox col-6">
                <label class="form-label">Adhar Number</label>
                <input class="form-control" type="number" value="<%= rs.getString(8) %>"disabled  name="an">
            </div>
        </div>
            <div class="inputbox ">
                <label class="form-label">Address</label>
                <input class="form-control" type="text" placeholder="Address" value="<%= rs.getString(10) %>" disabled name="ad" >
            </div>
            <div class="row">
            <div class="inputbox ">
                <label class="form-label">State</label>
                <input class="form-control" type="text" placeholder="State" value="<%= rs.getString(11) %>" disabled name="s" >
            </div>
            <div class="inputbox ">
                <label class="form-label">Amount</label>
                <input class="form-control" type="text" value="<%= rs.getInt(9) %>" disabled name="am">
            </div>
            </div>
        <div class="row">
            <div class="inputbox col-6">
                <label class="form-label">City</label>
                <input class="form-control" type="text" value="<%= rs.getString(12) %>"  disabled name="c" >
            </div>
            <div class="inputbox col-6">
                <label class="form-label">Pin Code</label>
                <input class="form-control" type="number" value="<%= rs.getString(13) %>" disabled name="pc">
            </div>
        </div>
        </form>
      </div>
    </div>  
     <% 
					}
					con.close();
					ps.close();
					rs.close();
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
      	  }catch(Exception e) {
      		System.out.println(e.getMessage());  				
            }		 %> 
      
      
</body>
</html>