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
    .card-img-top {
        max-height: 250px;
        object-fit: cover;
    }
</style>

</head>
<body>
    <jsp:include page="/views/client/header.jsp"></jsp:include>
   <main class="container my-4" style="padding-top: 30px;">

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-5 g-4" style="margin: 50px 0px">
            <c:forEach items="${list}" var="video">
                <div class="col">
                    <div class="card h-100 d-flex flex-column">
                        <img src="./images/${video.poster}" class="card-img-top" alt="${video.title}">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">${video.title}</h5>
                            <p class="card-text">${video.description}</p>
                            <div class="mt-auto">
                                <a href="/J4Video/bo-yeu-thich?id=${video.id}" class="btn btn-danger w-100">Bỏ yêu thích</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>
    <jsp:include page="/views/client/footer.jsp"></jsp:include>

</body>
</html>
