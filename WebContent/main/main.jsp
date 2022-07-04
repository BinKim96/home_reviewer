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
  <style>
	table {
	width:1000px; margin: 0 auto;
	border: 1px solid red;
	}
	td {text-align: center; padding: 5px 10px; border: 1px solid black;}
	a {color:black;}
  </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function(){
	  
  });
</script>
  <link href="${conPath }/css/style.css" rel="stylesheet">
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
  <div id="content_form">
  <table>
    <caption>최신영화</caption>
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
  	<caption>인기영화</caption>
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