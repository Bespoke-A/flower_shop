<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!-- fontawesome(아이콘) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- css -->
<link rel="stylesheet" href="<%=cPath %>/css/default.css">
<link rel="stylesheet" href="<%=cPath %>/css/findPwd.css">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
	/* 아이디 찾기 */
	//아이디 & 스토어 값 저장하기 위한 변수
	// 아이디 값 받고 출력하는 ajax
	function findPwd_click() { //비번 찾기
		//alert("시작");

		id = findData.id.value;
		let email = findData.email.value;
		let phone = findData.phone.value;
		//alert(id + email + phone);

		if (id == "") {
			alert("아이디를 입력하세요");
			return;
		}
		if (email == "") {
			alert("이메일을 입력하세요");
			return;
		}
		if (phone == "") {
			alert("전화번호를 입력하세요");
			return;
		}
		//alert("-" + email + "-");
		$.ajax({
			url : "DataController?type=findPwd",
			type : "post",
			data : {
				"id" : id,
				"email" : email,
				"phone" : phone
			},
			datatype : "json",
			success : function(data) {
				//alert("success");
				//alert("data" + data);
				let result = JSON.parse(data);
				//alert("result : " + result.res);

				if (result.res == 0) {
					//alert("값 :  " + result.id);
					alert("회원 정보를 확인해주세요!");
					$('#id_value').text("회원 정보를 확인해주세요!");
					$('#id').val('');
					$('#email').val('');
					$('#phone').val('');
				} else {

					body1.style.display = "none";
					body2.style.display = "table-footer-group";
					$('#id').val('');
					$('#email').val('');
					$('#phone').val('');
				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
	};

	function changePwd() { //비번 변경
		//alert("changePwd시작");

		let pwd = findData.pwd.value;
		let pwdChk = findData.pwdChk.value;
		//alert("pwd : " + pwd + ", pwdChk : " + pwdChk);
		//alert("id : " + id + ", pwd : " + pwd + ", pwdChk : " + pwdChk);

		if ((pwd == "") || (pwdChk == "")) {
			alert("비밀번호를 입력하세요");
			return;
		}
		if (pwd != pwdChk) {
			alert("비밀번호를 동일하게 입력하세요.");
			return;
		}

		$.ajax({
			url : "../DataController?type=changePwd",
			type : "post",
			data : {
				"id" : id,
				"pwd" : pwd,
			},
			datatype : "json",
			success : function(data) {
				alert("비밀번호 변경 완료!");
				//alert("data" + data);
				//alert("result : " + result.res);
				 location.href="/userpage/login.jsp";
			},
			error : function() {
				alert("에러입니다");
			}
		});
	}
</script>
</head>
<body>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/main/header.jsp" />
	
	<div class="content">
	<form name="findData">
		<table class="table">
			
			<tbody id="body1">
				<tr>
					<td colspan="3">
						<h3>비밀번호 찾기</h3>
						<p>회원가입 시, 입력하신 아이디와 회원정보로 비밀번호를 확인할 수 있습니다.</p>
						<hr>
					</td>
				</tr>
				<tr>
					<td class="name">아이디</td>
					<td colspan="3"><input class="textbox-control" type="text" id="id" name="id" placeholder="아이디를 입력해주세요." size="30" required></td>
				</tr>
				<tr>
					<td class="name">이메일</td>
					<td colspan="3"><input class="textbox-control" type="email" id="email" name="email" placeholder="이메일을 입력해주세요." size="30" required></td>
				</tr>
				<tr>
					<td class="name">핸드폰번호</td>
					<td colspan="3"><input class="textbox-control" type="text" id="phone" name="phone" placeholder="핸드폰 번호를 입력해주세요." size="30" required></td>
				</tr>
				<tr>
					<td colspan="3"><input type="button" id="find_id" onclick="findPwd_click()" value="비밀번호 찾기" /></td>
				</tr>
				<tr>
					<td colspan="3" id="id_value" style="border-top:2px solid #eee"></td>
				</tr>	
				<tr>
					<td><input type="button" onclick="location.href='../login/login.jsp'" value="로그인하러 가기"></td>
					<td><input type="button" onclick="history.go(-1);" value="뒤로가기"></td>
				</tr>
				
			</tbody>
			<tbody id="body2" style="display: none;">
				<tr>
					<td colspan="3">
						<h3>비밀번호 변경</h3>
						<p>새로운 비밀번호와 비밀번호 확인을 입력해주세요.</p>
						<hr>
					</td>
				</tr>
				<tr>
					<td class="name">비밀번호</td>
					<td colspan="3"><input class="textbox-control" type="text" id="pwd" name="pwd" placeholder="새로운 비밀번호를 입력해주세요." required></td>
				</tr>
				<tr>
					<td class="name">비밀번호확인</td>
					<td colspan="3"><input class="textbox-control" type="text" id="pwdChk" name="pwdChk" placeholder="한번 더 입력해주세요." required></td>
				</tr>
				<tr>
					<td colspan="3" style="border-bottom:2px solid #eee"></td>
				</tr>
				<tr>
					<td><input type="button" onclick="changePwd();" value="비밀번호 변경하기"></td>
					<td><input type="button" onclick="history.go(-1);" value="뒤로가기"></td>
				</tr>
			</tbody>
			
		</table>
	</form>
	</div>
	<!-- footer -->
	<jsp:include page="/main/footer.jsp" />
</body>
</html>