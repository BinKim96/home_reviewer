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
  <link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
  <div id="content_form">
  <table>
  	<caption>${param.schmvTitle } 검색 결과</caption>
  	<tr>
  	  <c:set var="i" value="0"/>
      <c:forEach var="movie" items="${searchedMovies }">
        <td>
          <a href="${conPath }/movieContent.do?mvId=${movie.mvId }&mId=${member.mId }"><img src="${conPath }/moviePosterUp/${movie.mvPoster}" alt="포스터" width="300"></a>
          <p>${movie.mvTitle }(${movie.mvReleaseYear })</p>
          <p><img src="${conPath }/img/checkedLike.png" class="like" width="20px" height="20px">${movie.mlCnt }</p>
        </td>
        
        <c:if test="${i%3 == 2 and i!=8}">
        	<tr></tr>
        </c:if>
        <c:set var="i" value="${i+1 }"/>
      </c:forEach>
    </tr>
  </table>
  <div class="paging">
    <c:if test="${startPage>BLOCKSIZE }">
      <a href="${conPath }/movieSearchList.do?pageNum=1">&lt;&lt;</a>
      <a href="${conPath }/movieSearchList.do?pageNum=${startPage-1}">&lt;</a>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
	  <c:if test="${i == pageNum }">
		 [ <b>${i }</b> ]
	  </c:if>
	  <c:if test="${i != pageNum }">
		 [ <a href="${conPath }/movieSearchList.do?pageNum=${i}">${i }</a> ]
	  </c:if>
	</c:forEach>
	<c:if test="${endPage < pageCnt }">
	  <a href="${conPath }/movieSearchList.do?pageNum=${endPage+1}">&gt;</a>
	  <a href="${conPath }/movieSearchList.do.do?pageNum=${pageCnt}">&gt;&gt;</a>
	</c:if>
  </div>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>