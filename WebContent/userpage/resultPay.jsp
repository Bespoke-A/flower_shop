	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cPath=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>장바구니</title>
<!-- jQuery import 방식2(CDN 방식) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>

.btn-group{
	width: 60%;
}

body {
	margin-top: 20px;
	font-size: 13pt;
}

table {
	border-collapse: collapse;
	margin-left: 0;
}

th, td {
	padding-left: 20px;
	text-align: center;
	background-repeat: no-repeat;
	background-position: left;
	border-bottom: #eeeeee solid 1px;
}
</style>
<script>
	window.onload = function() {
		alert("결제가 완료되었습니다");	
		location.href="userpage/mypage.jsp?userId=${userId}";
	}

</script>
</head>

</body>
</html>

