<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách người dùng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body, html {
            margin: 0;
            padding: 0;
        }
        .menu-left {
            width: 25%;
            min-height: 100vh;
            padding: 0;
        }
        .content-right {
            width: 75%;
            padding: 30px;
        }
    </style>
</head>
<body>
    <div class="d-flex">
        <div class="menu-left">
            <jsp:include page="/views/admin/menu.jsp"></jsp:include>
        </div>
        <div class="content-right">
            <h2 class="mb-4">Danh sách người dùng</h2>
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Email</th>
                        <th>Họ tên</th>
                        <th>Quyền Admin</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.email}</td>
                            <td>${user.fullName}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.email == 'admin@gmail.com'}">✔️</c:when>
                                    <c:otherwise>❌</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <div class="d-flex gap-2">
                                    <c:if test="${user.email != 'admin@gmail.com'}">
                                        <a href="list?action=delete&id=${user.id}" class="btn btn-danger btn-sm"
                                           onclick="return confirm('Bạn có chắc muốn xoá tài khoản này không?');">Xoá</a>

                                        <c:choose>
                                            <c:when test="${user.status}">
                                                <a href="list?action=lock&id=${user.id}" class="btn btn-warning btn-sm">Khoá</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="list?action=unlock&id=${user.id}" class="btn btn-success btn-sm">Mở</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                    <c:if test="${user.email == 'admin@gmail.com'}">
                                        <span class="text-muted fst-italic">Tài khoản quản trị</span>
                                    </c:if>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
