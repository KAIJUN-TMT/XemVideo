<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Register</title>
<style>
  body {
    background: #f2f2f2;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
  }
  .register-container {
    max-width: 400px;
    margin: 60px auto;
    padding: 30px;
    background: white;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    box-sizing: border-box;
  }
  .register-container h2 {
    text-align: center;
    color: orange;
    margin-bottom: 20px;
  }
  .form-control {
    width: 100%;
    padding: 10px 16px;
    border: 1px solid #ddd;
    border-radius: 999px;
    margin-bottom: 5px;
    font-size: 16px;
    box-sizing: border-box; /* giúp input không tràn khi padding lớn */
  }
  .error-message {
    color: red;
    font-size: 14px;
    margin-bottom: 10px;
    display: block;
  }
  .btn-orange {
    background: orange;
    color: white;
    font-weight: bold;
    border: none;
    width: 100%;
    padding: 12px;
    border-radius: 999px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 10px;
    box-sizing: border-box;
  }
  .btn-orange:hover {
    background: darkorange;
  }
</style>

</head>
<body>
  <div class="register-container">
    <h2>REGISTER</h2>
    <form action="${pageContext.request.contextPath}/dang-ky" method="post">
      <input type="email" name="email" class="form-control" placeholder="E-mail" value="${email}">
      <span class="error-message" id="emailError">${emailError}</span>

      <input type="password" name="password" class="form-control" placeholder="Password">
      <span class="error-message" id="passwordError">${passwordError}</span>

      <input type="password" name="repeatPassword" class="form-control" placeholder="Confirm Password">
      <span class="error-message" id="repeatPasswordError">${repeatPasswordError}</span>

      <input type="text" name="fullName" class="form-control" placeholder="Full Name" value="${fullName}">
      <span class="error-message" id="fullNameError">${fullNameError}</span>

      <button type="submit" class="btn-orange" id="dangkyne">Register</button>
    </form>
  </div>
</body>
</html>
