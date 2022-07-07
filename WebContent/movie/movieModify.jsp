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
  <link href="${conPath }/css/board/boardWrite.css" rel="stylesheet">
  <style>
  </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function(){
	  
  });
</script>
 
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
  
  <form action="${conPath }/movieMoidfy.do" method="post" enctype="multipart/form-data">
    <input type="hidden" name="mvId" value="${movie.mvId }">
	<input type="hidden" name="dbmvPoster" value="${movie.mvPoster }">
    <div class="board_wrap">
      <div class="board_title">
        <strong>${movie.mvId }번 영화 수정</strong>
  	    <p>관리자의 영화등록 페이지</p>
      </div>
      
      <div class="board_write_wrap">
        <div class="board_write">
        
          <div class="title">
            <dl>
  	          <dt>제목</dt>
  	          <dd><input type="text" name="mvTitle" required="required" value="${movie.mvTitle }"></dd>
  	        </dl>
          </div>
          
          <div class="info">
            <dl>
  	          <dt>장르</dt>
  	          <dd>
  	            <select name="gId" required="required">
          	    <c:forEach var="genre" items="${movieGenres }">
              	  <c:if test="${genre.gName !=  movie.gName}">
              		<option value="${genre.gId }">${genre.gName }</option>
              	  </c:if>
              	  <c:if test="${genre.gName eq movie.gName }">
              		<option value="${genre.gId }" selected="selected">${genre.gName }</option>
              	  </c:if>
                </c:forEach>
                </select>
  	          </dd>
  	        </dl>
  	        <dl>
  	          <dt>상영등급</dt>
  	          <dd>
  	            <select name="grId" required="required">
                <c:forEach var="grade" items="${movieGrades }">
              	  <c:if test="${grade.grName !=  movie.grName}">
              		<option value="${grade.grId }">${grade.grName }</option>
              	  </c:if>
              	  <c:if test="${grade.grName eq movie.grName }">
              		<option value="${grade.grId }" selected="selected">${grade.grName }</option>
              	  </c:if>
                </c:forEach>
                </select>
  	          </dd>
  	        </dl>
  	        <dl>
  	          <dt>감독</dt>
  	          <dd><input type="text" name="mvDirector" value="${movie.mvDirector }" required="required"></dd>
  	        </dl>
  	        <dl>
  	          <dt>출연진</dt>
  	          <dd><input type="text" name="mvCast" value="${movie.mvCast }" required="required"></dd>
  	        </dl>
  	        <dl>
  	          <dt>상영시간</dt>
  	          <dd><input type="text" name="mvRunningTime" value="${movie.mvRunningTime }" required="required"></dd>
  	        </dl>
  	        <dl>
  	          <dt>개봉일</dt>
  	          <dd><input type="text" name="mvReleaseDate" id="mvReleaseDate" value="${movie.mvReleaseDate }" required="required"></dd>
  	        </dl>
  	        <dl>
  	          <dt>포스터</dt>
  	          <dd>
  	            <input type="file" name="mvPoster" size="30">
                <c:if test="${not empty movie.mvPoster }">
			      <a href="${conPath }/moviePosterUp/${movie.mvPoster}" target="_blank">${movie.mvPoster}</a>
			    </c:if>
			    <c:if test="${empty movie.mvPoster }">
					첨부파일없음
			    </c:if>
			  </dd>
  	        </dl>
          </div>
          
          <div class="cont">
  	        <textarea name="mvContent">${movie.mvContent }</textarea>
  	      </div>
        </div>
      </div>
      <div class="bt_wrap">
  	    <input type="submit" value="수정" class="on">
  	    <input type="button" value="상세" class="btn" onclick="location.href='${conPath}/movieContent.do?mvId=${movie.mvId }'">
  	  </div>
    </div>
  </form>
  
  <jsp:include page="../main/footer.jsp"/>
  
  
  
  
  
  <%-- <div id="content_form">
    <form action="${conPath }/movieMoidfy.do" method="post" enctype="multipart/form-data">
      <input type="hidden" name="mvId" value="${movie.mvId }">
	  <input type="hidden" name="dbmvPoster" value="${movie.mvPoster }">
	  <table>
	    <caption>${movie.mvId }번 영화 수정</caption>
	    <tr>
          <th>제목</th>
          <td><input type="text" name="mvTitle" required="required" value="${movie.mvTitle }" size="30"></td>
        </tr>
        <tr>
          <th>장르</th>
          <td>
            <select name="gId" required="required">
          	  <c:forEach var="genre" items="${movieGenres }">
              	<c:if test="${genre.gName !=  movie.gName}">
              		<option value="${genre.gId }">${genre.gName }</option>
              	</c:if>
              	<c:if test="${genre.gName eq movie.gName }">
              		<option value="${genre.gId }" selected="selected">${genre.gName }</option>
              	</c:if>
              </c:forEach>
            </select>
          </td>
        </tr>
        <tr>
          <th>개봉일</th>
          <td><input type="text" name="mvReleaseDate" id="mvReleaseDate" value="${movie.mvReleaseDate }" required="required" size="30"></td>
        </tr>
        <tr>
          <th>감독</th>
          <td><input type="text" name="mvDirector" value="${movie.mvDirector }" required="required" size="30"></td>
        </tr>
        <tr>
          <th>출연진</th>
          <td><input type="text" name="mvCast" value="${movie.mvCast }" required="required" size="30"></td>
        </tr>
        <tr>
          <th>상영시간</th>
          <td><input type="text" name="mvRunningTime" value="${movie.mvRunningTime }" required="required" size="30"></td>
        </tr>
        <tr>
          <th>상영등급</th>
          <td>
            <select name="grId" required="required">
              <c:forEach var="grade" items="${movieGrades }">
              	<c:if test="${grade.grName !=  movie.grName}">
              		<option value="${grade.grId }">${grade.grName }</option>
              	</c:if>
              	<c:if test="${grade.grName eq movie.grName }">
              		<option value="${grade.grId }" selected="selected">${grade.grName }</option>
              	</c:if>
              </c:forEach>
            </select>
          </td>
        </tr>
        <tr>
          <th>포스터</th>
          <td>
            <input type="file" name="mvPoster" size="30">
            <c:if test="${not empty movie.mvPoster }">
			  <a href="${conPath }/moviePosterUp/${movie.mvPoster}" target="_blank">${movie.mvPoster}</a>
			</c:if>
			<c:if test="${empty movie.mvPoster }">
						 		첨부파일없음
			</c:if>
          </td>
        </tr>
        <tr>
          <th>줄거리</th>
          <td><textarea rows="5" cols="20" name="mvContent" >${movie.mvContent }</textarea></td>
        </tr>
        <tr>
          <td colspan="2">
			<input type="submit" value="영화수정" class="btn">
			<input type="button" value="해당영화상세보기" class="btn" onclick="location.href='${conPath}/movieContent.do?mvId=${movie.mvId }'">
		  </td>
		</tr> 
	  </table>
    </form>
  </div> --%>
</body>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#mvReleaseDate" ).datepicker({
    	dateFormat : 'yy-mm-dd',
    	changeMonth : true, // 월을 바꿀 수 있는 셀렉트 박스 표시
    	monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	showMonthAfterYear : true,
    	yearSuffix : '년', // "2020년 3월"
    	showOtherMonths : true,
    	dayNamesMin:['일','월','화','수','목','금','토'],
			changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스 표시
			minDate : '-100y', // 현재 날짜로부터 100년 이전까지 표시
			maxDate : '1y+120', // 현재 날짜이전까지만 표시
			yearRange : 'c-100:c+100', // 년도 선택 셀렉트 
    	});
  } );
  </script>
</html>