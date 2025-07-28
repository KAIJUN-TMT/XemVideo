<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

  
  <style>
    /* CSS cho form */
    body, html {
      height: 100%;
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background: url('10form-login-cuc-dep-4-min.jpg') no-repeat center center fixed;
      background-size: cover;
    }

    .login-container {
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .login-box {
      background: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(10px);
      border-radius: 15px;
      padding: 30px 40px;
      width: 350px;
      box-shadow: 0 0 10px rgba(0,0,0,0.3);
      color: #fff;
    }

    .login-box h1 {
      text-align: center;
      font-weight: bold;
      margin-bottom: 30px;
      color: black;
    }

    .form-control {
      border-radius: 50px;
      padding-left: 40px;
    }

    .input-icon {
      position: relative;
    }

    .input-icon i {
      position: absolute;
      left: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: #999;
    }

    .input-icon small {
      position: absolute;
      bottom: -20px; /* Khoảng cách giữa lỗi và ô input */
      left: 0;
      color: #ffcccc;
      font-size: 0.8em;
      display: none; /* Mặc định ẩn thông báo lỗi */
    }

    .input-icon.error small {
      display: block; /* Hiển thị lỗi khi có lỗi */
    }

    .input-icon input {
      border-color: #ccc; /* Màu border mặc định */
    }

    .input-icon.error input {
      border-color: red; /* Thêm border đỏ khi có lỗi */
    }

    .btn-login {
      border-radius: 50px;
      background-color: #ff3366;
      border: none;
      width: 100%;
    }

    .btn-login:hover {
      background-color: #ff0033;
    }

    .forgot {
      display: block;
      text-align: right;
      margin-top: 10px;
      font-size: 0.9em;
      color: #eee;
      text-decoration: none;
    }

    label.text-danger {
      color: #ffcccc !important;
    }

    .alert-danger {
      color: red;
      background-color: #f8d7da;
      border-color: #f5c6cb;
      padding: 10px;
      border-radius: 5px;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <div class="login-box">
      <h1 style="color: orange;">LOGIN</h1>
  <c:if test="${not empty error and fn:length(error) > 0}">
    <div class="alert alert-danger">
        <strong>Error:</strong> ${error}
    </div>
</c:if>


      <form action="/J4Video/dang-nhap" method="post" id="loginForm">
        
        <div class="mb-3 input-icon ${not empty emailError ? 'error' : ''}">
          <i class="fa fa-user"></i>
          <input type="email" class="form-control" name="email" placeholder="E-mail" value="${email}">
          <c:if test="${not empty emailError}">
            <small style="color: red;margin-bottom: 0px" id="errormail">${emailError}</small>
          </c:if>
        </div>
        <div class="mb-3 input-icon ${not empty passwordError ? 'error' : ''}">
          <i class="fa fa-lock"></i>
          <input type="password" class="form-control" name="password" placeholder="Password">
          <c:if test="${not empty passwordError}">
            <small style="color: red;margin-bottom: 0px" id="errormk">${passwordError}</small>
          </c:if>
        </div> 
        
        <a href="#" class="forgot" style="color: gray;">Forgot Password?</a>
        <div class="mt-3">
          <button type="submit" class="btn btn-login text-white" id="testdangnhap" style="background-color: orange;">Login</button>
        </div>
      </form>
    </div>
  </div>

  <script>
    // JavaScript to handle error messages
    document.querySelectorAll('input').forEach(input => {
      input.addEventListener('input', function() {
        // Remove error class and hide error message when user changes input
        const parentDiv = input.closest('.input-icon');
        parentDiv.classList.remove('error');
        const errorMessage = parentDiv.querySelector('small');
        if (errorMessage) {
          errorMessage.style.display = 'none';
        }
      });
    });
  </script>
</body>
</html>
