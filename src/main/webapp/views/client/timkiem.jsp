<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/views/client/header.jsp"/>

<div class="container mt-5">
  <h3>Kết quả tìm kiếm: "<c:out value="${keyword}"/>"</h3>
  <hr>
  
  <c:choose>
    <c:when test="${not empty videos}">
      <div class="row">
        <c:forEach var="v" items="${videos}">
          <div class="col-md-3 mb-4">
            <a href="/J4Video/chi-tiet?id=${v.id}" class="text-decoration-none text-dark">
              <div class="card h-100">
                <img src="./images/${v.poster}" class="card-img-top" alt="${v.title}" style="height: 180px; object-fit: cover;">
                <div class="card-body">
                  <h5 class="card-title">${v.title}</h5>
                  <p class="card-text">${v.views} lượt xem</p>
                </div>
              </div>
            </a>
          </div>
        </c:forEach>
      </div>
    </c:when>
    <c:otherwise>
      <div class="alert alert-warning">Không tìm thấy video nào phù hợp.</div>
    </c:otherwise>
  </c:choose>
</div>

<jsp:include page="/views/client/footer.jsp"/>
