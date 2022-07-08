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
  <c:if test="${not empty joinResult}">
	<script>alert('${joinResult }');</script>
  </c:if>
  <c:if test="${not empty joinErrorMsg}">
	<script>alert('${joinErrorMsg }');</script>
  </c:if>
  
  <c:if test="${not empty modifyResult}">
	<script>alert('${modifyResult }');</script>
  </c:if>
  <c:if test="${not empty modifyErrorMsg}">
	<script>alert('${modifyErrorMsg }');</script>
  </c:if>
  
  <jsp:include page="../main/header.jsp"/>
  <div id ="main_wrap">
    <form action="${conPath }/memberLogin.do" method="post">
    <div class="Login_Form">
      <h1>LOGIN</h1>
      <div class="txtb">
        <input type="text" name="mId" required="required">
        <span data-placeholder='Username'></span>
	  </div>
	  <div class="txtb">
	    <input type="password" name="mPw" required="required">
	    <span data-placeholder='Password'></span>
	  </div>
	  <button type="submit" class="loginbt"><strong>로그인</strong></button>
	  <!-- <input type="submit" value="로그인" class="loginbt"> -->
	  <div class="bottom-text">
	    아이디가 없으세요? <a href="${conPath }/joinView.do">회원가입하기</a>
	  </div>
    </div>
  </form>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>