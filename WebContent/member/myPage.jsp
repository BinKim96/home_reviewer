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
	  $('ul li ul li').hover(
	  	function(event){
			$(this).addClass('hover');
	  	},
		function(){
		    $(this).removeClass('hover');
		}
	  );
  });
</script>
  <link href="${conPath }/css/member/myPage.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
  <div id="cont">
    &nbsp;
  	<div class="menu">
      <ul>
        <li><h1>MY PAGE</h1>
          <ul>
            <li><a href="${conPath }/myProfileView.do">MY PROFILE</a></li>
            <li><a href="${conPath }/reservedMoiveList.do?mId=${member.mId }">MY MOVIES</a></li>
            <li><a href="${conPath}/memberModifyView.do?mId=${member.mId }">ACCOUNT SET</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <%-- <jsp:include page="../main/myPageMenu.jsp" /> --%>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>