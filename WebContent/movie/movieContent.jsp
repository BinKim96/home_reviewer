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
	  $('.like').click(function(){
		  var likeNum = Number('${likeCount }');
		  if(likeNum==0){
			  $(this).attr('src', 'img/checkedLike.png');
			  location.href='${conPath}/movieLikeInsert.do?mId='+'${member.mId}&mvId='+'${movie.mvId}';
		  }else if(likeNum ==1){
			  likeNum=0;
			  $(this).attr('src', 'img/unCheckedLike.png');
			  location.href='${conPath}/movieLikeDelete.do?mId='+'${member.mId}&mvId='+'${movie.mvId}';
		  }
	  });
	  $('.reserve').click(function(){
		  var likeNum = Number('${reserveCount }');
		  if(likeNum==0){
			  $(this).attr('src', 'img/checkedReserve.png');
			  location.href='${conPath}/movieReserveInsert.do?mId='+'${member.mId}&mvId='+'${movie.mvId}';
		  }else if(likeNum ==1){
			  likeNum=0;
			  $(this).attr('src', 'img/unCheckedReserve.png');
			  location.href='${conPath}/movieReserveDelete.do?mId='+'${member.mId}&mvId='+'${movie.mvId}';
		  }
	  });
	  
	  
  });
</script>
  <link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
  <c:if test="${not empty reviewWriteResult}">
	<script>alert('${reviewWriteResult }');</script>
  </c:if>
  <c:if test="${not empty reviewWriteError}">
	<script>alert('${reviewWriteError }');</script>
  </c:if>
  <c:if test="${not empty reviewBoardMoifyResult}">
	<script>alert('${reviewBoardMoifyResult }');</script>
  </c:if>
  <c:if test="${not empty reviewBoardMoifyErrorMsg}">
	<script>alert('${reviewBoardMoifyErrorMsg }');</script>
  </c:if>
  <c:if test="${not empty reviewBoardDeleteResult}">
	<script>alert('${reviewBoardDeleteResult }');</script>
  </c:if>
  <c:if test="${not empty reviewBoardDeleteErrorMsg}">
	<script>alert('${reviewBoardDeleteErrorMsg }');</script>
  </c:if>
  
  <jsp:include page="../main/header.jsp"/>
  <div id="content_form">
  <table>
    <tr>
      <th colspan="3">${movie.mvTitle }(${movie.mvReleaseYear })
        <c:if test="${not empty member }">
          <c:if test="${likeCount eq 0}">
            <img src="${conPath }/img/unCheckedLike.png" class="like" width="20px" height="20px">  <!-- 안눌러진상태 -->
          </c:if>
          <c:if test="${likeCount eq 1}">
	        <img src="${conPath }/img/checkedLike.png" class="like" width="20px" height="20px"> <!-- 눌러진상태 -->
		  </c:if>
		  <c:if test="${reserveCount eq 0}">
            <img src="${conPath }/img/unCheckedReserve.png" class="reserve" width="20px" height="20px">  <!-- 안눌러진상태 -->
          </c:if>
          <c:if test="${reserveCount eq 1}">
	        <img src="${conPath }/img/checkedReserve.png" class="reserve" width="20px" height="20px"> <!-- 눌러진상태 -->
		  </c:if>
        </c:if> 
      </th>
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
  	<c:if test="${not empty admin }">
  	<tr>
  	  <td>
  	    <a href='${conPath}/movieModifyView.do?mvId=${movie.mvId }'><img src="${conPath }/img/edit.png" width="20px" height="20px" class="modify"></a>
  	    <a href='${conPath}/movieDelete.do?mvId=${movie.mvId }'><img src="${conPath }/img/bin.png" width="20px" height="20px" class="delete"></a>
  	    <%-- <input type="button" value="수정" class="btn" onclick="location.href='${conPath}/movieModifyView.do?mvId=${movie.mvId }'">
  	    <input type="button" value="삭제" class="btn" onclick="location.href='${conPath}/movieDelete.do?mvId=${movie.mvId }'">  --%>
  	  </td>
  	  <td colspan="2"></td>
  	</tr>
  	</c:if>
  </table>
  <table>
	<tr>
	  <th>한줄평</th>
	  <th>작성자아이디</th>
	  <th>글쓴날짜</th>
	</tr>
	<c:if test="${not empty member and empty admin }">
	  <c:if test="${reviewList.size() eq 0 }">
	    <tr>
		  <td colspan="3">등록된 후기가 없습니다 첫 후기를 남겨주세요!</td>
	    </tr>
	  </c:if>
	</c:if>
	<c:if test="${reviewList.size() != 0 }">
	  <c:forEach var="review" items="${reviewList }" >
		<tr>
		  <td>${review.rbContent }</td>
		  <td>${review.mId }</td>
		  <td><fmt:formatDate value="${review.rbRdate }" type="date" dateStyle="short"/></td>
		  <c:if test="${(not empty member and empty admin) and (member.mId eq review.mId) }">
		    <td><a href='${conPath}/reviewModifyView.do?rbNum=${review.rbNum}&rbContent=${review.rbContent}&mId=${member.mId }&mvId=${review.mvId }&pageNum=${pageNum}'><img src="${conPath }/img/edit.png" width="20px" height="20px" class="modify"></a></td>
		  </c:if>
		  <%-- <c:if test="${member.mId eq review.mId }">
		    <td><a href='${conPath}/reviewModifyView.do?rbNum=${review.rbNum}&mvId=${review.mvId}'><img src="${conPath }/img/edit.png" width="20px" height="20px" class="modify"></a></td>
		  </c:if> --%>
		  <c:if test="${(empty member and not empty admin) or (member.mId eq review.mId)}">
		    <td><a href='${conPath}/reviewBoardDelete.do?rbNum=${review.rbNum}&mvId=${review.mvId}&pageNum=${pageNum}'><img src="${conPath }/img/bin.png" width="20px" height="20px" class="delete"></a></td>
		  </c:if>
		  <%-- <c:if test="${member.mId eq review.mId }">
		    <td><a href='${conPath}/reviewBoardDelete.do?rbNum=${review.rbNum}&mvId=${review.mvId}'><img src="${conPath }/img/bin.png" width="20px" height="20px" class="delete"></a></td>
		  </c:if> --%>
		</tr>
	  </c:forEach>
	</c:if>
  </table>
  
  <div class="paging">
    <c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/movieContent.do?pageNum=${startPage-1}&mId=${member.mId }&mvId=${movie.mvId }"> 이전 </a> ]
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
	  <c:if test="${i == pageNum }">
		<b> [ ${i } ] </b>
	  </c:if>
	  <c:if test="${i != pageNum }">
		[ <a href="${conPath }/movieContent.do?pageNum=${i}&mId=${member.mId }&mvId=${movie.mvId }"> ${i } </a> ]
	  </c:if>
	</c:forEach>
    <c:if test="${endPage<pageCnt }">
		[ <a href="${conPath }/movieContent.do?pageNum=${endPage+1}&mId=${member.mId }&mvId=${movie.mvId }"> 다음 </a> ]
	</c:if>
  </div>
  
  <c:if test="${not empty member and empty admin }">
    <form action="${conPath }/reviewBoardWrite.do">
      <input type="hidden" name="mvId" value="${movie.mvId }">
      <input type="hidden" name="mId" value="${member.mId }">
      <table>
        <caption>한줄평 남기기</caption>
        <c:if test="${not empty member }">
	      <tr>
	        <td>
	          <textarea rows="2" cols="120" name="rbContent"></textarea>
	          <input type="submit" value="댓글달기">
	        </td>
	      </tr>
        </c:if>
        <c:if test="${empty member }"><tr><td><a href="${conPath }/loginView.do">리뷰 작성은  로그인 이후에만 가능합니다</a></td></tr></c:if>
      </table>
    </form>
  </c:if>
  </div>
  <jsp:include page="../main/footer.jsp"/>s
</body>
</html>