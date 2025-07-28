<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Báo cáo thống kê video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .vh-100 {
            height: 100vh;
        }

        .sidebar {
            background-color: #212529;
            color: white;
            padding: 0;
        }

        .content-area {
            padding: 20px;
        }

        .card-header {
            background-color: #000;
            color: #ff6600;
        }

        .table thead th {
            background-color: #343a40;
            color: white;
        }

        .table tbody tr:hover {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row vh-100 g-0">
            <div class="col-md-3 sidebar">
                <jsp:include page="/views/admin/menu.jsp"></jsp:include>
            </div>
            <div class="col-md-9 content-area">
                <div class="card">
                    <div class="card-header text-center">
                        <h4>Báo cáo Thống kê Video</h4>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Tiêu đề Video</th>
                                    <th>Lượt xem</th>
                                    <th>Lượt thích</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${reportData}" varStatus="loop">
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td>${item[0]}</td>
                                        <td>${item[1]}</td>
                                        <td>${item[2]}</td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty reportData}">
                                    <tr>
                                        <td colspan="4" class="text-center">Không có dữ liệu thống kê.</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                        <a href="/J4Video/admin/video/list" class="btn btn-secondary">Quay lại danh sách video</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
