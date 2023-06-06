<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<style>
	.detail {
		padding-left: 100px;
	}
	.fNum {
	 	box-shadow: none;
		text-align: center;
		width: 100px;
		height: 20px;
		padding: 11px 0 9px 0; 
		font-size: 15px;
		font-weigth: bold;
		border: 1px solid #eee;
	}
	.info {
		display: flex;
		/* align-items: center; */
		vertical-align: middle;
	}
	.center {
		font-size: 25px;
		margin-right:10px;
	}
	.cnt {
		margin-top: 10px;
	}
</style>
</head>
<body>
	<div class="detail">
	<div class="info">
	<img alt="flower" src="./images/${vo.fImg }" width="400" height="400">
		<div class="text">
			<p class="center">${vo.fName }</p>
			<p>${vo.fPrice }원</p>
			<p>주문가능 수량 : ${vo.fQuant } </p>
			<p>${vo.fInfo }</p>
		</div>
	</div>
	<div class="cnt">
		<img alt="minusBtn" src="./logo/dash-lg.svg" width="16" height="16">
		<input type="text" value="1" class="fNum">
		<img alt="plusBtn" src="./logo/plus-lg.svg" width="16" height="16">
		&nbsp;&nbsp;&nbsp; 총 주문금액 : ${vo.fOrderprice }
	</div>
	<p><input type="button" value="구매하기">
	<input type="button" value="장바구니"></p>
	</div>
	
</body>
</html>