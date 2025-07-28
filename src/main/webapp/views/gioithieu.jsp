<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới Thiệu - MUSIC_HEART</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        body {
            background-color: #121212;
            color: #f1f1f1;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .header-container {
            background-color: black;
        }

        .navbar {
            background-color: black !important;
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
        }

        .dropdown-menu .dropdown-item {
            color: white !important;
            background-color: transparent !important;
        }

        .dropdown-menu .dropdown-item:hover {
            color: orange !important;
            background-color: transparent !important;
        }

        .intro-container {
            margin-top: 120px;
            text-align: center;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .intro-container h1 {
            font-size: 3rem;
            font-weight: bold;
            color: #ffa500;
            margin-bottom: 10px;
        }

        .intro-container p {
            font-size: 1.2rem;
            color: #dddddd;
            max-width: 700px;
            margin: 0 auto;
        }

        .illustration {
            margin-top: 40px;
            text-align: center;
        }

        .illustration img {
            width: 80%;
            max-width: 700px;
            border-radius: 20px;
            box-shadow: 0 4px 16px rgba(255, 165, 0, 0.3);
        }

        .container.content {
            margin-top: 60px;
            background-color: #1e1e1e;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
        }

        .container.content h2 {
            color: #ffa500;
            margin-top: 30px;
            margin-bottom: 15px;
            font-size: 1.8rem;
            border-left: 5px solid #ffa500;
            padding-left: 15px;
        }

        .container.content p {
            line-height: 1.6;
            font-size: 1.1rem;
            color: #dddddd;
        }

        .container.content ul {
            padding-left: 20px;
            list-style: none;
        }

        .container.content ul li {
            margin-bottom: 10px;
            position: relative;
            padding-left: 30px;
        }

        .container.content ul li::before {
            content: "\f001";
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            left: 0;
            top: 0;
            color: #ffa500;
        }

        .fancy-intro {
            color: #ffa500;
            font-size: 1.5rem;
            font-style: italic;
            font-family: 'Segoe UI', cursive, sans-serif;
            text-align: center;
            opacity: 0;
            animation: fadeIn 2s ease-in-out forwards;
        }

        @keyframes fadeIn {
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

    <div class="intro-container">
        <h1><i class="fas fa-headphones-alt"></i> Chào mừng đến với <span style="color: white;">MUSIC_HEART</span></h1>
        <p class="fancy-intro" style="color: orange;">Nơi âm nhạc không chỉ được nghe mà còn được cảm nhận bằng hình ảnh!</p>
    </div>

    <div class="illustration">
        <img src="/J4Video/images/banner.png" alt="Logo">
    </div>

    <div class="container content mb-5">
        <h2><i class="fas fa-music"></i> Về chúng tôi</h2>
        <p>
            <strong>MUSIC_HEART</strong> là nền tảng video nghe nhạc trực tuyến, mang đến cho bạn kho video âm nhạc đa dạng từ các thể loại khác nhau – từ nhạc trẻ, pop, rock cho đến acoustic hay lo-fi chill.
            Giao diện thân thiện, tốc độ nhanh và trải nghiệm mượt mà chính là điều chúng tôi luôn hướng tới.
        </p>

        <ul style="color: #f1f1f1; font-size: 1.05rem;">
            <li>Xem video nhạc chất lượng cao</li>
            <li>Danh sách phát theo tâm trạng</li>
            <li>Gợi ý video theo sở thích cá nhân</li>
            <li>Tính năng yêu thích và chia sẻ video</li>
            <li>Giao diện giống YouTube, dễ sử dụng</li>
        </ul>

        <h2><i class="fas fa-heartbeat"></i> Hãy tận hưởng từng giai điệu</h2>
        <p>
            Đừng chỉ nghe – hãy xem và cảm nhận! <br>
            Khám phá ngay <strong>MUSIC_HEART</strong> để hành trình âm nhạc của bạn trở nên sống động hơn bao giờ hết.
        </p>
    </div>

    <jsp:include page="/views/client/footer.jsp"></jsp:include>
</body>

</html>
