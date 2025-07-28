<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách Video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
        }
        .menu-left {
            width: 25%;
            background-color: #000;
            color: white;
            min-height: 100vh;
        }
        .content-right {
            width: 75%;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="d-flex">
        <div class="menu-left">
            <jsp:include page="/views/admin/menu.jsp"></jsp:include>
        </div>
        <div class="content-right">
            <div class="card">
                <div class="card-header">
                    <h3 class="text-center text-success">Danh sách Video</h3>
                </div>
                <div class="card-body">
                    <a href="/J4Video/admin/video/add" class="btn btn-primary mb-3" id="themvd">Thêm mới</a>
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Ảnh</th>
                                <th scope="col">Tiêu đề</th>
                                <th scope="col">Lượt xem</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col" width="15%">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="video">
                                <tr>
                                    <th scope="row">${video.id}</th>
                                    <td>
                                        <img src="/J4Video/images/${video.poster}" width="50" height="50" alt="">
                                    </td>
                                    <td>${video.title}</td>
                                    <td>${video.views}</td>
                                    <td>${video.active ? 'Hoạt động' : 'Tắt'}</td>
                                    <td>
                                        <a href="/J4Video/admin/video/edit?id=${video.id}" class="btn btn-warning btn-sm" id="sua">Sửa</a>
                                        <a href="/J4Video/admin/video/delete?id=${video.id}" class="btn btn-danger btn-sm" id="xoa" onclick="return confirm('Bạn có chắc muốn xoá video này không?');">Xoá</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
