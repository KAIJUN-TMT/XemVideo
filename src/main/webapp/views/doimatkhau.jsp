<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Lấy id người dùng từ session hoặc request nếu có
    Object idObj = request.getAttribute("userId");
    int userId = idObj != null ? (int) idObj : 0;

    // Lấy thông báo từ request
    String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Change Password</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    * {
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: #f6f6f6;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .form-container {
      background: white;
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      width: 350px;
      text-align: center;
    }

    .form-container h2 {
      color: orange;
      margin-bottom: 30px;
      font-weight: 600;
    }

    .input-group {
      position: relative;
      margin-bottom: 20px;
    }

    .input-group input {
      width: 100%;
      padding: 12px 40px 12px 40px;
      border: 1px solid #ccc;
      border-radius: 25px;
      outline: none;
    }

    .input-group i {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      left: 15px;
      color: #aaa;
    }

    .btn {
      background: orange;
      color: white;
      border: none;
      padding: 12px;
      width: 100%;
      border-radius: 25px;
      cursor: pointer;
      font-weight: 600;
      transition: 0.3s ease;
    }

    .btn:hover {
      background: darkorange;
    }

    .message {
      color: red;
      font-size: 14px;
      margin-bottom: 10px;
    }

    .message.success {
      color: green;
    }
  </style>
</head>
<body>

  <div class="form-container">
    <h2>CHANGE PASSWORD</h2>

    <% if (message != null) { %>
      <div class="message <%= message.contains("thành công") ? "success" : "" %>">
        <%= message %>
      </div>
    <% } %>

  <form action="<%= request.getContextPath() %>/user/list" method="post">

      <input type="hidden" name="action" value="changePassword">
      <input type="hidden" name="id" value="<%= userId %>">

      <div class="input-group">
        <i class="fas fa-lock"></i>
        <input type="password" name="currentPassword" placeholder="Current Password" required>
      </div>
      <div class="input-group">
        <i class="fas fa-lock"></i>
        <input type="password" name="newPassword" placeholder="New Password" required>
      </div>
      <div class="input-group">
        <i class="fas fa-lock"></i>
        <input type="password" name="confirmPassword" placeholder="Confirm New Password" required>
      </div>
      <button type="submit" class="btn">Change Password</button>
    </form>
  </div>

</body>
</html>
