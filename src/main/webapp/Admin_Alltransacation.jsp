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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Style -->
 
 <style>

    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;800&display=swap');
    
    body{   
        font-family: 'Poppins', sans-serif; 
        
    }
    
   .navbar-brand{
    margin-left: 30px;
    color: greenyellow !important;
    font-weight: bold;
    letter-spacing: 1px;
}

    .container-fluid .h1{
        margin-top: 50px;
        text-align: center;
       padding: 20px;
       font-size:20px;
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
           <h4 class="btn btn-primary"><%out.println("Admin");
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
     
  <div class="container-fluid">
    <h1 class="h1">All Transaction</h1>
    <table class="table table-hover table-bordered">
        <thead class="table-success">
          <tr>
            
            <th scope="col">Account No</th>
            <th scope="col">Transaction Details</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
            <th scope="col">Amount</th>
          </tr>
        </thead>
        <tbody>
         <% String url ="jdbc:mysql://localhost:3306/Bank";
      	  try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				try {
					
					Connection con=DriverManager.getConnection(url,"root","root123*");
					PreparedStatement ps=con.prepareStatement("select * from transacation");
					ResultSet rs=ps.executeQuery();					
					while(rs.next()){ 
						
					%>
					
					<tr>
                     
                     <td><%= rs.getString(2)%></td>
                     <td><%= rs.getString(3)%></td>
                     <td><%= rs.getString(4)%></td>
                     <td><%= rs.getString(5)%></td>
                     <td><%= rs.getString(6)%></td>
          </tr>
          
           <% } 
					con.close();
					ps.close();
					rs.close();
					
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
      	  }catch(Exception e) {
      		System.out.println(e.getMessage());  				
            }		 %>
        </tbody>
      </table>
    </div>
</body>
</html>