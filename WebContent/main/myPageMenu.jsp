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
     *{
            list-style:none;
            text-decoration:none;
            margin:0;
            padding:0;
            color:black;           
        }
      #navigation {
            width: 300px;
            height: 420px;
            margin: 150px 0 0 100px;
            font-size: 1.5em;
            padding-top: 20px;
            padding-left: 20px;
            
        }
      #navigation .menu {
            font-weight: bold;
        }
  </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function(){
	  
  });
</script>
  <%-- <link href="${conPath }/css/style.css" rel="stylesheet"> --%>
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
  <div id="navigation">
    <ul class="menu">
      <li>
      	<a href="${conPath }/myProfileView.do">프로필</a>
      </li>
      <li>
      	<a href="${conPath}/memberModifyView.do?mId=${member.mId }">회원정보수정</a>
      </li>
      <li>
      	<a href="${conPath }/reservedMoiveList.do?mId=${member.mId }">찜한영화목록</a>
      </li>
    </ul>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>