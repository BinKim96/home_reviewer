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
  	.write_btn {
  		margin-top: 10px;
  		text-align: right;
  	}
  	.write_btn button {
  		width: 35px;
  		height: 35px;
  		border: none;
  		background-color: white;
  	}
  	.write_btn2 {
  		margin-top: 10px;
  		text-align: right;
  	}
  	.write_btn2 button {
  		width: 35px;
  		height: 35px;
  		border: none;
  		background-color: white;
  	}
  </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function(){
	  $('tr').click(function(){
		  var bNum = Number($(this).children().eq(0).text());
		  if(!isNaN(bNum)){
			location.href = '${conPath}/boardContent.do?bNum='+bNum+'&pageNum=${pageNum}';
		  }
	  });
	  $('.write_btn2').click(function(){
		  alert("글 작성은 로그인 후에 가능합니다")
		  location.href='${conPath }/loginView.do';
	  });
  });
</script>
  <link href="${conPath }/css/board/board.css" rel="stylesheet">
</head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Concert+One&family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
<body>
  <c:set var="SUCCESS" value="1"/>
  <c:set var="FAIL" value="0"/>
  <c:if test="${boardWriteResult eq SUCCESS}">
	<script>alert('글쓰기 성공');</script>
  </c:if>
  <c:if test="${boardWriteResult eq FAIL}">
	<script>alert('글쓰기 실패');</script>
  </c:if>
  <c:if test="${boardDeleteResult eq SUCCESS}">
	<script>alert('글삭제 성공');</script>
  </c:if>
  <c:if test="${boardDeleteResult eq FAIL}">
	<script>alert('글삭제 실패');</script>
  </c:if>
  <c:if test="${boardMoifyResult eq SUCCESS}">
	<script>alert('글수정 성공');</script>
  </c:if>
  <c:if test="${boardMoifyResult eq FAIL}">
	<script>alert('글수정 실패');</script>
  </c:if>
  <c:if test="${boardReplyResult eq SUCCESS}">
	<script>alert('답글쓰기 성공');</script>
  </c:if>
  <c:if test="${boardReplyResult eq FAIL}">
	<script>alert('답글쓰기 실패');</script>
  </c:if>
  <jsp:include page="../main/header.jsp"/>
  <div id="content_form">
  
  <%-- <table>
	<tr>
	  <td>
		<c:if test="${not empty member and empty admin}">
		  <a href="${conPath }/boardWriteView.do">글쓰기</a>
		</c:if>
		<c:if test="${empty member and empty admin }">
	      <a href="${conPath }/loginView.do">글쓰기는 로그인 이후에만 가능합니다</a>
		</c:if>
		<c:if test="${empty member and not empty admin }">
		  <p>자유게시판</p>
		</c:if>
	  </td>
    </tr>
  </table> --%>
  
  <div class="board_list_wrap">
    <div class="main_title"><h1>FREE BOARD</h1></div>
    <table class ="board_list">
      <caption>게시판 목록</caption>
      <thead>
        <tr>
          <th>번호</th>
          <th>제목</th>
          <th>글쓴이</th>
          <th>작성일</th>
          <th>조회수</th>
        </tr>
      </thead>
      <tbody>
      <c:if test="${totCnt==0 }">
	    <tr>
	      <td colspan="5">등록된 글이 없습니다</td>
	    </tr>
      </c:if>
      <c:if test="${totCnt!=0 }">
        <c:forEach items="${boardList }" var="board">
          <tr>
            <td>${board.bNum }</td>
            <td class="tit">
              <c:forEach var="i" begin="1" end="${board.bIndent }">
              <c:if test="${i==board.bIndent }"><img src="${conPath }/img/arrow-right.png" width="15" height="15"></c:if>
              <c:if test="${i!=board.bIndent }"> &nbsp; &nbsp; </c:if>
              </c:forEach>
              ${board.bTitle }
              <c:if test="${board.bHit > 10 }"><img src="${conPath }/img/hot.png" width="20" height="20"></c:if>
            </td>
            <td>${board.mId }</td>
            <td><fmt:formatDate value="${board.bRdate }" type="date" dateStyle="short"/></td>
            <td>${board.bHit }</td>
          </tr>
        </c:forEach>
      </c:if>  
      </tbody>
    </table>
	
	<c:if test="${not empty member and empty admin}">
	  <div class="write_btn">
		<button onclick="location.href='${conPath }/boardWriteView.do'"><img src="${conPath }/img/write.png" alt="글쓰기" width="25" height="25"></button>
	  </div>
	</c:if>
	<c:if test="${empty member and empty admin }">
	  <div class="write_btn2">
	    <button><img src="${conPath }/img/write.png" alt="글쓰기" width="25" height="25"></button>
	  </div>
	</c:if>
    
    <div class="paging">
				<%-- <a href="${conPath }/boardList.do?pageNum=1" class="btn">첫페이지</a> --%>
        
      <c:if test="${startPage > BLOCKSIZE }">
	  	<a href="${conPath }/boardList.do?pageNum=${startPage-1}" class="btn"> 이전 </a>
	  </c:if>
	  
	  <c:forEach var="i" begin="${startPage }" end="${endPage }">
	    <c:if test="${i eq pageNum }">
	   		<a class="num">${i }</a>
	    </c:if>
	    <c:if test="${i != pageNum }">
	  	  <a href="${conPath }/boardList.do?pageNum=${i}" class="num"> ${i } </a>
	    </c:if>
	  </c:forEach>
	  
	  <c:if test="${endPage<pageCnt }">
		  <a href="${conPath }/boardList.do?pageNum=${endPage+1}" class="btn"> 다음 </a>
	  </c:if>
	  
	  <%-- <a href="${conPath }/boardList.do?pageNum=${pageCnt }" class="btn">끝페이지</a> --%>
    </div>
  </div>
  
  </div>
  
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>