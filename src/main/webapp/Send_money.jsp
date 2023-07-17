<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    .container{
  display: flex;
  justify-content: center;
  min-height: 300px;
  align-items: center;
}

.navbar-brand{
    margin-left: 30px;
    color: greenyellow !important;
    font-weight: bold;
    letter-spacing: 1px;
}

 h5{
  display: flex;
  justify-content: center;
  margin-top: 100px;
  font-weight: bold;
}

</style>
<%String msg=request.getParameter("msg"); %>
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
                  <li><a class="dropdown-item" href="Personal_view_account.jsp?ac=<%= request.getParameter("ac")%>&name=<%= request.getParameter("name") %>">View Profile</a></li>
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

  
  <h5>Send Money</h5>
  
  
  
  
  
  <div class="container">
  
  
 
  
  
    <form action="Send_money_save?ac=<%= request.getParameter("ac") %>&name=<%= request.getParameter("name") %>" method="post">
      <div class="mb-3 mt-3">
      
       <%       
         if("invaild".equals(msg)){
        	 %>
        	 
        	<div class="alert alert-warning d-flex align-items-center" role="alert">
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </svg>
  <div>
   Money Not Send
  </div>
</div>
      
      <% 
         }
         %>
         
          <%       
         if("vaild".equals(msg)){
        	 %>
        	 
        	<div class="alert alert-success d-flex align-items-center" role="alert">
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="success:">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
    
    <use xlink:href="#check-circle-fill"/>
  </svg>
  <div>

    Successfully
  </div>
</div>
             <% 
         }
         %>
         <%       
         if("checkbalance".equals(msg)){
        	 %>
        	 
        	<div class="alert alert-warning d-flex align-items-center" role="alert">
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </svg>
  <div>
   Check Your Balance
  </div>
</div>
      
      <% 
         }
         %>
      
        <label for="pwd" class="form-label">Account No</label>
        <input type="number" class="form-control" name="account" placeholder="Account No" required>
      </div>
      <div class="mb-3 mt-3">
        <label for="pwd" class="form-label">Name</label>
        <input type="text" class="form-control"  name="fname" placeholder="Name" required>
      </div>
      <div class="mb-3 mt-3">
        <label for="pwd" class="form-label">Amount</label>
        <input type="number" class="form-control"  name="amount" placeholder="Amount" required>
      </div>
        <input type="submit" class="btn btn-success" value="Send">
      </form>
    </div>
</body>
</html>