<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style></style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function(){
	  
  });
</script>
  <link href="${conPath }/css/main/main.css" rel="stylesheet">
</head>
<body>
  <c:if test="${not empty loginResult}">
	<script>alert('${loginResult }');</script>
  </c:if>
  <c:if test="${not empty loginErrorMsg}">
	<script>
	  alert('${loginErrorMsg }');
      history.back();
    </script>
  </c:if>
  
  <jsp:include page="../main/header.jsp"/>
  
  <%-- <div class="list_wrap">
    <ul>
      <li class="item">
        <table>
          <tr>
          <c:forEach var="movie" items="${lastMovies }">
            <td>
              <div class="image">
          		<a href="${conPath }/movieContent.do?mvId=${movie.mvId }&mId=${member.mId }"><img src="${conPath }/moviePosterUp/${movie.mvPoster}" alt="포스터" width="300px"></a>
          	  </div>
              <div class="cont">
                <strong>${movie.mvTitle } (${movie.mvReleaseYear }) ${movie.mlCnt }</strong><br>
                <p><img src="${conPath }/img/checkedLike.png" width="16px" height="16px"> ${movie.mlCnt }</p>
              </div>
            </td>
          </c:forEach>
          </tr>
        </table>
      </li>
    </ul>
  </div> --%>
  
  
  
  <div id="content">
    <table>
      <b>최신영화</b>
      <tr>
        <c:forEach var="movie" items="${lastMovies }">
          <td>
            <a href="${conPath }/movieContent.do?mvId=${movie.mvId }&mId=${member.mId}"><img src="${conPath }/moviePosterUp/${movie.mvPoster}" alt="포스터" width="300"></a>
            <p>${movie.mvTitle }(${movie.mvReleaseYear })</p>
            <p><img src="${conPath }/img/checkedLike.png" width="16px" height="16px">  ${movie.mlCnt }</p>
          </td>
        </c:forEach>
      </tr>
    </table>
  
    <table>
  	  <b>인기영화</b>
  	  <tr>
        <c:forEach var="movie" items="${popularMovies }">
          <td>
            <a href="${conPath }/movieContent.do?mvId=${movie.mvId }&mId=${member.mId}"><img src="${conPath }/moviePosterUp/${movie.mvPoster}" alt="포스터" width="300"></a>
            <p>${movie.mvTitle }(${movie.mvReleaseYear })</p>
            <p><img src="${conPath }/img/checkedLike.png" width="16px" height="16px">  ${movie.mlCnt }</p>
          </td>
        </c:forEach>
      </tr>
    </table>
  </div>
  
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>