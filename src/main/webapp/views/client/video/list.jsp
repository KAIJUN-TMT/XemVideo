<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        /* Tạo khoảng cách giữa header và phần video */
        main {
            margin-top: 120px;
        }
    </style>
</head>
<body>

    <!-- ✅ Header tràn full màn hình, không có ảnh nền -->
    <jsp:include page="/views/client/header.jsp"></jsp:include>

    <main>
        <div class="container my-5">
            <div class="row">
                <c:forEach items="${list}" var="video">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4">
                        <div class="card h-100 d-flex flex-column">
                            <!-- ✅ Sửa đường dẫn ảnh để luôn đúng -->
                            <img src="${pageContext.request.contextPath}/images/${video.poster}" class="card-img-top"
                                style="width: 100%; height: 250px; object-fit: cover; ">
                            <div class="card-body d-flex flex-column justify-content-between">
                                <h5 class="card-title">${video.title}</h5>
                                <p class="card-text">${video.description}</p>
                                <div class="row g-2 mt-3">
                                    <div class="col-9">
                                        <a href="#" class="btn btn-primary w-100">Xem</a>
                                    </div>
                                    <div class="col-3">
                                        <a href="${pageContext.request.contextPath}/yeu-thich?id=${video.id}" class="btn btn-outline-danger w-100">
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

    <!-- ✅ Footer tràn full màn hình -->
    <jsp:include page="/views/client/footer.jsp"></jsp:include>

</body>
</html>
