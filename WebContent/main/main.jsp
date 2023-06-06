<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 절대경로 -->
<% String cPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월화수목꽃요일</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!-- 자바스크립트 -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- fontawesome(아이콘) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- javascript -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="css/header_footer.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/default.css">
<script>
/* 	window.history.forward(); function noBack(){ 
		window.history.forward();
	} */
	/* 슬라이드 자동 넘김 */
	$(document).ready(function(){
		setInterval(function(){
			// 일정시간 후 animate 이동 반복
			$('.slide_list').delay("2500"); // 2.5초 후에 시작
            $('.slide_list').animate({marginLeft:'-1140px'},500);
            
            $('.slide_list').delay("2500"); // 2.5초 후에 시작
            $('.slide_list').animate({marginLeft:'-2280px'},500);
            
            $('.slide_list').delay("2500"); // 2.5초 후에 시작
            $('.slide_list').animate({marginLeft:'0'},500);
		});
	});
/* 	$(function(){
	}); */
	function hotitem(){
		$("#hotitem").focus();
	}
	function newitem(){
		$("#newitem").focus();
	}
	function bestitem(){
		$("#bestitem").focus();
	}
</script>
</head>
<body  onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<%-- <%@ include file="header.jspf" %> --%>
	<jsp:include page="header.jsp" />

	<!-- content -->
	<div class=container>
		<!-- 메인슬라이드 -->
		<div class="slide">
			<ul class="slide_list">
				<li class="slide1"><img src="img/slide/slide_01.png" alt="슬라이드_이미지1"></li>
				<li class="slide2"><img src="img/slide/slide_02.png" alt="슬라이드_이미지2"></li>
				<li class="slide3"><img src="img/slide/slide_03.png" alt="슬라이드_이미지3"></li>
			</ul>
		</div>
		
		<!-- 아이템별 버튼(HOT, NEW, BEST) -->
		<div class="item">
			<div class="item_button">
				<button type="button" class="btn btn-outline-primary" onclick="hotitem()">HOT ITEM</button>
				<button type="button" class="btn btn-outline-primary" onclick="newitem()">NEW ITEM</button>
				<button type="button" class="btn btn-outline-primary" onclick="bestitem()">BEST ITEM</button>
			</div>
			<!-- HOT ITME -->
			<div id="hotitem" tabindex="0">
				<p>HOT ITEM</p>
				<div class="itembox">
				<table>
				<%-- for문 --%>
					<tr>
						<c:forEach var="vo" items="${hItem}" begin="0" end="2">
						<td>
							<a href="Detailcontroller?type=detail&fId=${vo.fId }&userId=${userId}">
								<img src="img/flower/${vo.fImg }" alt="hot_item01">
								<p>${vo.fName }</p>
								<span>품절임박:${vo.fQuant }개</span>
								<p>가격: ${vo.fPrice }원</p>
							</a>
						</td>
						</c:forEach>
					</tr>
					<tr>
						<c:forEach var="vo" items="${hItem}" begin="3" end="5">
						<td>
							<a href="Detailcontroller?type=detail&fId=${vo.fId }&userId=${userId}">
								<img src="img/flower/${vo.fImg }" alt="hot_item01">
								<p>${vo.fName }</p>
								<span>품절임박:${vo.fQuant }개</span>
								<p>가격: ${vo.fPrice }원</p>
							</a>
						</td>
						</c:forEach>
					</tr>
				</table>
				</div>
			</div>
			
			<!-- NEW ITME -->
			<div id="newitem" tabindex="0" >
				<p>NEW ITEM</p>
				<div class="itembox">
				<table>
					<tr>
						<c:forEach var="vo" items="${nItem}" begin="0" end="2">
						<td>
							<a href="Detailcontroller?type=detail&fId=${vo.fId }&userId=${userId}">
								<img src="img/flower/${vo.fImg }" alt="hot_item01">
								<p>${vo.fName }</p>
								<span>품절임박:${vo.fQuant }개</span>
								<p>가격: ${vo.fPrice }원</p>
							</a>
						</td>
						</c:forEach>
					</tr>
					<tr>
						<c:forEach var="vo" items="${nItem}" begin="3" end="5">
						<td>
							<a href="Detailcontroller?type=detail&fId=${vo.fId }&userId=${userId}">
								<img src="img/flower/${vo.fImg }" alt="hot_item01">
								<p>${vo.fName }</p>
								<span>품절임박:${vo.fQuant }개</span>
								<p>가격: ${vo.fPrice }원</p>
							</a>
						</td>
						</c:forEach>
					</tr>
				</table>
				</div>
			</div>
			
			<!-- BEST ITME -->
			<div id="bestitem" tabindex="0">
				<p>BEST ITEM</p>
				<div class="itembox">
				<table>
					<tr>
						<c:forEach var="vo" items="${bItem}" begin="0" end="2">
						<td>
							<a href="Detailcontroller?type=detail&fId=${vo.fId }&userId=${userId}">
								<img src="img/flower/${vo.fImg }" alt="hot_item01">
								<p>${vo.fName }</p>
								<span>품절임박:${vo.fQuant }개</span>
								<p>가격: ${vo.fPrice }원</p>
							</a>
						</td>
						</c:forEach>
					</tr>
					<tr>
						<c:forEach var="vo" items="${bItem}" begin="3" end="5">
						<td>
							<a href="Detailcontroller?type=detail&fId=${vo.fId }&userId=${userId}">
								<img src="img/flower/${vo.fImg }" alt="hot_item01">
								<p>${vo.fName }</p>
								<span>품절임박:${vo.fQuant }개</span>
								<p>가격: ${vo.fPrice }원</p>
							</a>
						</td>
						</c:forEach>
					</tr>
				</table>
				</div>
			</div>
		</div>
		</div>
	
	<!-- footer -->
	<jsp:include page="footer.jsp" />
<script>

</script>
</body>
</html>















