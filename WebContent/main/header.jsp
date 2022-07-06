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
<link href="${conPath }/css/main/header.css" rel="stylesheet">
</head>
<body>
  <div id="wrap">
    <header>
      <div id="header_info">
    	<c:if test="${empty member and empty admin}">
      	  <ul class="gnb">
      	    <li><a href="${conPath }/main.do"><img src="${conPath }/img/home.png" class="home" width="35px" height="35px"></a></li>
        	<li><a href="${conPath }/joinView.do"><img src="${conPath }/img/link.png" class="link" width="35px" height="35px"></a></li>
        	<li><a href="${conPath }/loginView.do"><img src="${conPath }/img/login.png" class="enter" width="35px" height="35px"></a></li>
      	  </ul>
    	</c:if>
    	<c:if test="${not empty member and empty admin}">
    	  <ul class="gnb">
    	    <li><a href="${conPath }/main.do"><img src="${conPath }/img/home.png" class="home" width="35px" height="35px"></a></li>
    	    <li>
    	      <a href="${conPath }/myPageView.do"><img src="${conPath }/img/user.png" class="user" width="35px" height="35px"></a>
			  <!-- <ul class="submenu">
			    <li><a href="#">PROFILE</a><li>
			    <li><a href="#">MODIFY</a><li>
			    <li><a href="#">MY MOVIE</a><li>
			  </ul>  -->  	    
    	    </li>
    	    <li><a href="${conPath }/logout.do"><img src="${conPath }/img/logout.png" class="exit" width="35px" height="35px"></a></li>
    	  </ul>
    	</c:if> 
    	<c:if test="${empty member and not empty admin}">
    	  <ul class="gnb">
            <li><a href="${conPath }/main.do"><img src="${conPath }/img/home.png" class="home" width="35px" height="35px"></a></li>
            <li><a href="#"><img src="${conPath }/img/admin.png" class="admin" width="35px" height="35px"></a></li>
    	    <li><a href="${conPath }/logout.do"><img src="${conPath }/img/logout.png" class="exit" width="35px" height="35px"></a></li>
    	  </ul>
    	</c:if> 
      </div>
      
      <div id="header_service">
      	<div class="logo">
      	  <a href="${conPath }/main.do"><img src="${conPath }/img/logo.png" alt="로고" width="130" height="130"></a>
      	</div>
      	<div class="search">
      	  <form action="${conPath }/movieSearchList.do" method="get" class="search_bar">
            <input type="text" name="schmvTitle" placeholder="search movies..."  value="${param.schmvTitle }">
            <button type="submit"><img src="${conPath }/img/search.png"></button>
          </form>
        </div>
        <ul class="lnb">
          <li><a href="${conPath }/movieList.do">MOVIE</a></li>
          <li><a href="${conPath }/boardList.do">BOARD</a></li>
          
          <c:if test="${empty member and not empty admin}">
            <li><a href="${conPath }/memberList.do">MEMBER</a></li>
          </c:if>
        </ul>
      </div>
    </header>
  </div>
  
  <%-- <header>
    <c:if test="${empty member and empty admin}"> <!-- 로그인 전 -->
      <div id="header_nav">
        <div class="gnb">
          <ul>
            <li><a href="${conPath }/loginView.do"><img src="${conPath }/img/login.png" class="enter" width="35px" height="35px"></a></li>
            <li><a href="${conPath }/joinView.do"><img src="${conPath }/img/link.png" class="link" width="35px" height="35px"></a></li>
            <li><a href="${conPath }/main.do"><img src="${conPath }/img/home.png" class="home" width="35px" height="35px"></a></li>
          </ul>
        </div>
      </div>
    </c:if>
    <c:if test="${not empty member and empty admin}"> <!-- 회원 로그인 -->
      <div id="header_nav">
        <div class="gnb">
          <ul>
            <li><a href="${conPath }/logout.do"><img src="${conPath }/img/logout.png" class="exit" width="35px" height="35px"></a></li>
            <li><a href="${conPath }/myPageView.do"><img src="${conPath }/img/user.png" class="user" width="35px" height="35px"></a></li>
            <li><a href="${conPath }/main.do"><img src="${conPath }/img/home.png" class="home" width="35px" height="35px"></a></li>
          </ul>
        </div>
      </div>
    </c:if>
     <c:if test="${empty member and not empty admin}"> <!-- 관리자 로그인 -->
      <div id="header_nav">
        <div class="gnb">
          <ul>
            <li><a href="${conPath }/logout.do"><img src="${conPath }/img/logout.png" class="exit" width="35px" height="35px"></a></li>
            <li><a href="#"><img src="${conPath }/img/admin.png" class="admin" width="35px" height="35px"></a></li>
            <li><a href="${conPath }/main.do"><img src="${conPath }/img/home.png" class="home" width="35px" height="35px"></a></li>
          </ul>
        </div>
      </div>
     </c:if>
     
      <div id="header_info">
        <div class="logo">
        <a href="${conPath }/main.do"><img src="${conPath }/img/logo.png" alt="로고" width="130" height="130"></a>
        </div>
        <div class="search">
          <form action="${conPath }/movieSearchList.do" method="get">
            <input type="text" name="schmvTitle" placeholder="Search movies..."  value="${param.schmvTitle }">
            <input type="submit" value="SEARCH">
          </form>
        </div>
        <div class="service">
          <ul>
            <li><a href="${conPath }/movieList.do">MOVIE</a></li>
            <li><a href="${conPath }/boardList.do">FREE BOARD</a></li>
            <c:if test="${empty member and not empty admin}">
            <li><a href="${conPath }/memberList.do">MEMBER</a></li>
            </c:if>
          </ul>
        </div>
      </div>
    
  </header> --%>
</body>
</html>