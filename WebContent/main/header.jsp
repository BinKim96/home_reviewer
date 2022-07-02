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
  	/* * * * * * 페이지 초기화 * * * * * */
  	* {
  		padding: 0;
  		margin: 0;
  	}
  	a {
  		text-decoration: none;
  		color: black;
  	}
  	li {
  		list-style: none;
  	}
  	/* * * * * * #header_nav * * * * * */
  	#header_nav {
  		width: 100%;
  		height: 50px;
  		background-color: green;
  		overflow: hidden;
  	}
  	#header_nav a {
  		color: white;
  		font-weight: bold;
  		display: block;
  	}
  	#header_nav .gnb {
  		background-color: red;
  		float: right;
  	}
  	#header_nav .gnb ul {
  		width: 250px;
  		height: 50px;
  		line-height: 50px;
  		margin-right: 20px;
  		border: 1px solid black;
  	}
  	#header_nav .gnb ul li {
  		float: right;
  		width: 80px;
  		text-align: center;
  		border: 1px solid blue;
  	}
  	
  	
  	
  	#header_info {
  		width:100%; 
  		height: 120px;
  		margin:0 auto; 
  		overflow:hidden;
  		border: 1px solid black;
  	}
  	#header_info .logo {
  		margin:10px 30px 10px 30px; 
  		height: 100px;
  		line-height: 100px;
  		float:left;
  		border: 1px solid black;
  	}
  	#header_info .search {
  		float:left;
  	}
  	#header_info .search input[type='text']{
    	width:400px;
    	height: 40px; 
    	font-size:30px;
    	border: 1px solid black;
    	margin-top: 40px;
    	padding:5px;
    	outline:0;
	}
	#header_info .search input[type='submit'] {
    	width: 120px;    
    	height: 50px;
    	border:0;
    	outline: none;
    	color: black;
    	cursor:pointer;
	}
	#header_info .service{
		width: 400px;
		float:right;
		height: 100px;
		border: 1px solid black;
	}
	#header_info .service ul {
		width: 300px;
		heigt: 50px;
		line-height: 50px;
		
	}
	#header_info .service ul li{
		float:left;
		margin:25px 15px 0 0;
		border: 1px solid red;
	}
  	#header_info .service ul li a{
    	color: black; 
    	font-weight: bold;
    	display: block;
    	padding:5px 10px;
	}
  	
  	
  </style>
<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
  <header>
    <c:if test="${empty member and empty admin}">
      <div id="header_nav">
        <div class="gnb">
          <ul>
            <li><a href="${conPath }/loginView.do">LOG IN</a></li>
            <li><a href="${conPath }/joinView.do">SIGN UP</a></li>
            <li><a href="${conPath }/main.do">HOME</a></li>
          </ul>
        </div>
      </div>
      <div id="header_info">
        <div class="logo">
        <a href="${conPath }/main.do">HOME_REVIEWR</a>
        </div>
        <div class="search">
          <form action="${conPath }/movieSearchList.do" method="post">
            <input type="text" name="mvTitle" placeholder="Search movies..."/>
            <input type="submit" class="btn_search" value="SEARCH">
          </form>
        </div>
        <div class="service">
          <ul>
            <li><a href="${conPath }/movieList.do">MOVIE</a></li>
            <li><a href="${conPath }/boardList.do">FREE BOARD</a></li>
          </ul>
        </div>
      </div>
    </c:if>
    <c:if test="${not empty member and empty admin}">
      <div id="header_nav">
        <div class="gnb">
          <ul>
            <li><a href="${conPath }/logout.do">LOG OUT</a></li>
            <li><a href="${conPath }/myPageView.do">${member.mId }님</a></li>
            <li><a href="${conPath }/main.do">HOME</a></li>
          </ul>
        </div>
      </div>
      <div id="header_info">
        <div class="logo">
        <a href="${conPath }/main.do">HOME_REVIEWR</a>
        </div>
        <div class="search">
          <form action="${conPath }/movieSearchList.do">
            <input type="text" name="mvTitle" placeholder="Search movies..."/>
            <input type="submit" class="btn_search" value="SEARCH">
          </form>
        </div>
        <div class="service">
          <ul>
            <li><a href="${conPath }/movieList.do">MOVIE</a></li>
            <li><a href="${conPath }/boardList.do">FREE BOARD</a></li>
          </ul>
        </div>
      </div>
    </c:if>
     <c:if test="${empty member and not empty admin}">
      <div id="header_nav">
        <div class="gnb">
          <ul>
            <li><a href="${conPath }/logout.do">LOG OUT</a></li>
            <li><a href="${conPath }/myPageView.do">${admin.aId }님</a></li>
            <li><a href="${conPath }/main.do">HOME</a></li>
          </ul>
        </div>
      </div>
      <div id="header_info">
        <div class="logo">
        <a href="${conPath }/main.do">HOME_REVIEWR</a>
        </div>
        <div class="search">
          <form action="${conPath }/movieSearchList.do" method="post">
            <input type="text" name="mvTitle" placeholder="Search movies..." >
            <input type="submit" class="btn_search" value="SEARCH">
          </form>
        </div>
        <div class="service">
          <ul>
            <li><a href="${conPath }/movieList.do">MOVIE</a></li>
            <li><a href="${conPath }/boardList.do">FREE BOARD</a></li>
          </ul>
        </div>
      </div>
    </c:if>
  </header>
</body>
</html>