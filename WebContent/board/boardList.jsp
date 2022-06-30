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
		width: 1000px; height:470px;
		margin: 30px auto 0px;
	}
	#content_form table tr { 
		height: 10px;
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
  });
</script>
  <link href="${conPath }/css/style.css" rel="stylesheet">
</head>
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
  <table>
	<tr>
	  <td>
		<c:if test="${not empty member }"><a href="${conPath }/boardWriteView.do">글쓰기</a></c:if>
		<c:if test="${empty member }"><a href="${conPath }/loginView.do">글쓰기는 사용자 로그인 이후에만 가능합니다</a></c:if>
	  </td>
    </tr>
  </table>
  <table>
      <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>날짜</th>
        <th>조회수</th>
      </tr>
  <c:if test="${boardCnt==0 }">
	  <tr>
	    <td colspan="5">등록된 글이 없습니다</td>
	  </tr>
  </c:if>
  <c:if test="${boardCnt!=0 }">
    <c:forEach items="${boardList }" var="board">
      <tr>
        <td>${board.bNum }</td>
        <td class="left">
          <c:forEach var="i" begin="1" end="${board.bIndent }">
			<c:if test="${i==board.bIndent }">└</c:if>
			<c:if test="${i!=board.bIndent }"> &nbsp; &nbsp; </c:if>
		  </c:forEach>
		  ${board.bTitle }
			<c:if test="${board.bHit > 10 }"><img src="${conPath }/img/hot.gif"></c:if>
        </td>
        <td>${board.mId }</td>
        <td><fmt:formatDate value="${board.bRdate }" type="date" dateStyle="short"/></td>
        <td>${board.bHit }</td>
      </tr>
    </c:forEach>
  </c:if>
  </table>
  <div class="paging">
    <c:if test="${startPage > BLOCKSIZE }">
	  [ <a href="${conPath }/boardList.do?pageNum=${startPage-1}"> 이전 </a> ]
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
	  <c:if test="${i == pageNum }">
	    <b> [ ${i } ] </b>
	  </c:if>
	  <c:if test="${i != pageNum }">
	  	[ <a href="${conPath }/boardList.do?pageNum=${i}"> ${i } </a> ]
	  </c:if>
	</c:forEach>
		<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/boardList.do?pageNum=${endPage+1}"> 다음 </a> ]
		</c:if>
	</div>
  </div>
</body>
</html>