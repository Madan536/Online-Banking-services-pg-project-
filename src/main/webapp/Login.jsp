<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <style>

        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;800&display=swap');
        
        body{   
            font-family: 'Poppins', sans-serif; 
            background-image: url("pexels-maitree-rimthong-1602726.jpg");
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat; 
        }

        .container{
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container form .label{
            padding: 30px;
            display: flex;
            justify-content: center;
            font-weight: 700;
        }
    </style>
    <%String msg=request.getParameter("msg"); %>
</head>
<body>
<jsp:include page="Home_navbar.html"></jsp:include>
    <div class="container">  
     
    <form action="Login_check" method="post">
        <label class="label">Login</label>
        <%       
         if("invaild".equals(msg)){
        	 %>
        	 
        	<div class="alert alert-warning d-flex align-items-center" role="alert">
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </svg>
  <div>
    Account No and Password Wrong
  </div>
</div>
      
      <% 
         }
         %>
         
          <%       
         if("out".equals(msg)){
        	 %>
        	 
        	<div class="alert alert-success d-flex align-items-center" role="alert">
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="success:">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
    
    <use xlink:href="#check-circle-fill"/>
  </svg>
  <div>

    logout Successfully
  </div>
</div>
             <% 
         }
         %>

        <div class="mb-3 mt-3">
          <label for="text" class="form-label">Account No</label>
          <input type="text" class="form-control" Placeholder="Account No" name="an" plaeholder="Account No" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Password:</label>
          <input type="password" class="form-control" placeholder="Password" name="pass" placeholder="Password" required>
        </div>
        <div class="form-check mb-3">
          <label class="form-check-label">
            <input class="form-check-input" type="checkbox" name="remember" required> Remember me
          </label>
          
        </div>
        <input class="btn btn-success" type="submit" value="Login">
      </form>
    </div>
</body>
</html>