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
  <link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
  <table>
			<caption>${member.mId }님 프로필</caption>
			<tr><th>아이디</th>
					<td><input type="text" value="${member.mId }" readonly="readonly"></td>
					<td rowspan="4"><img src="${conPath }/memberPhotoUp/${member.mPhoto}" width="100"></td>
			</tr>
			<tr><th>비밀번호</th>
					<td><input type="text" value="${member.mPw }" readonly="readonly"></td>
			</tr>
			<tr><th>이름</th>
					<td><input type="text" value="${member.mName }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="mEmail" value="${member.mEmail }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><input type="text" value="${member.mRdate }"></td>
			</tr>
		</table>
</body>
</html>