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
  <link href="${conPath }/css/member/join.css" rel="stylesheet">
  <style>
   
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
				$('#pwChkResult').html('<i>비밀번호 일치</i>');
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
			  $('#emailConfirmResult').html('<b>메일 형식을 지켜주세요</b>');
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
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
	<form action="${conPath }/memberJoin.do" method="post" enctype="multipart/form-data">
		<div id="border">
			<table>
				<tr>
				  <td class="join"><div>&nbsp;</div>회원가입</td>
				  <td></td>
				</tr>                   
				<tr>
				  <td></td>
				  <td></td>
				</tr>
				
				<tr>
					<td>아이디 <b>*</b></td>
					<td></td>
				</tr>
				<tr>
					<td>
					  <input type="text" name="mId" required="required">
					  <div id="idConfirmResult">&nbsp;</div>
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td>비밀번호 <b>*</b></td>
					<td></td>
				</tr>
				<tr>
					<td>
					  <input type="password" name="mPw" required="required">
					  <div>&nbsp;</div>
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td>비밀번호 재확인 <b>*</b></td>
					<td></td>
				</tr>
				<tr>
					<td>
					  <input type="password" name="mPwChk" required="required">
					  <div id="pwChkResult">&nbsp;</div>
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td>이름 <b>*</b></td>
					<td></td>
				</tr>
				<tr>
					<td>
					  <input type="text" name="mName" required="required">
					  <div>&nbsp;</div>
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td>이메일 <b>*</b></td>
					<td></td>
				</tr>
				<tr>
					<td>
					  <input type="text" name="mEmail">
					  <div id="emailConfirmResult">&nbsp;</div>
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td>사진</td>
					<td></td>
				</tr>
				<tr>
					<td>
					  <input type="file" name="mPhoto">
					  <div>&nbsp;</div>
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td rowspan="2">
					성별 <b>*</b>
					<input type="radio" name="mGender" value="m" id="m" checked="checked"><label for="m">남자</label> 
					<input type="radio" name="mGender" value="f" id="f"><label for="f">여자</label>
					</td>
				</tr>
				<tr>
					
					<td rowspan="2"></td>
				</tr>
				
				<tr>
					<td rowspan="2">
					  <input type="submit" value="가입하기" class="btn"> 
					</td>
				</tr>
			</table>
		</div>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>