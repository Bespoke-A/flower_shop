<%@page import="com.project.flower.detail.vo.DetailVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cPath=request.getContextPath(); %>
<%
	String userId = (String) session.getAttribute("userId");
	System.out.println("userId : " + userId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- fontawesome(아이콘) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="<%=cPath %>/css/detail.css" type="text/css">
<link rel="stylesheet" href="<%=cPath %>/css/default.css">
<style>
input::-webkit-inner-spin-button {
  appearance: none;
  -moz-appearance: none;
  -webkit-appearance: none;
  
}
</style>
<script>
	let fId = '${vo.fId}';
	let fName = '${vo.fName }';
	let fPrice = '${vo.fPrice }';
	let userId = '${userId}';
	let fThumbnail = '${vo.fThumbnail}';
	let tot = 0;
	 function minus() {
		let tot = "${vo.fOrderprice }";
		var orderNum = $('#orderNum').val().trim();
		var quant = '${vo.fQuant}';
		/* var orderNum = document.getElementById('orderNum'); */
		if (orderNum < 2) {
			$("#minus").attr("disabled", true);
		} 
		if (orderNum >= 2 || orderNum == 0) {
			$("#minus").attr("disabled", false);
		}
		if (orderNum <= quant) {
			$("#plus").attr("disabled", false);
		}
		if (orderNum > 1) {
	         orderNum = parseInt(orderNum) - 1;
	    }
		document.getElementById('orderNum').value = orderNum;
		tot = tot * orderNum;
		$("#tot").text(tot);
	} 
	function plus() {
		$("#minus").attr("disabled", false);
		let tot = "${vo.fOrderprice }";
		var orderNum = $('#orderNum').val().trim();
		var quant = ${vo.fQuant};
		
		
		if (orderNum >= quant) {
			$("#plus").attr("disabled", true);
		} else {
			orderNum = parseInt(orderNum) + 1;
		}
		document.getElementById('orderNum').value = orderNum;
		tot = tot * orderNum;
		$("#tot").text(tot);
	}
	function cart_go() { // 남열님이 전달 받을 데이터 
		let fOrderNum = $('#orderNum').val().trim();
		let totPrice = $("#tot").html();
		if(userId == ""){
			location.href="<%=cPath %>/login/login.jsp";
		}else{
			alert("상품을 장바구니에 담았습니다.");
			location.href = "<%=cPath %>/Cart?fId=" + fId  + "&fPrice=" + fPrice + "&fThumbnail=" + fThumbnail + "&totPrice=" + totPrice + "&fOrderNum=" + fOrderNum + "&style=cart&fQuant=${vo.fQuant }";
		}
	}
	function cart_Buy() { // 남열님이 전달 받을 데이터 
		let fOrderNum = $('#orderNum').val().trim();
		let totPrice = $("#tot").html();
		if(userId == ""){
			location.href="<%=cPath %>/login/login.jsp";
		}else{
			location.href = "<%=cPath %>/Cart?fId=" + fId  + "&fPrice=" + fPrice + "&fThumbnail=" + fThumbnail + "&totPrice=" + totPrice + "&fOrderNum=" + fOrderNum + "&style=buy&fQuant=${vo.fQuant }";
		}
	}
</script>

</head>
<body>
	<jsp:include page="../main/header.jsp" />
		<div class="detail">
			<div class="info">
				<img alt="flower" src="<%=cPath %>/detail/images/${vo.fImg }" width="400" height="400">
				<div class="text">
					<p class="name">${vo.fName }</p>
					<p id="price">가격 : ${vo.fPrice }원 &nbsp;<span id="quant">(주문가능 수량 : ${vo.fQuant })</span></p>
					<br>
					<p id="flowerInfo">꽃 정보</p>
					<p>${vo.fInfo }</p>
				</div>
			</div>
			<div class="orderBtn">
				<div class="cnt">
					<button id="minus" onclick="javascript:minus();" disabled><img alt="minusBtn" src="detail/logo/dash-lg.svg"></button>
					<input type="number" value="${vo.fOrderNum }" id="orderNum" min="1" max="${vo.fQuant }" readonly>
					<button id="plus" onclick="javascript:plus();" ><img alt="plusBtn" src="detail/logo/plus-lg.svg"></button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="orderPrice">총 주문금액 : <span id="tot">${vo.fOrderprice }</span></span>
				</div>
				<div class="btn">
					<p><input type="button" value="구매하기" onclick="cart_Buy()">
					<input type="button" value="장바구니" onclick="cart_go()"></p>
					<input type="hidden" value="${userId }">
				</div>
			</div>
		</div>
		
		<div class="detail">
			<p class="name">${vo.fName } 리뷰</p>
			<c:choose>
				<c:when test="${!empty list }">
			<c:forEach var="rvo" items="${list }">
				<c:if test="${rvo.cComment != null}">
				<div id="review">
					<p><span id="comment">작성자</span> : ${rvo.userId } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span id="comment">작성날짜</span> : ${rvo.commentDate }</p>
					<p><span id="comment">평점</span> : ${rvo.fStarpoint } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span id="comment">리뷰 내용</span> : ${rvo.cComment }</p>
					<c:choose>
						<c:when test="${rvo.adminComment == '0'}">
							<p>&nbsp;&nbsp;ㄴ 담당자 댓글이 없습니다.</p>
						</c:when>
						<c:otherwise>
							<p>&nbsp;&nbsp;ㄴ<span id="comment"> 담당자</span> : ${rvo.adminComment }</p>
						</c:otherwise>
					</c:choose>
				</div>
				</c:if>
			</c:forEach>
				</c:when>
				<c:otherwise>
					<P id="emptyReview">작성된 리뷰가 없습니다.</P>
				</c:otherwise>
				</c:choose>
		</div>
	
	<jsp:include page="../main/footer.jsp" />
</body>
</html>