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
		width: 800px; height:400px;
		margin: 100px auto 0px;
	}
  </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function(){
	  
  });
</script>
<script>
  function fun(bNum, pageNum){
	  var answer = confirm('해당 글을 삭제하시겠습니까?');
	  if(answer == true) {
	    location.href = '${conPath}/boardDelete.do?bNum='+bNum+'&pageNum='+pageNum;
	  }
  }
</script>
  <link href="${conPath }/css//board/boardWrite.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
  
  <div class="board_wrap">
    <div class="board_title">
      <strong>${board.bNum }번 글 상세보기</strong>
    </div>
    <div class="board_view_wrap">
      <div class="board_view">
        <div class="title">
          ${board.bTitle }
        </div>
        <div class="info">
          <dl>
            <dt>번호</dt>
            <dd>${board.bNum }</dd>
          </dl>
          <dl>
            <dt>작성자</dt>
            <dd>${board.mId}</dd>
          </dl>
          <dl>
            <dt>작성일</dt>
            <dd>${board.bRdate}</dd>
          </dl>
        </div>
        <div class="cont">
        ${board.bContent}
        </div>
      </div>
      
      <div class="bt_wrap">
      
      <c:if test="${member.mId eq board.mId }">
	    <input type="button" value="수정" class="btn" onclick="location='${conPath}/boardModifyView.do?bNum=${board.bNum }&pageNum=${param.pageNum }'">
	  </c:if>
	  <c:if test="${member.mId eq board.mId or not empty admin}">
	    <input type="button" value="삭제" class="btn" onclick="fun(${board.bNum }, ${param.pageNum })">
	  </c:if>
	  <c:if test="${not empty member }">
	    <input type="button" value="답변" class="btn" onclick="location='${conPath}/boardReplyView.do?bNum=${board.bNum }&pageNum=${param.pageNum }'">
	  </c:if>
	  <input type="button" value="목록" class="btn" onclick="location='${conPath}/boardList.do?pageNum=${param.pageNum }'">
	  
      </div>
    </div>
  </div>
  
  <%-- <div id="content_form">
     <table>
       <caption>${board.bNum }글 상세보기</caption>
       <tr>
         <td>작성자</td>
	     <td>${board.mId}님</td>
	   </tr>
	   <tr>
	     <td>제목</td>
	     <td>${board.bTitle }</td>
	  </tr>
	   <tr>
	     <td>본문</td>
	     <td><pre>${board.bContent}</pre></td>
	   </tr>
	   <tr><td colspan="2">
	     <c:if test="${member.mId eq board.mId }">
	       <button onclick="location='${conPath}/boardModifyView.do?bNum=${board.bNum }&pageNum=${param.pageNum }'">수정</button>
	     </c:if>
	     <c:if test="${member.mId eq board.mId or not empty admin}">
		   <button onclick="location='${conPath}/boardDelete.do?bNum=${board.bNum }&pageNum=${param.pageNum }'">삭제</button>
		 </c:if>
		 <c:if test="${not empty member }">
	       <button onclick="location='${conPath}/boardReplyView.do?bNum=${board.bNum }&pageNum=${param.pageNum }'">답변</button>
		 </c:if>
		 <input type="button" value="목록" class="btn" onclick="location='${conPath}/boardList.do?pageNum=${param.pageNum }'">
	   </td>
     </table>
  </div> --%>
  
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>