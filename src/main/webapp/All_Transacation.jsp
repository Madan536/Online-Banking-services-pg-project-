<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<title>Online Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Style -->
 
 <style>

    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;800&display=swap');
    
    body{   
        font-family: 'Poppins', sans-serif;   
    }
     section{
        min-height: 100vh;
        background-image: url("writing.jpg");  
        background-size: cover;
        background-position: center;
        background-repeat:no-repeat;
     }
     .navbar-brand{
    margin-left: 30px;
    color: greenyellow !important;
    font-weight: bold;
    letter-spacing: 1px;
}
     
    .container .text-center{
       padding: 20px;
    }
     .container{
      margin-top:50px;
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
           <h4><%out.println(request.getParameter("name"));
           
           %></h4>
          </li>
          </ul>
        <ul class="navbar-nav me-2">
        <li class="nav-item">
          <a href="Login.jsp"><button class="btn btn-outline-success" type="submit">Logout</button></a>
        </li>
        </ul>
      </div>
    </div>
  </nav>
  
<section>
  <div class="container">
    <h1 class="text-center ">All Transaction</h1>
    <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">Account No</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
            <th scope="col">Amount</th>
            <th scope="col">status</th>
            <th scope="col">Transaction</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </tbody>
      </table>   
         
    </div>
    </section>
</body>
</html>
</body>
</html>