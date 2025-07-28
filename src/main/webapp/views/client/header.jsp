<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
    .header-navbar {
        background-color: black;
        padding: 10px 0;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 1000; /* Đảm bảo header luôn nằm trên các phần khác */
    }

    .header-navbar img {
        height: 60px;
    }

    .navbar .nav-link,
    .navbar .navbar-brand,
    .navbar .dropdown-toggle {
        color: white !important;
    }

    .navbar .nav-link:hover,
    .navbar .dropdown-toggle:hover {
        color: orange !important;
    }

    .dropdown-menu {
        background-color: black !important;
        border: none;
        position: absolute;
        top: 100%; /* Đảm bảo menu con xuất hiện dưới mục dropdown */
        left: 0;
        width: auto;
        min-width: 200px; /* Đảm bảo chiều rộng menu con hợp lý */
        right: auto;
    }

    .dropdown-menu .dropdown-item {
        color: white !important;
    }

    .dropdown-menu .dropdown-item:hover {
        color: orange !important;
        background-color: transparent !important;
    }

    /* Input tìm kiếm */
    .search-form input {
        border-radius: 20px;
        padding: 5px 15px;
        border: none;
        outline: none;
    }
    .navbar .nav-link i:hover {
    color: orange;
}
    
</style>

<nav class="navbar navbar-expand-lg header-navbar">
  <div class="container-fluid d-flex align-items-center justify-content-between">

    <!-- Logo -->
    <a class="navbar-brand me-3" href="/J4Video/trang-chu">
      <img src="/J4Video/images/logonhac.png" alt="Logo">
    </a>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="/J4Video/trang-chu">Trang chủ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/J4Video/videos/list">Videos</a>
        </li>
        <c:if test="${sessionScope.user != null }">
          <li class="nav-item">
            <a class="nav-link" href="/J4Video/yeu-thich">Yêu thích</a>
          </li>
        </c:if>
        <li class="nav-item">
          <a class="nav-link" href="/J4Video/gioi-thieu">Giới thiệu</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/J4Video/lien-he">Liên hệ</a>
        </li>
      </ul>
    </div>

   <div class="d-flex align-items-center gap-3">
  <form class="d-flex search-form" action="/J4Video/tim-kiem" method="get">
    <input type="text" name="keyword" placeholder="Tìm kiếm video..." />
  </form>

  <div class="nav-item dropdown" id="menucon">
    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
      <i class="fas fa-user"></i>
    </a>
   <ul class="dropdown-menu dropdown-menu-end" >
  <c:if test="${sessionScope.user == null}">
    <li><a class="dropdown-item" href="/J4Video/dang-ky">Đăng ký</a></li>
    <li><a class="dropdown-item" href="/J4Video/dang-nhap">Đăng nhập</a></li>
    <li><a class="dropdown-item" href="/J4Video/quen-mat-khau">Quên mật khẩu</a></li>
  </c:if>

  <c:if test="${sessionScope.user != null}">
<c:if test="${sessionScope.user != null && sessionScope.user.admin}">

  <li><a class="dropdown-item" href="/J4Video/admin/video/list" id="quanly">Quản lý hệ thống</a></li>
</c:if>


    <li><a class="dropdown-item" href="/J4Video/user/list?action=changePassword&id=${sessionScope.user.id}">Đổi mật khẩu</a></li>
    <li><hr class="dropdown-divider"></li>
    <li><a class="dropdown-item" href="/J4Video/dang-xuat" id="testdangxuat">Đăng xuất</a></li>
  </c:if>
</ul>

  </div>
</div>


  </div>
</nav>
