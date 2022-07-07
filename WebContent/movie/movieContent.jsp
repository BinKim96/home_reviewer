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
	  $('.write_btn').click(function(){
		  alert("리뷰 작성은 로그인 후에 가능합니다")
		  location.href='${conPath }/loginView.do';
	  });
	  $('.delete').click(function(){
		  var answer = confirm('해당 영화를 삭제하시겠습니까?');
		  if(answer == true) {
			  location.href="${conPath}/movieDelete.do?mvId=${movie.mvId }";
		  }
	  });
  });
</script>
<script>
  function fun(rbNum, mvId, pageNum){
	  var answer = confirm('해당 댓글을 삭제하시겠습니까?');
	  if(answer == true) {
	    location.href = '${conPath}/reviewBoardDelete.do?rbNum='+rbNum+'&mvId='+mvId+'&pageNum='+pageNum;
	  }
  }
</script>

  <link href="${conPath }/css/movie/movieContent.css" rel="stylesheet">
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
  <div id ="main_wrap">
  
  <div id="content_form">
    <div class="main_title">
      <h1>${movie.mvTitle }</h1>
    </div>
    
  <table class="content_table">
    <%-- <tr>
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
    </tr> --%>
  	<tr>
  	  <td rowspan="8"><img src="${conPath }/moviePosterUp/${movie.mvPoster}" alt="포스터" width="300"></td>
  	  <th>장르</th>
  	  <td colspan="5">${movie.gName }</td>
  	</tr>
  	<tr>
  	  <th>개봉일</th>
  	  <td colspan="5">${movie.mvReleaseDate }</td>
  	</tr>
  	<tr>
  	  <th>상영등급</th>
  	  <td colspan="5">${movie.grName }</td>
  	</tr>
  	<tr>
  	  <th>상영시간</th>
  	  <td colspan="5">${movie.mvRunningTime }</td>
  	</tr>
  	<tr>
  	  <th >감독</th>
  	  <td colspan="5">${movie.mvDirector }</td>
  	</tr>
  	<tr>
  	  <th>출연</th>
  	  <td colspan="5">${movie.mvCast }</td>
  	</tr>
  	<tr>
  	  <th>줄거리</th>
  	  <td colspan="5">${movie.mvContent }</td>
  	</tr>
  	<%-- <c:if test="${not empty admin }">
  	<tr>
  	  <td>
  	    <a href='${conPath}/movieModifyView.do?mvId=${movie.mvId }'><img src="${conPath }/img/edit.png" width="20px" height="20px" class="modify"></a>
  	    <a href='${conPath}/movieDelete.do?mvId=${movie.mvId }'><img src="${conPath }/img/bin.png" width="20px" height="20px" class="delete"></a>
  	    <input type="button" value="수정" class="btn" onclick="location.href='${conPath}/movieModifyView.do?mvId=${movie.mvId }'">
  	    <input type="button" value="삭제" class="btn" onclick="location.href='${conPath}/movieDelete.do?mvId=${movie.mvId }'">
  	  </td>
  	  <td colspan="2"></td>
  	</tr>
  	</c:if> --%>
  	
  	<c:if test="${not empty member }">
  	<tr>
  	  <th></th>
  	  <th class="like_title">좋아요</th>
  	  <td class="add">
  	    <c:if test="${likeCount eq 0}">
            <img src="${conPath }/img/unCheckedLike.png" class="like" width="20px" height="20px">  <!-- 안눌러진상태 -->
          </c:if>
          <c:if test="${likeCount eq 1}">
	        <img src="${conPath }/img/checkedLike.png" class="like" width="20px" height="20px"> <!-- 눌러진상태 -->
		  </c:if>
  	  </td>
  	  <th class="reserve_title" rowspan="7">찜하기</th>
  	  <td class="add" rowspan="7">
  	      <c:if test="${reserveCount eq 0}">
            <img src="${conPath }/img/unCheckedReserve.png" class="reserve" width="20px" height="20px">  <!-- 안눌러진상태 -->
          </c:if>
          <c:if test="${reserveCount eq 1}">
	        <img src="${conPath }/img/checkedReserve.png" class="reserve" width="20px" height="20px"> <!-- 눌러진상태 -->
		  </c:if>
  	  </td>
  	</tr>
  	</c:if>
  	
  	<c:if test="${not empty admin }">
  	<tr>
  	  <th></th>
  	  <th class="like_title">영화 수정</th>
  	  <td class="add">
  	    <a href='${conPath}/movieModifyView.do?mvId=${movie.mvId }'><img src="${conPath }/img/edit.png" width="20px" height="20px" class="modify"></a>
  	  </td>
  	  <th class="reserve_title" rowspan="7">영화 삭제</th>
  	  <td class="add" rowspan="7">
  	    <img src="${conPath }/img/bin.png" width="20px" height="20px" class="delete">
  	  </td>
  	</tr>
  	</c:if>
  </table>
  
  
  <div class="board_list_wrap">
    <%-- <c:if test="${empty member }">
      <div>
        <table>
        <tr>
          <td><a href="${conPath }/loginView.do">리뷰 작성은  로그인 이후에만 가능합니다</a></td>
        </tr>
      </table>
      </div>
    </c:if> --%>
    <c:if test="${not empty member or not empty admin}">
  	  <div>
        <table>
        <tr>
          <td></td>
        </tr>
      </table>
      </div>
    </c:if>
    
    <table class ="board_list">
      <caption>REVIEW 게시판</caption>
      <thead>
        <tr>
          <th class="tit">REVIEW</th>
          <th class="mId">글쓴이</th>
          <th class="date">작성일</th>
        </tr>
      </thead>
      <tbody>
      <c:if test="${(empty member and not empty admin) or (empty member and empty admin)}">
        <c:if test="${reviewList.size() eq 0 }">
          <tr>
		    <td colspan="3">등록된 후기가 없습니다 </td>
	      </tr>
        </c:if>
      </c:if>
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
		  	<td class="tit">
		  		${review.rbContent }
			</td>
		  	<td class="mId">${review.mId }</td>
		  	<td class="date"><fmt:formatDate value="${review.rbRdate }" type="date" dateStyle="short"/></td>
		  <c:if test="${(not empty member and empty admin) and (member.mId eq review.mId) }">
		    <td ><a href='${conPath}/reviewModifyView.do?rbNum=${review.rbNum}&rbContent=${review.rbContent}&mId=${member.mId }&mvId=${review.mvId }&pageNum=${pageNum}'><img src="${conPath }/img/edit.png" width="20px" height="20px" class="modify"></a></td>
		  </c:if>
		  <c:if test="${(empty member and not empty admin) or (member.mId eq review.mId)}">
		    <td>
		      <img src="${conPath }/img/bin.png" width="20px" height="20px" class="delete_review" onclick="fun(${review.rbNum}, ${review.mvId}, ${pageNum})">
		    </td>
		  </c:if>
		  </tr>
        </c:forEach>
      </c:if>
      </tbody>
    </table>
    
    <c:if test="${empty member and empty admin }">
	  <div class="write_btn">
	    <button><img src="${conPath }/img/write.png" alt="글쓰기" width="50" height="50"></button>
	  </div>
	</c:if>
    
    <div class="paging">
  
      <c:if test="${startPage > BLOCKSIZE }">
	    <a href="${conPath }/movieContent.do?pageNum=${startPage-1}&mId=${member.mId }&mvId=${movie.mvId }" class="btn"> 이전 </a>
	  </c:if>
	  <c:forEach var="i" begin="${startPage }" end="${endPage }">
	    <c:if test="${i == pageNum }">
		  <a class="num">${i } </a>
	    </c:if>
	  <c:if test="${i != pageNum }">
		<a href="${conPath }/movieContent.do?pageNum=${i}&mId=${member.mId }&mvId=${movie.mvId }" class="num"> ${i } </a> ]
	  </c:if>
	</c:forEach>
	
    <c:if test="${endPage<pageCnt }">
		<a href="${conPath }/movieContent.do?pageNum=${endPage+1}&mId=${member.mId }&mvId=${movie.mvId }" class="btn"> 다음 </a> ]
	</c:if>
	
    </div>
  <c:if test="${not empty member and empty admin }">
    <form action="${conPath }/reviewBoardWrite.do" >
      <input type="hidden" name="mvId" value="${movie.mvId }">
      <input type="hidden" name="mId" value="${member.mId }">
      <table class="write_form">
        <caption>한줄평 남기기</caption>
        <c:if test="${not empty member }">
	      <tr>
	        <td>
	          <textarea rows="2" cols="120" name="rbContent"></textarea>
	          <button type="submit"><img src="${conPath }/img/feedback.png" alt="리뷰작성" width="60" height="60"></button>
	            <!-- <input type="submit" value="댓글달기"> -->
	          
	        </td>
	      </tr>
        </c:if>
      </table>
    </form>
  </c:if>
  
  </div> <!-- board_list_wrap -->
  <%-- <table>
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
		  <c:if test="${member.mId eq review.mId }">
		    <td><a href='${conPath}/reviewModifyView.do?rbNum=${review.rbNum}&mvId=${review.mvId}'><img src="${conPath }/img/edit.png" width="20px" height="20px" class="modify"></a></td>
		  </c:if>
		  <c:if test="${(empty member and not empty admin) or (member.mId eq review.mId)}">
		    <td><a href='${conPath}/reviewBoardDelete.do?rbNum=${review.rbNum}&mvId=${review.mvId}&pageNum=${pageNum}'><img src="${conPath }/img/bin.png" width="20px" height="20px" class="delete"></a></td>
		  </c:if>
		  <c:if test="${member.mId eq review.mId }">
		    <td><a href='${conPath}/reviewBoardDelete.do?rbNum=${review.rbNum}&mvId=${review.mvId}'><img src="${conPath }/img/bin.png" width="20px" height="20px" class="delete"></a></td>
		  </c:if>
		</tr>
	  </c:forEach>
	</c:if>
  </table> --%>
  
  
  </div>
  
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>