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
		width: 700px; 
		height:480px; 
		margin: 0 auto;
		border: 1px solid red;
	}
	table {
		margin: 20px auto;
		border: 1px solid red;
	}
	#idConfirmResult, #pwChkResult, #emailConfirmResult{
		text-align: left; 
		padding-left: 30px;
	}
	
  </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function(){
	  $('input[name="mId"]').keyup(function(){
		  var mId = $('input[name="mId"]').val();
		  $.ajax({
			  url : '${conPath}/idConfirm.do',
			  type : 'get',
			  dataType : 'html',
			  data : "mId="+mId,
			  success : function(data){
					$('#idConfirmResult').html(data);
			  }
		  });
	  });
	  
	  $('input[name="mPw"], input[name="mPwChk"]').keyup(function(){
			var mPw = $('input[name="mPw"]').val();
			var mPwChk = $('input[name="mPwChk"]').val();
			if(mPw == mPwChk){
				$('#pwChkResult').html('<b>비밀번호 일치</b>');
			}else{
				$('#pwChkResult').html('<b>비밀번호 불일치</b>');
			}
	  }); // pw check
	  
	  $('input[name="mEmail"]').keyup(function(){
		  var patternMail = /^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/; // 메일 패턴
		  var mEmail = $('input[name="mEmail"]').val();
		  if(patternMail.test(mEmail)){
		    $.ajax({
			    url : '${conPath}/emailConfirm.do',
			    type : 'get',
			    dataType : 'html',
			    data : "mEmail="+mEmail,
			    success : function(data){
					  $('#emailConfirmResult').html(data);
			    }
		    });
		  }else if(!mEmail) {
			  $('#emailConfirmResult').html(' &nbsp; ');
		  }else {
			  $('#emailConfirmResult').html('메일 형식을 지켜주세요');
		  }
	  });
	  $('form').submit(function(){
		  var idConfirmResult = $('#idConfirmResult').text().trim();
		  var pwChkResult = $('#pwChkResult').text().trim();
		  var emailConfirmResult = $('#emailConfirmResult').text().trim();
		  if(idConfirmResult!='사용 가능한 아이디'){
				alert('사용가능한 아이디로 가입하세요');
				$('input[name="mId"]').val('');
				$('input[name="mId"]').focus();
				return false;
			}else if(pwChkResult !='비밀번호 일치'){
				alert('비밀번호를 확인하세요');
				$('input[name="mPw"]').val('');
				$('input[name="mPwChk"]').val('');
				$('input[name="mPw"]').focus();
				return false;
			}else if(emailConfirmResult!='' && emailConfirmResult != '사용 가능한 이메일'){
				alert('이메일을 확인하세요');
				$('input[name="mEmail"]').val('');
				$('input[name="mEmail"]').focus();
				return false;
			}
	  });
  });
</script>
  <link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
  <div id="content_form">
  <form action="${conPath }/memberJoin.do" method="post" enctype="multipart/form-data">
  	<table>
  	  <caption>회원가입</caption>
  	  <tr>
  	    <th>아이디</th>
  	    <td>
  	      <input type="text" name="mId" required="required">
  	      
  	    </td>
  	  </tr>
  	  <tr>
  	    <td></td>
  	    <td><div id="idConfirmResult"> &nbsp; </div></td>
  	  </tr>
  	  <tr>
  	    <th>비밀번호</th>
  	    <td>
  	      <input type="password" name="mPw" required="required">
  	    </td>
  	  </tr>
  	  <tr>
  	    <td colspan="2"><div> &nbsp;</div></td>
  	  </tr>
  	  <tr>
  	    <th>비밀번호 재확인</th>
  	    <td>
  	      <input type="password" name="mPwChk" required="required">
  	    </td>
  	  </tr>
  	  <tr>
  	    <td></td>
  	    <td><div id="pwChkResult"> &nbsp; </div></td>
  	  </tr>
  	  <tr>
  	    <th>이름</th>
  	    <td>
  	      <input type="text" name="mName" required="required">
  	    </td>
  	  </tr>
  	   <tr>
  	    <td colspan="2"><div> &nbsp;</div></td>
  	  </tr>
  	  <tr>
  	    <th>이메일</th>
  	    <td>
  	      <input type="email" name="mEmail">
  	    </td>
  	  </tr>
  	  <tr>
  	    <td></td>
  	    <td><div id="emailConfirmResult"> &nbsp; </div></td>
  	  </tr>
  	  <tr>
  	    <th>사진</th>
  	    <td>
  	      <input type="file" name="mPhoto">
  	    </td>
  	  </tr>
  	  <tr>
  	    <td colspan="2"><div> &nbsp;</div></td>
  	  </tr>
  	  <tr>
  	    <th>성별</th>
  	    <td>
  	      <label for="m" id="m">남자</label><input type="radio" name="mGender" value="m" checked="checked">
  	      <label for="f">여자</label><input type="radio" name="mGender" value="f" id="f">
  	    </td>
  	  </tr>
  	  <tr>
  	    <td colspan="2"><div> &nbsp;</div></td>
  	  </tr>
  	  <tr>
  	    <td colspan="2">
  	      <input type="submit" value="가입하기" class="joinBtn_style">
  	      <input type="reset" value="다시하기" class="joinBtn_style">
  	    </td>
  	  </tr>
  	</table>
  </form>
  </div>
</body>
</html>