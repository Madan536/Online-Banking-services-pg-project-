<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Bank</title>
</head>
<body>
     <title>View Transacation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Style -->
 
 <style>

    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;800&display=swap');
    
    body{   
        font-family: 'Poppins', sans-serif;  
        background-image: url("writing.jpg");  
        background-size: cover;
        background-position: center;
        background-repeat:no-repeat;
    }
    
     .container{
        display: flex;
        justify-content: center;
        min-height: 100vh;
        align-items: center;
     }

    .container .box p{
        font-weight: bold;
        padding: 30px;
        margin-top:50px;
    }

    .container .box a .btn{
    margin-top: 30px;  
    }
    
    .navbar-brand{
    margin-left: 30px;
    color: greenyellow !important;
    font-weight: bold;
    letter-spacing: 1px;
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
            <a class="nav-link active" aria-current="page" href="Admin_login.jsp?name=Admin">Home</a>
          </li>
          <li class="nav-item dropdown ">
            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Account
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              <li><a class="dropdown-item" href="Opennewaccount.jsp?name=Admin">Open New Account</a></li>
              <li><a class="dropdown-item" href="Login_All_Account.jsp?name=Admin">All Account</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                 
              Transaction
           </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> 
              <li><a class="dropdown-item" href="Admin_transacation.jsp?name=Admin">View Transaction</a></li> 
              <li><a class="dropdown-item" href="Admin_Alltransacation.jsp?name=Admin">All Transaction</a></li>
            </ul>
          </li>
        </ul>
         <ul class="navbar-nav me-2">
        <li class="nav">
           <h4 class="btn btn-primary" style="color:white"><%out.println("Admin");
           %></h4>
          </li>
          </ul>
        <ul class="navbar-nav me-2">
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
					out.println(request.getParameter("id"));
					PreparedStatement ps=con.prepareStatement("select * from createaccount where Id="+request.getParameter("id"));
					ResultSet rs=ps.executeQuery();
					
					while(rs.next()){ %>
					 
		             
		            
  
    <div class="container">
      <div class="box">
            <p class="text-center">View Account</p>
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
                <input class="form-control" type="email" placeholder="Email" name="e" value="<%= rs.getString(5) %>" disabled required>
            </div>
            <div class="inputbox col-6">
                <label class="form-label">Phone Number</label>
                <input class="form-control" type="number" maxlength="10" placeholder="Phone Number" name="pn" value="<%= rs.getString(6) %>" disabled required>
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
                <input class="form-control" type="text" placeholder="State" value="<%= rs.getString(12) %>" disabled name="s" >
            </div>
            <div class="inputbox ">
                <label class="form-label">Amount</label>
                <input class="form-control" type="text" value="<%= rs.getInt(9) %>" disabled name="am">
            </div>
            </div>
        <div class="row">
            <div class="inputbox col-6">
                <label class="form-label">City</label>
                <input class="form-control" type="text" value="<%= rs.getString(11) %>"  disabled name="c" >
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
</body>
</html>