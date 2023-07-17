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
     
    .container .text-center{
       padding: 20px;
    }
     .container{
      margin-top:50px;
    }

.navbar-brand{
    margin-left: 30px;
    color: greenyellow !important;
    font-weight: bold;
    letter-spacing: 1px;
}
   

    section .navbar .container{
        display: flex;
        justify-content: center;
    }

    section .text .text-center{
        font-weight: bold;
        display: flex;
        justify-content: center;
        text-align: center;
        margin-top: 100px;  
    }
    
    table{
    width:100%}
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
      
                  
                  
      <section> 
        <div class="text">
            <label class="text-center">All Account</label>
          </div>          
          
     <div class="navbar">
         <div class="container"> 
             <form action="Search_All_Account.jsp" class="d-flex">
             <hr>
                <input class="form-control me-2" type="search" placeholder="Enter Account No" name="sr">
                <input class="btn btn-outline-primary" type="submit" value="Search">
              </form>
                 <a href="Login_All_Account.jsp?name=Admin"><button class="btn ms-2 btn-outline-primary">Back</button></a>
            </div>
        </div>
    <hr>   <%  
            String msg=request.getParameter("msg");
         if("vaild".equals(msg)){
        	 %>
        	 
        	 <div class="alert alert-success d-flex align-items-center" role="alert">
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="success:">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
    
    <use xlink:href="#check-circle-fill"/>
  </svg>
  <div>
     Account Updated
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
    Account Not Updated
  </div>
</div>
        	<% 
         }
      %> 
           <div class="container-fluid">
          <table class="table table-hover table-bordered">
            <thead class="table-success">
              <tr>
                 <th scope="col">AccountNo</th>
                <th scope="col">FullName</th>
                <th scope="col">Email</th>
                <th scope="col">PhoneNo</th>
                <th scope="col">DOB</th>
                <th scope="col">AdharNO</th>
                <th scope="col">Amount</th>
                <th scope="col">Pincode</th>
                <th scope="col">View</th>
                <th scope="col">Edit</th>
              </tr>
            </thead>
            <tbody>
            
            <% String url ="jdbc:mysql://localhost:3306/Bank";
      	  try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				try {
					Connection con=DriverManager.getConnection(url,"root","root123*");
					PreparedStatement ps=con.prepareStatement("select * from createaccount where AccountNo="+request.getParameter("sr"));
					System.out.println("Acc= "+request.getParameter("sr"));
					ResultSet rs=ps.executeQuery();					
					if(rs.next()){ %>
					   <tr>
		                 <td><%= rs.getString(2) %></td>
		                 <td><%= rs.getString(3)%> <%= rs.getString(4) %> </td>
		                 <td><%= rs.getString(5) %></td>
		                 <td><%=rs.getString(6)%></td>
		                 <td><%= rs.getString(7) %></td>
		                 <td><%= rs.getString(8) %></td>
		                 <td><%= rs.getInt(9) %></td>
		                 <td><%= rs.getString(13) %></td>
		                 <td><a class="btn btn-success" href="view_Account.jsp?name=Admin&id=<%= rs.getInt(1) %>">view</a>
		                 </td>
		                 <td><a class="btn btn-primary" href="Edit_Account.jsp?name=Admin&id=<%= rs.getInt(1) %>">Edit</a>
		                 </td>
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
          </section>
    </body>
    </html>