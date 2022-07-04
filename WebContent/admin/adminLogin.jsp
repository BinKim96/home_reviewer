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
		width: 800px; height:370px;
		margin: 130px auto 0px;
	}
	table {
		margin: 0 auto;
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
    <form action="${conPath }/adminLogin.do" method="post">
      <table>
        <caption>관리자 로그인</caption>
        <tr>
          <th>아이디</th>
          <td><input type="text" name="aId" required="required"></td>
        </tr>
        <tr>
          <th>패스워드</th>
          <td><input type="password" name="aPw" required="required"></td>
        </tr>
        <tr>
          <td colspan="2">
            <input type="submit" value="로그인" class="btn">
          </td>
        </tr>
      </table>
    </form>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>