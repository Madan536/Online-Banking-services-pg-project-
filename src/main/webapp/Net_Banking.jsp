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
    }

    .container .box .btn{
    margin-top: 30px;  
    }
     
    </style>
</head>
<body>
   <jsp:include page="Home_navbar.html"></jsp:include>
    <div class="container">
        <div class="box">
              <p class="text-center">Net Banking</p>
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
    Net Backing Created
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
    Net Backing Not Create
  </div>
</div>
        	<% 
         }
      
         if("Already".equals(msg)){
        	 %>
        	<div class="alert alert-warning d-flex align-items-center" role="alert">
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </svg>
  <div>
    This Account Already Net Banking Created
  </div>
</div>
        	<% 
         }
      %> 
              <form action="Net_Banking_save" method="post">
          <div class="row">
              <div class="inputbox col-6">
                  <label class="form-label">Account No</label>
                  <input class="form-control" type="number"  name="an" required placeholder="Account No">
                 
              </div>
              <div class="inputbox col-6">
                  <label class="form-label">User Name</label>
                  <input class="form-control" type="text"  name="un" required placeholder="User Name">
                    
              </div>
          </div>  
          <div class="row">
              <div class="inputbox col-6">
                  <label class="form-label">First Name</label>
                  <input class="form-control" type="text"  name="fn" required placeholder="First Name">
                 
              </div>
              <div class="inputbox col-6">
                  <label class="form-label">Adhar Number</label>
                  <input class="form-control" type="text"  name="adhar" placeholder="Adhar Number"
                   pattern="[0-9]{12}" title="Only 12 Digit Values Allowed">
                    
              </div>
          </div>
          <div class="row">
              <div class="inputbox col-6">
                  <label class="form-label">Password</label>
                  <input class="form-control" type="password" name="pass" required placeholder="Password"
                  title="Must one uppercase and lowercase letter, and at least 4 or more characters">
                    
              </div>
              <div class="inputbox col-6">
                  <label class="form-label">Confirm Password</label>
                  <input class="form-control" type="password"  name="cpass" required placeholder="Confirm Password"
                  title="Must one uppercase and lowercase letter, and at least 4 or more characters">
              </div>
          </div> 
              <input class="btn btn-success" type="submit"> 
          </form>
        </div>
      </div> 
</body>
</html>