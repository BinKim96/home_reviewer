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
      div{
      	width:200px; box-sizing:border-box;
      }
      ul{
      	list-style:none; box-sizing:border-box; margin:0; padding:0;  /* background:#eeeeee */;  
      }
      ul > li {
      width:100%; padding:0.8em;  box-sizing:border-box; 
      }
      ul > li > ul {
      	margin-left:8px;  box-sizing:border-box; 
      }
      ul > li > ul > li{
      	/* background:#eeeeee; */ width:100%;  /* border-bottom:1px solid #ffffff; */ padding:0.5em; 
      }
      ul > li > ul > li::before {
      	content:" - "; 
      }

    .hover{background:#666666; color:#ffffff; cursor:pointer;}
  </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function(){
	  
  });
</script>
  <%-- <link href="${conPath }/css/style.css" rel="stylesheet"> --%>
</head>
<body>
  
  <div>
    <ul>
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
  
</body>
</html>