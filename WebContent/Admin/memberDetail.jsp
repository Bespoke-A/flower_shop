<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="<%=cPath %>/css/header_footer.css">
<link rel="stylesheet" href="<%=cPath %>/Admin/css/adminSmall.css">
<style>
</style>
<script>
	function back(){
		history.back();
	}
	
</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	<jsp:include page="adminDropdown.jsp" />
	<h2 id="showHead">회원 상세정보</h2>
	<div id="tableBox">
	<table id="order">
		<tr>
			<th colspan="2">상세정보</th>
			
		</tr>
		<tr>
			<th>아이디</th>
			<td>${vo.userId }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${vo.userName }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${vo.userPhone }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${vo.userAddr }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${vo.userEmail }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${vo.userBirth }</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${vo.userRegdate }</td>
		</tr>
		<tr>
			<th>구매금액 합계</th>
			<td>${price }원</td>
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="back()">뒤로가기</button>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>