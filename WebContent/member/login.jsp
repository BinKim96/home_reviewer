<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Tabs - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
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
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
  $(document).ready(function(){
	  $(function(){
		  $("#tabs").tabs();
	  });
  });
</script>
  <link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
  
  <div id="content_form">
  <div id="tabs">
  	<ul>
     <li><a href="#tabs-1">회원</a></li>
     <li><a href="#tabs-2">관리자</a></li>
  	</ul>
  	<div id="tabs-1">
    <form action="${conPath }/memberLogin.do" method="post">
      <table>
        <caption>회원 로그인</caption>
        <tr>
          <th>아이디</th>
          <td><input type="text" name="mId" value="${mId }" required="required"></td>
        </tr>
        <tr>
          <th>패스워드</th>
          <td><input type="password" name="mPw" required="required"></td>
        </tr>
        <tr>
          <td colspan="2">
            <input type="submit" value="로그인" class="btn">
            <input type="button" value="회원가입" class="btn" onclick="location.href='${conPath}/memberJoinView.do'">
          </td>
        </tr>
      </table>
    </form>
  	</div>
  	<div id="tabs-2">
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
  </div>
  </div>
</body>
</html>