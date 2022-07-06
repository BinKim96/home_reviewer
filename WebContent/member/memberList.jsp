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
    #main_wrap {
    	height: 800px;
    }
  </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function(){
	  
  });
</script>
  <link href="${conPath }/css/member/memberList.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
  
  <div class="list_wrap">
  <div class="main_title1"><h1>MEMBER LIST</h1></div>
    <ul>
      <li class="item">
        <table>
        <tr>
        <c:set var="i" value="0"/>
        <c:forEach var="member" items="${memberList }">
          <td>
            <div class="image">
              <a href="${conPath }/myProfileView.do?mId=${member.mId }">
                <img src="${conPath }/memberPhotoUp/${member.mPhoto}" alt="사진">
              </a>
            </div>
            <div class="cont">
              <strong>${member.mId }</strong>
              <p>&nbsp;</p>
            </div>
          </td>
          <c:set var="i" value="${i+1 }"/>
          <c:if test="${i%7 eq 0 }">
          	</tr><tr>
          </c:if>
        </c:forEach>
        </tr>
        </table>
      </li>  
    </ul>
    
    <div class="paging">
      <c:if test="${startPage > BLOCKSIZE }">
	    <a href="${conPath }/memberList.do?pageNum=${startPage-1}" class="btn"> 이전 </a>
	  </c:if>
	
	  <c:forEach var="i" begin="${startPage }" end="${endPage }">
	    <c:if test="${i eq pageNum }">
		  <a class="num">${i }</a>
	    </c:if>
	    <c:if test="${i != pageNum }">
	      <a href="${conPath }/memberList.do?pageNum=${i}" class="num"> ${i } </a>
	    </c:if>
	  </c:forEach>
      <c:if test="${endPage<pageCnt }">
	    <a href="${conPath }/memberList.do?pageNum=${endPage+1}" class="btn"> 다음 </a>
	  </c:if>
    </div>
  
  </div>
  
  <jsp:include page="../main/footer.jsp"/>
  
  
  
  <%-- <div id="main_wrap">
  <div id="content_form">
  <table>
  	<caption>회원 리스트</caption>
  	<tr>
  	  <c:set var="i" value="0"/>
      <c:forEach var="member" items="${memberList }">
        <td>
          <a href="${conPath }/myProfileView.do?mId=${member.mId }"><img src="${conPath }/memberPhotoUp/${member.mPhoto}" alt="사진"></a>
          <p>${member.mId }</p>
        </td>
        <c:if test="${i%3 == 2 and i!=8}">
        	<tr></tr>
        </c:if>
        <c:set var="i" value="${i+1 }"/>
      </c:forEach>
    </tr>
  </table>
  <div class="paging">
    <c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/memberList.do?pageNum=${startPage-1}"> 이전 </a> ]
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
	  <c:if test="${i == pageNum }">
		<b> [ ${i } ] </b>
	  </c:if>
	  <c:if test="${i != pageNum }">
		[ <a href="${conPath }/memberList.do?pageNum=${i}"> ${i } </a> ]
	  </c:if>
	</c:forEach>
    <c:if test="${endPage<pageCnt }">
		[ <a href="${conPath }/memberList.do?pageNum=${endPage+1}"> 다음 </a> ]
	</c:if>
  </div>
  </div>
  </div> --%>
  
</body>
</html>