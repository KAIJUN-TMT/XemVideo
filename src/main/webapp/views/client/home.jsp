<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Trang chủ</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

  <style>
    .card {
        border: none !important;
        box-shadow: none !important;
    }

    /* Giữ header cố định ở trên cùng */
    .header-container {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      z-index: 9999; /* Đảm bảo header luôn hiển thị phía trên */
      background-color: white;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Tạo bóng đổ cho header */
    }

    /* Tạo khoảng cách cho phần nội dung dưới header */
    main {
      padding-top: 100px; /* Khoảng cách cho phần nội dung không bị che khuất */
    }
  </style>

  <script>
    function toggleFavorite(videoId, element) {
        const user = ${sessionScope.user != null};

        if (!user) {
            alert("Bạn cần đăng nhập để yêu thích video.");
            window.location.href = '${pageContext.request.contextPath}/dang-nhap';
            return;
        }

        const isLiked = element.style.backgroundColor === 'red';

        if (!isLiked) {
            element.style.backgroundColor = 'red';
            element.style.color = 'white';
        } else {
            element.style.backgroundColor = '';
            element.style.color = '';
        }

        fetch('${pageContext.request.contextPath}/yeu-thich/them?id=' + videoId)
            .then(response => response.json())
            .then(data => {
                if (!data.liked) {
                    element.style.backgroundColor = '';
                    element.style.color = '';
                }
            })
            .catch(error => console.log('Error:', error));
    }
  </script>
</head>

<body>
    <div class="header-container mb-5">
        <jsp:include page="/views/client/header.jsp"></jsp:include>
    </div>

    <main>
        <div class="container">
            <div class="row">
                <c:forEach items="${list}" var="video">
                    <div class="col-md-4 col-sm-6 col-12 mb-4">
                        <div class="card" style="width: 100%; height: 100%; display: flex; flex-direction: column;">
                            <img src="./images/${video.poster}" class="card-img-top" style="width: 100%; height: 250px; object-fit: cover; border-radius: 10px;">
                            <div class="card-body d-flex flex-column justify-content-between">
                                <h5 class="card-title">${video.title}</h5>
                                <p class="card-text">${video.description}</p>

                                <div class="row g-2 align-items-center">
                                    <div class="col-9">
                                        <a href="/J4Video/chi-tiet?id=${video.id}" class="btn w-100" style="background-color: orange; color: white; border: none;">
                                            Xem
                                        </a>
                                    </div>
                                    <div class="col-3">
                                        <a href="javascript:void(0)" onclick="toggleFavorite(${video.id}, this)" class="btn btn-outline-danger w-100">
                                            <i class="fas fa-heart"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </main>

    <jsp:include page="/views/client/footer.jsp"></jsp:include>
</body>

</html>
