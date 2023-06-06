<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 절대경로 -->
<% String cPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!-- fontawesome(아이콘) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>로그인페이지</title>
<!-- css -->
<link rel="stylesheet" href="<%=cPath %>/css/login.css">
<link rel="stylesheet" href="<%=cPath %>/css/default.css">
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/main/header.jsp" />
<script>
	function validateForm(frm){
		if(!frm.userId.value){
			alert("아이디를 입력하세요.");
			return false;
		}
		if(!frm.userPwd.value){
			alert("패스워드를 입력하세요.");
			return false;
		}
		
	}
</script>
	<!-- 로그인 화면구현 -->
	<div class="container login">
		<div class="col-lg-4"></div>
		<div class="col-lg-4" style="float: none; margin: 0 auto;">
			<div class="jumbotron" style="padding-top: 50px;">
				<form method="post" action="<%=cPath %>/login/loginProc" name="login" onsubmit="return validateForm(this)">
					<h4 style="text-align: center;"><span>아이디/비밀번호</span>를<br>입력하여 로그인하세요.</h4>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userId" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPwd" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
				<hr>
				<div class="sign">
					<ul>
						<li><a href="<%=cPath%>/userpage/sign_up.jsp">회원가입</a></li>
						<li class="gap">|</li>
						<li><a href="<%=cPath%>/userpage/findId.jsp">아이디찾기</a></li>
						<li class="gap">|</li>
						<li><a href="<%=cPath%>/userpage/findPwd.jsp">비밀번호찾기</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-4"></div>
	</div>

	<!-- footer -->
	<jsp:include page="/main/footer.jsp" />

</body>
</html>