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
    textarea {
		width: 930px;
		height: 50px;
		padding: 10px;
		box-sizing: border-box;
		border: solid 2px orange;
		border-radius: 5px;
		font-size: 16px;
		resize: none;
		margin-right: 5px;
	}
	button {
		width: 50px;
		height: 50px;
		border: none;
		background-color: white;
	}
  </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function(){
	  
  });
</script>
  
</head>
<body>
  
  <form action="${conPath }/reviewModify.do" method="post">
      <input type="hidden" name="pageNum" value="${param.pageNum}">
      <input type="hidden" name="mvId" value="${param.mvId }">
      <input type="hidden" name="mId" value="${param.mId }">
      <input type="hidden" name="rbNum" value="${param.rbNum }">
      <table>
	      <tr>
	        <td>
	          <textarea rows="2" cols="120" name="rbContent">${reviewBoard.rbContent }</textarea>
	          <button type="submit"><img src="${conPath }/img/edit.png" alt="리뷰수정" width="60" height="60"></button>
	        </td>
	      </tr>
      </table>
    </form>
    
</body>
</html>