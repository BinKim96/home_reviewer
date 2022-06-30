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
    #content_form {
		width: 1200px; height:600px;
		margin: 100px auto 0px;
	}
	tr th:nth-child(2), tr th:nth-child(2) {
	 width : 200px;
}
  </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function(){
	  
  });
</script>
  <link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
  <div id="content_form">
  <table>
    <tr>
      <th colspan="3">${movie.mvTitle }(${movie.mvReleaseYear })</th>
    </tr>
  	<tr>
  	  <td rowspan="7"><img src="${conPath }/moviePosterUp/${movie.mvPoster}" alt="포스터" width="300"></td>
  	  <th>장르</th>
  	  <td>${movie.gName }</td>
  	</tr>
  	<tr>
  	  <th>개봉일</th>
  	  <td>${movie.mvReleaseDate }</td>
  	</tr>
  	<tr>
  	  <th>상영등급</th>
  	  <td>${movie.grName }</td>
  	</tr>
  	<tr>
  	  <th>상영시간</th>
  	  <td>${movie.mvRunningTime }</td>
  	</tr>
  	<tr>
  	  <th>감독</th>
  	  <td>${movie.mvDirector }</td>
  	</tr>
  	<tr>
  	  <th>출연</th>
  	  <td>${movie.mvCast }</td>
  	</tr>
  	<tr>
  	  <th>줄거리</th>
  	  <td>${movie.mvContent }</td>
  	</tr>
  </table>
  </div>
</body>
</html>