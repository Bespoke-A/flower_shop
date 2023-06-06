<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String cPath = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cPath%>/css/header_footer.css">
<style>
.navbar{
	text-align: center;
}
.navbar a{
	text-align: center;
	font-size: 17px;
	color: black;
	padding: 0 30px;
	line-height: 50px;
	text-align: center;
	font-weight: 500;
}
.navbar a:hover {
	color: #fff;
	font-weight: 600;
	text-decoration: none;
}
.dropbtn {
	background-color: #CEBFEE;
	color: black;
	padding: 11px;
	font-size: 17px;
	border: none;
	cursor: pointer;
}
.dropbtn:hover {
	color: #fff;
	font-weight: 600;
	text-decoration: none;
}
.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
	color: black;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	font-size: 1.1em;
}
</style>

<!-- h: menu -->
<nav id="menu">
	<div class="navbar">
		<a href="orderPaging?type=0">주문내역관리</a>
		<a href="salesInfo.jsp">매출정보</a>
		<div class="dropdown">
			<button class="dropbtn"> 매장관리 
			<i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="productPaging">상품관리</a>
				<a href="addProduct.jsp">상품추가</a>
				<a href="reviewMngmt">리뷰관리</a>
			</div>
		</div>
		<a href="MemberListMngmt">회원관리</a>
	</div>

</nav>

