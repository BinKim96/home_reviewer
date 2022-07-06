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
  <link href="${conPath }/css/board/boardWrite.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
  
  <form action="${conPath }/boardWrite.do" method="post">
    <div class="board_wrap">
  	  <div class="board_title">
  	    <strong>자유게시판 글쓰기</strong>
  	    <p>타인에 대한 비방과 욕설은 자제합시다!</p>
  	  </div>
  	  
  	  <div class="board_write_wrap">
  	    <div class="board_write">
  	    
  	      <div class="title">
  	        <dl>
  	          <dt>제목</dt>
  	          <dd><input type="text" name="bTitle" required="required"></dd>
  	        </dl>
  	      </div>
  	      <div class="info">
  	        <dl>
  	          <dt>작성자</dt>
  	          <dd><input type="text" name="mId" value="${member.mId }" readonly="readonly"></dd>
  	        </dl>
  	      </div>
  	      <div class="cont">
  	        <textarea name="bContent" placeholder="내용 입력"></textarea>
  	      </div>
  	    </div>
  	  </div>
  	  <div class="bt_wrap">
  	    <input type="submit" value="글쓰기" class="on">
  	    <input type="button" value="목록" class="btn" onclick="location.href='${conPath }/boardList.do'">
  	  </div>
    </div>
  </form>
  
  
  
  <%-- <div id="content_form">
  	<form action="${conPath }/boardWrite.do" method="post">
  	  <table>
  	  	<caption>글쓰기</caption>
  	  	<tr>
  	  	  <th>작성자</th>
  	  	  <td><input type="text" name="mId" value="${member.mId }" readonly="readonly"></td>
  	  	</tr>
  	  	<tr>
  	  	  <th>제목</th>
  	  	  <td><input type="text" name="bTitle" required="required" size="30"></td>
  	  	</tr>
  	  	<tr>
  	  	  <th>본문</th>
  	  	  <td><textarea name="bContent" rows="5" cols="32"></textarea></td>
  	    </tr>
  	    <tr>
		  <td colspan="2">
			<input type="submit" value="글쓰기" class="btn">
			<input type="reset" value="취소" class="btn">
			<input type="button" value="목록" class="btn" onclick="location.href='${conPath }/boardList.do'">
		  </td>
		</tr>
  	  </table>
  	</form>
  </div> --%>
</body>
</html>