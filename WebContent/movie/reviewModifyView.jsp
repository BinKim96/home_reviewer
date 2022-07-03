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
	  
  });
</script>
  <link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
  <div id="content_form">
  <form action="${conPath }/reviewModify.do">
      <input type="hidden" name="mvId" value="${reviewBoard.mvId }">
      <input type="hidden" name="mId" value="${reviewBoard.mId }">
      <input type="hidden" name="rbNum" value="${reviewBoard.rbNum }">
      <table>
        
	      <tr>
	        <td>
	          <textarea rows="2" cols="120" name="rbContent">${reviewBoard.rbContent }</textarea>
	          <input type="text" value="${reviewBoard.mvId }">
	          <input type="submit" value="댓글수정">
	        </td>
	      </tr>
        <c:if test="${empty member }"><tr><td><a href="${conPath }/loginView.do">리뷰 작성은  로그인 이후에만 가능합니다</a></td></tr></c:if>
      </table>
    </form>
    </div>
</body>
</html>