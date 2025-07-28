<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<div class="bg-dark text-white vh-100 p-3">
    <h4 class="text-center mb-4"><i class="fas fa-user-shield text-white me-2"></i>Quản trị hệ thống</h4>
    <ul class="nav flex-column">
        <li class="nav-item mb-2">
            <a class="nav-link text-white" href="/J4Video/trang-chu">
                <i class="fas fa-home text-white me-2"></i>Trang chủ
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link text-white" href="/J4Video/admin/video/list">
                <i class="fas fa-video text-white me-2"></i>Quản lý Video
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link text-white" href="/J4Video/user/list" id="nguoidung">
                <i class="fas fa-users text-white me-2"></i>Quản lý Người dùng
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link text-white" href="/J4Video/admin/report">
                <i class="fas fa-chart-bar text-white me-2"></i>Báo cáo thống kê
            </a>
        </li>

        <li class="nav-item mt-3">
            <span class="text-uppercase text-secondary small">Tài khoản</span>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link text-white" href="#">
                <i class="fas fa-user-edit text-white me-2"></i>Cập nhật thông tin
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link text-white" href="#">
                <i class="fas fa-key text-white me-2"></i>Đổi mật khẩu
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link text-white" href="/J4Video/dang-xuat">
                <i class="fas fa-sign-out-alt text-white me-2"></i>Đăng xuất
            </a>
        </li>
    </ul>
</div>
