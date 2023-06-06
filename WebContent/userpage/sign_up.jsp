<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cPath=request.getContextPath(); %>
<%
response.setContentType("text/html;charset=UTF-8");
%>
<html lang="ko">
<head>
<title>회원가입 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


<script>
var $j364 = jQuery.noConflict();
</script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!-- fontawesome(아이콘) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- css분리 -->
<link rel="stylesheet" href="<%=cPath %>/css/sign_up.css">
<link rel="stylesheet" href="<%=cPath %>/css/default.css">
<script>
	let idck = 0;
	function idChk() { //// 아이디 중복 체크 /////
		var valueId = $('#id').val().trim();

		if (valueId == '') {
			alert('아이디를 입력해 주세요.');
			return;
		}

		const pattern = new RegExp("^[a-zA-Z][0-9a-zA-Z]{1,7}$");
		if (!pattern.test(valueId)) {
			alert('아이디는 영문, 숫자 혼합 2 ~ 8 자 사이로 입력해 주세요.');
			return;
		}
		//DataController?type=searchId
		//alert(valueId);
		$j364.ajax("DataController?type=searchId", {
			type : "post",
			data : "frm=" + encodeURIComponent(valueId), // 서버쪽으로 전달할 데이터 
			datatype : "json",
			
			success : function(result) {

				let data = JSON.parse(result);
				//alert(data.result);
				// 성공 (가입 가능)
				if (data.result == 1) {
					alert('가입 가능');
					idck = 1;
				}
				// 실패 (가입 불가)
				else {
					alert('가입 불가');
				}

				//let alist = data.name;
				//alert("alist:" + alist);

			},
			error : function() {
				alert("Ajax 처리 실패 : \n" + "jqXHR.readyState : "
						+ jqXHR.readyState + "\n" + "textStatus : "
						+ textStatus + "\n" + "errorThrown : " + errorThrown);
			}

		});

	}

	function checkValue(frm) {
		if (!document.userInfo.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!document.userInfo.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (!document.userInfo.name.value) {
			alert("이름을 입력하세요.");
			return false;
		}
		if (!(document.userInfo.birth.value)) {
			alert("생년월일을 입력하세요.");
			return false;
		}
		if (isNaN(document.userInfo.birth.value)) {
			alert("생년월일은 숫자만 입력가능합니다.");
			return false;
		}
		var regExpB = /^\d{6}$/;
        if ((document.userInfo.birth.value).match(regExpB) == null) {
           alert("6자리 생년월일을 입력하세요.");
           return false;
        }
		if (!document.userInfo.phone.value) {
			alert("휴대전화 번호를 입력하세요.");
			return false;
		}
		var regExpP = /^\d{3}-\d{3,4}-\d{4}$/;
        if ((document.userInfo.phone.value).match(regExpP) == null) {
	        alert("000-0000-0000 형식으로 입력하세요.");
	        return false;
        }
		if (!document.userInfo.address.value) {
			alert("주소를 입력하세요.");
			return false;
		}
		if (!document.userInfo.mail.value) {
			alert("이메일을 입력하세요.");
			return false;
		}
		/* if(!CheckEmail(!document.userInfo.mail.value))	{
			alert("이메일 형식이 잘못되었습니다");
			return;
		}   */
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if (exptext.test(document.userInfo.mail.value) == false) {
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우            
			alert("이메일형식이 올바르지 않습니다.");
			return false;
		};

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (document.userInfo.password.value != document.userInfo.passwordcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		if (!(idck == 1)) {
			alert("아이디 중복여부를 확인하세요");
			return false;
		}

		//alert("회원가입 시작");
		frm.action = "../controller?type=sign"
		//alert("회원가입 체크.");
		frm.submit();
	}
	/* 회원가입 취소 */
	function goLoginForm(frm){
		alert("회원가입을 취소합니다.");
		location.href="<%=cPath %>/main";
		/* history.back(); */
	}
</script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/main/header.jsp" />
	
	<div id="content">
		<h3>회원가입</h3>
		<p>입력하신 개인정보는 회원님의 동의없이 제 3자에게 제공되지 않으며, 개인정보취급방침에 따로 보호되고 있습니다.</p>
		<hr>
		<form method="post" name="userInfo">
			<table>
				<tr>
					<td id="title">아이디<span>*</span></td>
					<td>
						<div class="id">
							<input type="text" name="id" maxlength="50" id="id" class="box"> 
							<input type="button" id="getIdChk" value="아이디체크" onclick="idChk()">
						</div>
					</td>
				</tr>
				<tr>
					<td id="title">비밀번호<span>*</span></td>
					<td><input type="password" name="password" maxlength="50"
						class="box"></td>
				</tr>
				<tr>
					<td id="title">비밀번호 확인<span>*</span></td>
					<td><input type="password" name="passwordcheck" maxlength="50"
						class="box"></td>
				</tr>
				<tr>
					<td id="title">이름<span>*</span></td>
					<td><input type="text" name="name" maxlength="50" class="box">
					</td>
				</tr>
				<tr>
					<td id="title">생년월일 6자리<span>*</span></td>
					<td><input type="text" name="birth" maxlength="6" class="box">
					</td>
				</tr>
				<tr>
					<td id="title">휴대전화<span>*</span></td>
					<td><input type="text" name="phone" class="box" /></td>
				</tr>
				<tr>
					<td id="title">주소<span>*</span></td>
					<td><input type="text" size="50" class="box" name="address" />
					</td>
				</tr>
				<tr>
					<td id="title">이메일<span>*</span></td>
					<td><input type="text" name="mail" maxlength="50" class="box">
					</td>
				</tr>
			</table>
			<hr>
			<div class="btn">
				<input type="button" value="가입" onclick="checkValue(this.form)"> 
				<input type="button" value="취소" onclick="goLoginForm(this.form)">
			</div> 
		</form>
	</div>
	
	<!-- footer -->
	<jsp:include page="/main/footer.jsp" />
</body>

</html>