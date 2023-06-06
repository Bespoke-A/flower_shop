<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/admin.css" rel="stylesheet" type="text/css">
<script>
 	window.onload = function(){
 		order_go();
	};

	
	function order_go() {
		location.href="orderPaging?type=0";
	}
	function sales_go() {
		location.href="salesInfo.jsp";
	}
	function product_go() {
		location.href="productPaging";
	}
	function member_go() {
		location.href="memberManagement.jsp";
	} 
	
</script>
</head>
<body>
	<ul>
	<li><a href="order_go()">주문내역관리</a></li>
	<li><a href="sales_go()">매출정보</a></li>
	<li><a href="store_go()">매장관리</a></li>
	<li><a href="member_go()">회원관리</a></li>
</ul>
</body>
</html>