<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cPath=request.getContextPath(); %>
<link rel="stylesheet" href="<%=cPath %>/css/header_footer.css">
<link rel="stylesheet" href="<%=cPath %>/css/default.css">
<!-- 	<div id="wrapper">
	  <div></div>
	</div> -->
	<footer>
		<div class="container">
			
			<!-- footer 메뉴 -->
			<div class="menu">
				<ul>
					<li><a href="">회사소개</a></li>
					<li><a href="">개인정보처리방침</a></li>
					<li><a href="">고객상담센터</a></li>
					<li><a href="">위치소개</a></li>
					<li><a href="">대표문의전화 1588-3333</a></li>
				</ul>
			</div>
			<br>
			
			<!-- 상호 안내 -->
			<span>
				상호 : (주)월화수목꽃요일 &nbsp;&nbsp; 대표자 : 이동진(dongjin@flowerweeknd.co.kr)<br>
				사업자 등록번호 : 125-81-54234 &nbsp;&nbsp; 통신판매업 제 2008-서울강남-0800호<br>
				주소 : 서울 강남구 테헤란로 20, 301호(역삼동) &nbsp;&nbsp; TEL : 1588-3333 &nbsp;&nbsp; FAX : 02-3333-3333<br>
				개인정보 보호책임자 : 최남열 &nbsp;&nbsp; 개인정보보유기간 : 회원탈퇴시까지 &nbsp;&nbsp; Hosting by (주)3조
			</span>
			
			<!-- footer 로고 -->
			<a href="<%=cPath %>/index.jsp" class="logo_ft">
				<img src="<%=cPath %>/img/logo/logo_footer.png" alt="logo" class="logo">
			</a>
		</div>
	</footer>
</html>