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
  <link href="${conPath }/css/member/profile.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
  <div id="border">
    <table>
      <caption class="profile">${memberinfo.mId }님 프로필</caption>
      
      <tr>
        <td></td>
      </tr>
      <tr>
		<td>아이디 <b>*</b></td>
		<td rowspan="8"><img src="${conPath }/memberPhotoUp/${memberinfo.mPhoto}" alt="사진" width="200" height="260"></td>
	  </tr>
      <tr>
		<td>
		  <input type="text" value="${memberinfo.mId }" readonly="readonly">
		</td>
	  </tr>
				
	  <tr>
		<td>비밀번호 <b>*</b></td>
	  </tr>
	  <tr>
		<td>
		  <c:if test="${not empty member and empty admin }">
		    <input type="text" value="${memberinfo.mPw }" readonly="readonly">
		  </c:if>
		  <c:if test="${not empty admin }">
		    <input type="text" value="관리자는 볼 수 없음" readonly="readonly">
		  </c:if>
		</td>
		</tr>
				
		<tr>
		  <td>이름 <b>*</b></td>
		</tr>
		<tr>
		  <td>
		    <input type="text" value="${memberinfo.mName }" readonly="readonly">
		  </td>
		</tr>
				
		<tr>
		  <td>이메일 <b>*</b></td>
		</tr>
		<tr>
		  <td>
		    <input type="text" value="${memberinfo.mEmail }" readonly="readonly">
		  </td>
		</tr>
    </table>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>