<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.time.LocalDate" %>
    <%@ page import="java.time.LocalTime" %>
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
        min-height: 100vh; 
        background-size: cover;
        background-position: center;
        background-repeat:no-repeat;
    }
    .text h4{
      margin-top: 150px;
      font-weight: bold; 
    }
    section .navbar .container{
      display: flex !important;
        justify-content: center !important;
    }
    
    .navbar-brand{
    margin-left: 30px;
    color: greenyellow !important;
    font-weight: bold;
    letter-spacing: 1px;
}

    .container .box, .navbar .container , .msg{
      display: flex;
      justify-content: center;
      margin-top: 20px;
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
           <h4 class="btn btn-primary">Admin
           </h4>
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
   



  <session>
    <div class="text">
      <h4 class="text-center">Transaction</h4>
      <div class="msg">
      <%  
            String msg=request.getParameter("msg");
         if("vaild".equals(msg)){
        	 %>
        	 
        	 <div class="alert alert-success d-flex align-items-center" role="alert">
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="success:">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
    
    <use xlink:href="#check-circle-fill"/>
  </svg>
  <div>
     Cash Deposit Successfully
  </div>
</div>
      
      <% 
         }
         if("invaild".equals(msg)){
        	 %>
        	<div class="alert alert-warning d-flex align-items-center" role="alert">
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </svg>
  <div>
   Someone Wrong
  </div>
</div>
        	<% 
         }
      %>   
      </div>
    </div>
     
    
    <div class="navbar">
      <div class="container"> 
          
          <form action="Admin_transacation.jsp?name=Admin" class="d-flex">

          <hr>
          
             <input class="form-control me-2" type="search" placeholder="Enter Account No" name="sr">
             <input class="btn btn-primary" type="submit" value="Search">
           </form>
           <hr>
         </div>
     </div>
     
     
      <% String url ="jdbc:mysql://localhost:3306/Bank";
      	  try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				try {
					
					Connection con=DriverManager.getConnection(url,"root","root123*");
					PreparedStatement ps=con.prepareStatement("select * from createaccount where AccountNo="+request.getParameter("sr"));
					System.out.println("Acc= "+request.getParameter("sr"));
					
					ResultSet rs=ps.executeQuery();					
					while(rs.next()){ 
						
					%>
					
       <div class="container">
        <div class="box">
           <form action="transacation_save?id=<%=rs.getInt(1) %>&acc=<%= rs.getString(2) %>" method="post">
             
              
          <div class="row">
              <div class="inputbox col-6">
                  <label class="form-label">Account No</label>
                  <input class="form-control" type="text" placeholder="Acount No" name="ac" value="<%= rs.getString(2) %>" disabled required>
              </div>
              <div class="inputbox col-6">
                  <label class="form-label">First Name</label>
                  <input class="form-control" type="text" placeholder="First Name" name="fn" value="<%= rs.getString(3) %>" disabled required>
              </div>
          </div>  
          <div class="row">
            <div class="inputbox col-6">
              <label class="form-label">Last Name</label>
              <input class="form-control" type="text" placeholder="Last Name" name="ln" value="<%= rs.getString(4) %>" disabled required>
          </div>
              <div class="inputbox col-6">
                  <label class="form-label">Email</label>
                  <input class="form-control" type="email" placeholder="Email" name="e" value="<%= rs.getString(5) %>" disabled required>
              </div> 
          </div>
          
          <div class="row">
          <div class="inputbox col-12">
                  <label class="form-label">Transaction type</label>
            <select class="form-select" name="ty" aria-label="Default select example">
                     <option>select menu</option>
                     <option value="Credit">Credit</option>
                     <option value="Deposit">Deposit</option>
                     </select> 
          </div>
          </div>

          <div class="row">
              <div class="inputbox col-6">
                  <label class="form-label">Amount</label>
                  <input class="form-control" type="number" placeholder="Amount"  name="am" required>
              </div>
              <div class="inputbox col-6">
                  <label class="form-label">Total Amount</label>
                  <input class="form-control" type="number" value="<%= rs.getInt(9) %>"  disabled placeholder="Total Amount" name="pc" required>
              </div>
          </div>
          <input style="margin-top: 30px" class="btn btn-success" type="submit">
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
  </session>
</body>
</html>