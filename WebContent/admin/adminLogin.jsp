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
  <style></style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function(){
	  
  });
</script>
  <link href="${conPath }/css/member/login.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
  <div id ="main_wrap">
    <form action="${conPath }/adminLogin.do" method="post">
    <div class="Login_Form">
      <h1>관리자 로그인</h1>
      <div class="txtb">
        <input type="text" name="aId" value="${mId }" required="required">
        <span data-placeholder='Adminname'></span>
	  </div>
	  <div class="txtb">
	    <input type="password" name="aPw" required="required">
	    <span data-placeholder='Password'></span>
	  </div>
	  <input type="submit" value="로그인" class="loginbt">
    </div>
  </form>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>