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
	  $('input[name="mPw"], input[name="mPwChk"]').keyup(function(){
			var mPw = $('input[name="mPw"]').val();
			var mPwChk = $('input[name="mPwChk"]').val();
			if(mPw == mPwChk){
				$('#pwChkResult').html('비밀번호 일치');
			}else{
				$('#pwChkResult').html('<b>비밀번호 불일치</b>');
			}
	  }); // pw check
	  
	  $('input[name="mEmail"]').keyup(function(){
		  var patternMail = /^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/; // 메일 패턴
		  var mEmail = $('input[name="mEmail"]').val();
		  var sessionMemail = '${member.mEmail}';
		  if(patternMail.test(mEmail) && (mEmail != sessionMemail )){
		    $.ajax({
			    url : '${conPath}/emailConfirm.do',
			    type : 'get',
			    dataType : 'html',
			    data : "mEmail="+mEmail,
			    success : function(data){
					  $('#emailConfirmResult').html(data);
			    }
		    });
		  }else if (mEmail == sessionMemail ){
			  $('#emailConfirmResult').html('사용 가능한 이메일');
		  } else if(!mEmail) {
			  $('#emailConfirmResult').html(' &nbsp; ');
		  }else {
			  $('#emailConfirmResult').html('<b>메일 형식을 지켜주세요</b>');
		  }
	  });
	  $('form').submit(function(){
		  var pwChkResult = $('#pwChkResult').text().trim();
		  var emailConfirmResult = $('#emailConfirmResult').text().trim();
			if(pwChkResult !='비밀번호 일치'){
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
  <link href="${conPath }/css/member/modify.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="../main/header.jsp"/>
    <form action="${conPath }/memberModify.do" method="post" enctype="multipart/form-data">
      <div id="border">
        <table>
          <caption class="modify">${member.mId }님 정보수정</caption>
          
          <tr>
		    <td>아이디 <b>*</b></td>
		    <td rowspan="5"><img src="${conPath }/memberPhotoUp/${member.mPhoto}" width="150px" height="200px"></td>
		  </tr>
		  <tr>
			<td>
			  <input type="text" name="mId" value="${member.mId }" readonly="readonly">
			</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		  </tr>
		  
		  <tr>
			<td>비밀번호 <b>*</b></td>
		  </tr>
		  <tr>
		    <td>
			  <input type="password" name="mPw" required="required">
			</td>
		  </tr>
		  <tr>
		    <td colspan="2">&nbsp;</td>
		  </tr>
		  
		  <tr>
			<td colspan="2">비밀번호 재확인 <b>*</b></td>
		  </tr>
		  <tr>
			<td colspan="2">
			  <input type="password" name="mPwChk" required="required">
			</td>
		  </tr>
		  <tr>
		    <td id="pwChkResult" colspan="2">&nbsp;</td>
		  </tr>
		  
		  <tr>
			<td colspan="2">이름 <b>*</b></td>
		  </tr>
		  <tr>
			<td colspan="2">
			  <input type="text" name="mName" value="${member.mName }" required="required">
			</td>
		  </tr>
		  <tr>
		    <td colspan="2">&nbsp;</td>
		  </tr>
		  
		  <tr>
			<td colspan="2">이메일 <b>*</b></td>
		  </tr>
		  <tr>
			<td colspan="2">
			  <input type="text" name="mEmail" value="${member.mEmail }" required="required">
			</td>
		  </tr>
		  <tr>
		    <td id="emailConfirmResult" colspan="2">&nbsp;</td>
		  </tr>
		  
		  <tr>
			<td colspan="2">사진</td>
		  </tr>
		  <tr>
		    <td colspan="2">
		      <input type="hidden" name="dbmPhoto" value="${member.mPhoto }">
			  <input type="file" name="mPhoto" >
			</td>
		  </tr>
		  <tr>
		    <td colspan="2">&nbsp;</td>
		  </tr>
		  
		  <tr>
			<td colspan="2" rowspan="2">
			성별 <b>*</b>
			  <label for="m" id="m">남자</label><input type="radio" name="mGender" value="m" checked="checked"> 
			  <label for="f">여자</label><input type="radio" name="mGender" value="f" id="f">
			
			</td>
			
			
			
		  </tr>
		  <tr>
			
		  </tr>
		  <tr>
		    <td colspan="2">
			  <input type="submit" value="수정하기" class="btn" > 
		    </td>
		  </tr>
        </table>
      </div>
    </form>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>