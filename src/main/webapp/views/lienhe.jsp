<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Liên Hệ - MUSIC_HEART</title>
    
    <!-- Import Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <!-- Import Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        /* === GIỮ HEADER NỀN ĐEN NHƯ TRANG CHỦ === */
        .header-container {
            background-color: black;
        }

        /* === NAVBAR: NỀN ĐEN, CHỮ TRẮNG === */
        .navbar {
            background-color: black !important;
        }

        .navbar .nav-link,
        .navbar-brand {
            color: white !important;
        }

        .navbar .nav-link:hover {
            color: orange !important;
        }

        /* === DROPDOWN MENU === */
        .dropdown-menu {
            background-color: black !important;
            border: none;
        }

        .dropdown-menu .dropdown-item {
            color: white !important;
            background-color: transparent !important;
        }

        .dropdown-menu .dropdown-item:hover {
            color: orange !important;
        }

        /* === KHOẢNG CÁCH TRÁNH DÍNH HEADER === */
        .page-title {
            margin-top: 120px;
        }

        /* === FORM & INFO LIÊN HỆ === */
        .contact-container {
            padding: 50px 20px;
        }

        .contact-form, .contact-info {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .contact-info {
            background: #f8f9fa;
        }

        .contact-info i {
            font-size: 24px;
            color: #ffa500; /* Đổi màu xanh thành cam */
        }

        /* === MẠNG XÃ HỘI LIÊN KẾT === */
        .contact-info a {
            color: #ffa500; /* Đổi màu xanh thành cam */
        }

        .contact-info a:hover {
            color: #d85f00; /* Màu cam đậm hơn khi hover */
        }
  /* Màu cam nổi bật */
.title-orange {
    color: #ffa500;
    font-size: 2.5rem;
    animation: slideFade 1s ease-out forwards;
    opacity: 0;
}

/* Dòng phụ bên dưới cũng cam, không bóng */
.subtitle-orange {
    color: #ffa500;
    font-style: italic;
    font-size: 1.2rem;
    animation: slideFade 1.4s ease-out forwards;
    opacity: 0;
}

/* Hiệu ứng xuất hiện mượt mà */
@keyframes slideFade {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

        
    </style>
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<body>
    <div class="header-container">
        <jsp:include page="/views/client/header.jsp"></jsp:include>
    </div>
 <div class="container text-center page-title animated-title">
    <h2 class="fw-bold title-orange">Liên Hệ Với Chúng Tôi</h2>
    <p class="subtitle-orange">Hãy gửi tin nhắn, chúng tôi sẽ phản hồi sớm nhất có thể!</p>
</div>
    <div class="container contact-container">
        <div class="row">
            <!-- Form liên hệ -->
            <div class="col-md-6">
                <div class="contact-form">
                    <h4 class="fw-bold">Gửi tin nhắn</h4>
                    <form action="/J4Video/gui-lien-he" method="POST">
                        <div class="mb-3">
                            <label for="name" class="form-label">Họ và tên</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">Nội dung</label>
                            <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
                        </div>
                      <button type="submit" class="btn btn-warning w-100">Gửi tin nhắn</button>

                    </form>
                </div>
            </div>
            <div class="col-md-6">
                <div class="contact-info">
                    <h4 class="fw-bold">Thông Tin Liên Hệ</h4>
                    <p><i class="fas fa-map-marker-alt"></i> 123 Đường Âm Nhạc, Quận 1, TP.HCM</p>
                    <p><i class="fas fa-phone"></i> 0123 456 789</p>
                    <p><i class="fas fa-envelope"></i> support@musicheart.com</p>
                    <h5 class="fw-bold mt-4">Mạng Xã Hội</h5>
                    <a href="#" class="text-decoration-none me-3"><i class="fab fa-facebook fa-2x"></i></a>
                    <a href="#" class="text-decoration-none me-3"><i class="fab fa-youtube fa-2x"></i></a>
                    <a href="#" class="text-decoration-none"><i class="fab fa-instagram fa-2x"></i></a>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-4 mb-5">
        <div class="ratio ratio-16x9">
            <iframe 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.637988394515!2d106.6784495748592!3d10.762622089380197!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752fd3d82606df%3A0x95c9c3f32b9962ed!2zMTIzIMSQxrDhu51uZyBB4bq_biBOaOG6rWMsIFF14bqjbmcgMSwgVGjDoG5oIFBow7ogSOG7mWksIFZpZXRuYW0!5e0!3m2!1sen!2s!4v1645686343089!5m2!1sen!2s" 
                width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy">
            </iframe>
        </div>
    </div>
    <jsp:include page="/views/client/footer.jsp"></jsp:include>
</body>
</html>
