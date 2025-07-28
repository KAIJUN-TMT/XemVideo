<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${video.title}</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <style>
    body {
      background-color: #f9f9f9;
      font-family: Arial, sans-serif;
    }
    .video-container {
      max-width: 1200px;
      margin: auto;
      padding: 20px;
      display: flex;
      gap: 20px;
    }
    .video-main {
      flex: 7;
    }
    .video-sidebar {
      flex: 3;
      display: flex;
      flex-direction: column;
      gap: 20px;
      max-height: 600px;
      overflow-y: auto;
    }
    .video-player {
      width: 100%;
      height: 600px;
      background-color: black;
      border-radius: 10px;
      overflow: hidden;
    }
    .video-title {
      font-size: 1.7rem;
      font-weight: bold;
      margin-top: 15px;
    }
    .video-description {
      margin-top: 10px;
      color: #555;
    }
    .actions {
      margin-top: 15px;
    }
    .video-card {
      display: flex;
      gap: 15px;
      cursor: pointer;
      text-decoration: none;
      color: black;
      padding: 8px;
      border-radius: 8px;
      transition: background-color 0.2s ease;
      align-items: center;
    }
    .video-card:hover {
      background-color: #f0f0f0;
    }
    .video-card img {
      width: 140px;
      height: 80px;
      object-fit: cover;
      border-radius: 8px;
      flex-shrink: 0;
    }
    .video-card .info {
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
    .video-card-title {
      font-weight: bold;
      font-size: 1.1rem;
      margin-bottom: 4px;
    }
    .video-views {
      font-size: 0.9rem;
      color: gray;
    }
  </style>
</head>
<body>

  <jsp:include page="/views/client/header.jsp" />

  <div class="video-container" style="margin-top: 100px">

    <div class="video-main">
      <c:set var="videoId" value="${video.urlVideo}" />

      <c:if test="${fn:contains(video.urlVideo, 'v=')}">
        <c:set var="tempId" value="${fn:split(video.urlVideo, 'v=')[1]}" />
        <c:set var="videoId" value="${fn:split(tempId, '&')[0]}" />
      </c:if>

      <c:if test="${fn:contains(video.urlVideo, 'youtu.be/')}">
        <c:set var="tempId" value="${fn:split(video.urlVideo, 'youtu.be/')[1]}" />
        <c:set var="videoId" value="${fn:split(tempId, '?')[0]}" />
      </c:if>

      <c:if test="${fn:contains(video.urlVideo, 'embed/')}">
        <c:set var="tempId" value="${fn:split(video.urlVideo, 'embed/')[1]}" />
        <c:set var="videoId" value="${fn:split(tempId, '?')[0]}" />
      </c:if>

      <div class="video-player">
        <iframe 
          width="100%" 
          height="100%" 
          src="https://www.youtube.com/embed/${videoId}" 
          title="${video.title}" 
          frameborder="0" 
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
          allowfullscreen>
        </iframe>
      </div>
      <div class="video-title">${video.title}</div>
      <div class="video-description">${video.description}</div>
      <div class="actions">
        <a href="/J4Video/yeu-thich?id=${video.id}" class="btn btn-outline-danger btn-like">
          <i class="fas fa-heart"></i> Yêu thích
        </a>
        <a href="/J4Video" class="btn btn-secondary">← Quay lại</a>
      </div>

    </div>
    <div class="video-sidebar">
      <c:forEach var="v" items="${videos}">
        <c:if test="${v.id != video.id}">
          <a href="/J4Video/chi-tiet?id=${v.id}" class="video-card">
            <img src="./images/${v.poster}" alt="${v.title}">
            <div class="info">
              <div class="video-card-title">${v.title}</div>
              <div class="video-views">${v.views} lượt xem</div>
            </div>
          </a>
        </c:if>
      </c:forEach>
    </div>

  </div>

  <jsp:include page="/views/client/footer.jsp" />
</body>
</html>
