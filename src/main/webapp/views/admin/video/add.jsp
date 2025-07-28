<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm mới Video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .sidebar {
            padding-left: 0;
            padding-right: 0;
            height: 100vh;
        }
        .content {
            padding-left: 20px;
        }
        .card-header {
            background-color: white;
            color: green;
        }
        .row {
            display: flex;
        }
        .col-md-3 {
            flex: 0 0 25%;
        }
        .col-md-9 {
            flex: 0 0 75%;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 sidebar bg-dark">
            <jsp:include page="/views/admin/menu.jsp"></jsp:include>
        </div>
        <div class="col-md-9 content mt-3">
            <div class="card">
                <div class="card-header text-center">
                    <h4>Thêm mới Video</h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty message}">
                        <div class="alert alert-danger">${message}</div>
                    </c:if>
                    <form action="/J4Video/admin/video/insert" method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="title" class="form-label">Tiêu đề</label>
                            <input type="text" class="form-control" id="title" name="title"
                                   value="${title}" placeholder="Tiêu đề">
                            <span class="text-danger" id="loide">${titleError}</span>
                        </div>
                        <div class="mb-3">
                            <label for="urlVideo" class="form-label">Link video</label>
                            <input type="text" class="form-control" id="urlVideo" name="urlVideo"
                                   value="${urlVideo}" placeholder="URL video">
                            <span class="text-danger" id="url">${urlVideoError}</span>
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Mô tả</label>
                            <textarea class="form-control" id="description" name="description" rows="3"
                                      placeholder="Mô tả video">${description}</textarea>
                            <span class="text-danger" id="mota">${descriptionError}</span>
                        </div>
                        <div class="mb-3">
                            <label for="poster" class="form-label">Ảnh đại diện</label>
                            <input type="file" class="form-control" id="poster" name="poster">
                            <span class="text-danger" id="posterne">${posterError}</span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Trạng thái</label><br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="active" id="active" value="true"
                                       <c:if test="${active == 'true' || active == null}">checked</c:if>>
                                <label class="form-check-label" for="active">Hoạt động</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="active" id="inactive" value="false"
                                       <c:if test="${active == 'false'}">checked</c:if>>
                                <label class="form-check-label" for="inactive">Không hoạt động</label>
                            </div>
                        </div>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary" id="addthem">Lưu</button>
                            <a href="/J4Video/admin/video/list" class="btn btn-secondary">Quay lại</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
