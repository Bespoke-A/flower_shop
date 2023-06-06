<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cPath=request.getContextPath(); %>
<link rel="stylesheet" href="<%=cPath %>/css/header_footer.css">
<link rel="stylesheet" href="<%=cPath %>/css/default.css">
<script>
	function search(){
		let search = $("#search").val();
		location.href="<%=cPath %>/search?fName="+search;
	}
	
	
</script>
	<!-- 헤더 -->
	<header>
		<!-- h: util -->
		<div class="util">
		<c:if test="${empty userId}">
			<ul>
				<li><a href="<%=cPath %>/login/login.jsp">로그인</a></li>
				<li><a href="<%=cPath %>/userpage/sign_up.jsp">회원가입</a></li>
				<li><a href="<%=cPath %>/login/login.jsp">장바구니</a></li>
				<li><a href="<%=cPath %>/login/login.jsp">마이페이지</a></li>
			</ul>
		</c:if>
		<c:if test="${not empty userId}">
			<ul>
				<li>
					<span>[ ${userName } ]</span><span>님 환영합니다.</span>
					<a href="<%=cPath %>/logout">로그아웃 </a>
				</li>
			</ul>
		</c:if>
		</div>
		<!-- 로고, 검색창 -->
		<div class=container>
			<div class="logo_search row">
			<table width="100%">
				<tr>
					<!-- 빈공간 -->
					<!-- 로고 -->
					<td width="40%" aline="center">
						<a href="<%=cPath %>/index.jsp">
							<img src="<%=cPath %>/img/logo/logo.png" alt="logo" class="logo">
						</a>
					</td>
					<!-- 검색창 -->
				</tr>
			</table>
			</div>
			
		</div>
	</header>
