<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập nhật Video</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!-- Cột menu (25%) -->
			<div class="col-md-3 bg-light min-vh-100">
				<jsp:include page="/views/admin/menu.jsp"></jsp:include>
			</div>

			<!-- Cột form chỉnh sửa (75%) -->
			<div class="col-md-9">
				<main>
					<div class="card mt-4">
						<div class="card-header">
							<h3 class="text-center text-success">Cập nhật Video</h3>
						</div>
						<div class="card-body">
							<label class="text-danger">${message}</label>
							<form action="/J4Video/admin/video/update" method="post" enctype="multipart/form-data">

    <!-- Tiêu đề -->
    <div class="mb-3">
        <label for="title" class="form-label">Tiêu đề</label>
        <input type="text" class="form-control" id="title" name="title" value="${video.title}">
        <span class="text-danger" id="titleer">${titleError}</span>
    </div>

    <input type="hidden" class="form-control" id="id" name="id" value="${video.id}">
    <input type="hidden" name="posterCurrent" value="${video.poster}">

    <!-- Link video -->
    <div class="mb-3">
        <label for="urlVideo" class="form-label">Link video</label>
        <input type="text" class="form-control" id="urlVideo" name="urlVideo" value="${video.urlVideo}">
        <span class="text-danger" id="urlvdio">${urlVideoError}</span>
    </div>

    <!-- Mô tả -->
    <div class="mb-3">
        <label for="description" class="form-label">Mô tả</label>
        <textarea class="form-control" id="description" name="description" rows="3">${video.description}</textarea>
        <span class="text-danger" id="mota">${descriptionError}</span>
    </div>

    <!-- Ảnh đại diện -->
    <div class="mb-3">
        <label for="poster" class="form-label">Ảnh đại diện</label><br>
        <img alt="poster" src="/J4Video/images/${video.poster}" width="100" height="100" class="mb-2 border">
        <input type="file" class="form-control" id="poster" name="poster">
        <span class="text-danger" id="posterError">${posterError}</span>
    </div>

    <!-- Trạng thái -->
    <div class="mb-3">
        <label class="form-label">Trạng thái</label><br>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="active" id="active" value="true" ${video.active?'checked':''}>
            <label class="form-check-label" for="active">Hoạt động</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="active" id="active2" value="false" ${!video.active?'checked':''}>
            <label class="form-check-label" for="active2">Không hoạt động</label>
        </div>
        <br>
        <span class="text-danger">${activeError}</span>
    </div>

    <!-- Nút -->
    <div class="mb-3">
        <button type="submit" class="btn btn-primary" id="luumoi">Lưu</button>
        <a href="/J4Video/admin/video/list" class="btn btn-secondary">Quay lại</a>
    </div>
</form>

						</div>
					</div>
				</main>
			</div>
		</div>
	</div>
</body>
</html>
