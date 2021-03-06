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
  <!-- <div id="main_wrap">
  <div id="content_form"> -->
  <form action="${conPath }/movieRegister.do" method="post" enctype="multipart/form-data">
    <div class="board_wrap">
      <div class="board_title">
  	    <strong>영화등록하기</strong>
  	    <p>관리자의 영화등록 페이지</p>
  	  </div>
  	  
  	  <div class="board_write_wrap">
  	    <div class="board_write">
  	    
  	      <div class="title">
  	        <dl>
  	          <dt>제목</dt>
  	          <dd><input type="text" name="mvTitle" required="required"></dd>
  	        </dl>
  	      </div>
  	      
  	      <div class="info">
  	        <dl>
  	          <dt>장르</dt>
  	          <dd>
  	            <select name="gId" required="required">
          	    <c:forEach var="genre" items="${movieGenres }">
              	  <option value="${genre.gId }">${genre.gName }</option>
                </c:forEach>
                </select>
  	          </dd>
  	        </dl>
  	        <dl>
  	          <dt>상영등급</dt>
  	          <dd>
  	            <select name="grId" required="required">
                <c:forEach var="grade" items="${movieGrades }">
              	  <option value="${grade.grId }">${grade.grName }</option>
                </c:forEach>
                </select>
  	          </dd>
  	        </dl>
  	        <dl>
  	          <dt>감독</dt>
  	          <dd><input type="text" name="mvDirector" required="required"></dd>
  	        </dl>
  	        <dl>
  	          <dt>출연진</dt>
  	          <dd><input type="text" name="mvCast" required="required"></dd>
  	        </dl>
  	        <dl>
  	          <dt>상영시간</dt>
  	          <dd><input type="text" name="mvRunningTime" required="required"></dd>
  	        </dl>
  	        <dl>
  	          <dt>개봉일</dt>
  	          <dd><input type="text" name="mvReleaseDate" id="mvReleaseDate" required="required"></dd>
  	        </dl>
  	        <dl>
  	          <dt>포스터</dt>
  	          <dd><input type="file" name="mvPoster"></dd>
  	        </dl>
  	      </div>
  	      <div class="cont">
  	        <textarea name="mvContent" placeholder="영화 줄거리 입력"></textarea>
  	      </div>
  	    </div>
  	  </div>
  	  <div class="bt_wrap">
  	    <input type="submit" value="등록" class="on">
  	    <input type="button" value="목록" class="btn" onclick="location.href='${conPath}/movieList.do'">
  	  </div>
    </div>
  </form>
    
  <jsp:include page="../main/footer.jsp"/> 
    
      <%-- <table>
        <caption>영화등록하기</caption>
        <tr>
          <th>제목</th>
          <td><input type="text" name="mvTitle" required="required" size="30"></td>
        </tr>
        <tr>
          <th>장르</th>
          <td>
            <select name="gId" required="required">
          	  <c:forEach var="genre" items="${movieGenres }">
              	<option value="${genre.gId }">${genre.gName }</option>
              </c:forEach>
            </select>
          </td>
        </tr>
        <tr>
          <th>개봉일</th>
          <td><input type="text" name="mvReleaseDate" id="mvReleaseDate" required="required" size="30"></td>
        </tr>
        <tr>
          <th>감독</th>
          <td><input type="text" name="mvDirector" required="required" size="30"></td>
        </tr>
        <tr>
          <th>출연진</th>
          <td><input type="text" name="mvCast" required="required" size="30"></td>
        </tr>
        <tr>
          <th>상영시간</th>
          <td><input type="text" name="mvRunningTime" required="required" size="30"></td>
        </tr>
        <tr>
          <th>상영등급</th>
          <td>
            <select name="grId" required="required">
              <c:forEach var="grade" items="${movieGrades }">
              	<option value="${grade.grId }">${grade.grName }</option>
              </c:forEach>
            </select>
          </td>
        </tr>
        <tr>
          <th>포스터</th>
          <td><input type="file" name="mvPoster" size="30"></td>
        </tr>
        <tr>
          <th>줄거리</th>
          <td><textarea rows="5" cols="20" name="mvContent"></textarea></td>
        </tr>
        <tr>
          <td colspan="2">
			<input type="submit" value="등록" class="btn">
			<input type="button" value="목록" class="btn" onclick="location.href='${conPath}/movieList.do'">
		  </td>
		</tr>  
      </table>
    </form>
  </div>
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