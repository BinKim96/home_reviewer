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
  <link href="${conPath }/css/main/footer.css" rel="stylesheet">
</head>
<body>
  <footer>
    <c:if test="${empty member and empty admin }">
        <div class="office_address">
            <ul>
                <li>info@home_reviewer.com |<a href="${conPath }/adminLoginView.do">관리자모드</a></li>
                <li>(주)방구석평론가|대표이사 김 빈|사업자번호 010-9670-6113|서울특별시 광진구 능동로37길 31-8 늘해랑 오피스텔</li>
                <li>
                    ⓒHOWTOSEARCHWEDDINGHALL 2022 ALL RIGHTS RESERVED
                </li>
            </ul>
        </div>
        </c:if>
     
     <c:if test="${not empty member and empty admin}"> <!-- 멤버로그인 후 -->
        <div class="office_address">
            <ul>
                <li>info@home_reviewer.com | ${member.mname }님 어서오세요</li>
                <li>(주)방구석평론가|대표이사 김 빈|사업자번호 010-9670-6113|서울특별시 광진구 능동로37길 31-8 늘해랑 오피스텔</li>
                <li>
                    ⓒHOWTOSEARCHMOVIE 2022 ALL RIGHTS RESERVED
                </li>
            </ul>
        </div>
     </c:if>
     
      <c:if test="${empty member and not empty admin}"> <!--관리자로그인 후 -->
        <div class="office_address">
            <ul>
                <li>info@home_reviewer.com | ${admin.aId }관리자님 어서오세요</li>
                <li>(주)방구석평론가|대표이사 김 빈|사업자번호 010-9670-6113|서울특별시 광진구 능동로37길 31-8 늘해랑 오피스텔</li>
                <li>
                    ⓒHOWTOSEARCHWEDDINGHALL 2022 ALL RIGHTS RESERVED
                </li>
            </ul>
        </div>
     </c:if>
  </footer>
</body>
</html>