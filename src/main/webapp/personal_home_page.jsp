<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.servlet.RequestDispatcher" %>
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
}

.navbar-brand{
    margin-left: 30px;
    color: greenyellow !important;
    font-weight: bold;
    letter-spacing: 1px;
}

img{
width: 100%;
height: 760px;
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
      
      <%
     
      HttpSession ses=request.getSession();
		ses.setAttribute("name", request.getParameter("name"));
      %>
    
    
     <img src="bank.jpg">


</body>
</html>