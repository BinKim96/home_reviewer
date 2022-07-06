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
	  
  });
</script>
  <link href="${conPath }/css/board/boardWrite.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
  
  <form action="${conPath }/boradModify.do" method="post">
    <input type="hidden" name="bNum" value="${board.bNum }">
    <div class="board_wrap">
    
       <div class="board_title">
         <strong>${board.bNum }번 글 수정</strong>
       </div>
       
       <div class="board_write_wrap">
         <div class="board_write">
           
           <div class="title">
             <dl>
               <dt>제목</dt>
               <dd><input type="text" name="bTitle" required="required" size="30" value="${board.bTitle }"></dd>
             </dl>
           </div>
           
           <div class="info">
             <dl>
               <dt>작성자</dt>
               <dd><input type="text" name="mId" value="${member.mId }" readonly="readonly"></dd>
             </dl>
           </div>
           
           <div class="cont">
             <textarea name="bContent" rows="5" cols="32">${board.bContent }</textarea>
           </div>
         </div>
         
         <div class="bt_wrap">
           <input type="submit" value="수정" class="btn">
		   <input type="button" value="목록"  class="btn" onclick="location='${conPath}/boardList.do'">
		   <input type="button" value="이전" class="btn" onclick="history.back()">
         </div> 
           
       </div>
    </div> <!-- board_wrap -->
  </form>
  
  <%-- <div id="content_form">
  <form action="${conPath }/boradModify.do" method="post">
	<input type="hidden" name="bNum" value="${board.bNum }">
	<table>
	  <caption>${board.bNum }번 글 수정</caption>
	  <tr>
  	  	<th>작성자</th>
  	  	<td><input type="text" name="mId" value="${member.mId }" readonly="readonly"></td>
  	  </tr>
  	  <tr>
  	  	<td>제목</td>
  	  	<td><input type="text" name="bTitle" required="required" size="30" value="${board.bTitle }"></td>
  	  </tr>
  	  <tr>
  	  	<td>본문</td>
  	  	<td><textarea name="bContent" rows="5" cols="32">${board.bContent }</textarea></td>
  	  </tr>
  	  <tr>
  	    <td colspan="2">
		  <input type="submit" value="수정" class="btn">
		  <input type="button" value="목록"  class="btn" onclick="location='${conPath}/boardList.do'">
		  <input type="reset" value="이전" class="btn" onclick="history.back()">
	    </td>
	  </tr>
	</table>
  </form>
  </div> --%>
  
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>