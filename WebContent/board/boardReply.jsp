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
  <link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
  <div id="content_form">
    <form action="${conPath }/boardReply.do" method="post">
      <input type="hidden" name="bGroup" value="${originBoard.bGroup }">
	  <input type="hidden" name="bStep" value="${originBoard.bStep }">
	  <input type="hidden" name="bIndent" value="${originBoard.bIndent }">
	  <table>
	    <caption>${originBoard.bNum }번글의 답변쓰기 폼</caption>
	    <tr>
	      <td>작성자</td>
	      <td><input type="text" name="mId" size="30" value="${member.mId }" readonly="readonly"></td>
	    </tr>
	    <tr>
	      <td>제목</td>
	      <td><input type="text" name="bTitle" required="required" size="30" value="[답]${originBoard.bTitle }"></td>
	    </tr>
	    <tr>
  	  	  <td>본문</td>
  	  	  <td><textarea name="bContent" rows="5" cols="32"></textarea></td>
  	  </tr>
  	  <tr>
  	    <td colspan="2">
  	      <input type="submit" value="답변쓰기" class="btn">
		  <input type="reset" value="취소" class="btn">
		  <input type="button" value="목록" class="btn" onclick="location.href='${conPath}/boardList.do'">
  	    </td>
  	  </tr>
	  </table>
    </form>
  </div>  
</body>
</html>