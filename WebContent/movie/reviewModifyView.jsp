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
    #content_form {
		width: 1200px; height:600px;
		margin: 100px auto 0px;
	}
	tr th:nth-child(2), tr th:nth-child(2) {
	 width : 200px;
    }
  </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${conPath }/se2/js/service/HuskyEZCreator.js" charset="utf-8" ></script>
<script>
  $(document).ready(function(){
  	$('form').submit(function(){
	  oEditors.getById["rbContent"].exec("UPDATE_CONTENTS_FIELD", []);
			
	});
  });
</script>
  <link href="${conPath }/css/style.css" rel="stylesheet">
  <link href="${conPath }/se2/css/ko_KR/smart_editor2.css" rel="stylesheet" type="text/css">
</head>
<body>
  <div id="content_form">
  <form action="${conPath }/reviewModify.do" method="post">
      <input type="hidden" name="pageNum" value="${param.pageNum}">
      <input type="hidden" name="mvId" value="${param.mvId }">
      <input type="hidden" name="mId" value="${param.mId }">
      <input type="hidden" name="rbNum" value="${param.rbNum }">
      
      <table>
	      <tr>
	        <td>
	          <textarea rows="2" cols="120" name="rbContent">${reviewBoard.rbContent }</textarea>
	          <script id="smartEditor" type="text/javascript">
					  var oEditors = [];
					  nhn.husky.EZCreator.createInIFrame({
							 oAppRef: oEditors,
							 elPlaceHolder: "bcontent",
							 sSkinURI: "${conPath }/se2/SmartEditor2Skin.html",
							 fCreator: "createSEditor2",
							 htParams : { 
							    // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
							    bUseToolbar : true, 
								// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
								bUseVerticalResizer : false, 
								// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
								bUseModeChanger : false 
							 }
					 });
			  </script>
	          <input type="submit" value="댓글수정">
	        </td>
	      </tr>
      </table>
    </form>
    </div>
</body>
</html>