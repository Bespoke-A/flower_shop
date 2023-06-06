<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cPath=request.getContextPath(); %>
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

<link rel="stylesheet" href="<%=cPath %>/css/cart.css" type="text/css">
<link rel="stylesheet" href="<%=cPath %>/css/default.css">

<!-- fontawesome(아이콘) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script>
/* 	window.history.forward(); function noBack(){ 
		window.history.forward();
	} */

	function searchParam(key) {
		return new URLSearchParams(location.search).get(key);
	};
	var id = searchParam('userId');
	var list = searchParam('list');
	let sum = 0;
	let result = 0;
	let valSum = 0;
	var arrValues = new Array();
	
	function fnCalCount(type, ths, price, quant){
	    var $input = $(ths).parents("td").find("input[name='pop_out']");
	    var totalPrice = $(ths).parents("td").parents("tr").find('.totalPrice');
	    var tCount = Number($input.val());
	    var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html());
	    if(type=='p'){
	        if(tCount < quant) $input.val(Number(tCount)+1);
	    }else{
	        if(tCount >1) $input.val(Number(tCount)-1);    
	   	}
	    let sum = price * Number($input.val());
	    console.log(totalPrice);
	    totalPrice.html(sum);
	}
	
	function payStart() {
		var radioVal = $('input[name=choice]:checked').val();
		if (radioVal == null) {
			alert("주문 방법을 선택하세요");
			return;
		}
		let val = document.getElementById('values').value
		doSum();
		location.href="<%=cPath %>/payStart?radioVal=" + radioVal + "&totMoney=" + result + "&arrValues=" + arrValues;
	}

	function main_go() {
		location.href="main";
	}
	
	function doSum(){
		oneResult = 0;
		result = 0;
		
		 // 합계 계산
		for(let i = 0; i < $('.totalPrice').length; i++	)  {
			let total = $('.totalPrice')[i];
			oneResult = Number($(total).html());
			result += Number($(total).html());
			arrValues.push(oneResult);
		}
		console.log(result);
		console.log(arrValues);
	}
	
	function deleteOne(fid) {
		alert("삭제되었습니다");
		location.href="<%=cPath %>/DeleteOne?fid=" + fid + "&fQuant='${fQuant}''";
	}
	
	function NotReload(){
	    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
	        event.keyCode = 0;
	        event.cancelBubble = true;
	        event.returnValue = false;
	    } 
	}
	document.onkeydown = NotReload;
	
</script>
</head>
<body id="dispData" onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<jsp:include page="../main/header.jsp" />
	<div class="container">
		<div id="cartAll">
		<h2>[ ${userName } ] 회원님의 장바구니 입니다</h2>
			<form name="userInfo">
			<hr>
				<table class="table">
					<c:if test="${empty cList }" >
						<tr><td colspan="4" rowspan="3">장바구니에 상품이 없습니다</td></tr>
					</c:if>
					<c:if test="${not empty cList }" >
					<c:forEach var="vo" items="${cList }" >
						<tbody  id="body1" class="body" >
							<tr>
								<td colspan="3"><div id="fname"><img src="<%=cPath %>/Admin/flower/thumb/${vo.fThumbnail }"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 상품명 : ${vo.fName }</div></td>
								<td rowspan="2" id="tableBtn">
									<input type="button" class="deleteBtn cartBtn" value="삭제" onclick="deleteOne('${vo.fId}')" />
								</td>
							</tr>
							<tr>
								<td><div id="price"><span>상품 가격 : </span>${vo.fPrice }</div></td>
								<td>
								         <button type="button" id="minus" onclick="fnCalCount('m', this, ${vo.fPrice}, ${vo.fQuant });"><img alt="minusBtn" src="<%=cPath %>/detail/logo/dash-lg.svg"></button>
								        <input type="text" id="values" name="pop_out" value="${vo.cntCart }" readonly="readonly" style="text-align:center" size="1"/>
										<button type ="button" id="plus" onclick="fnCalCount('p', this, ${vo.fPrice}, ${vo.fQuant });"><img alt="plusBtn" src="<%=cPath %>/detail/logo/plus-lg.svg"></button>
								</td>
								<td class="totalmoney">
									<div id="price">총 주문금액 : <span class="totalPrice">${vo.totPrice }</span></div>
								</td>
							</tr>
						</tbody>
					</c:forEach>
					</c:if>
					<tfoot>
						<tr>
							<td></td><td></td>
							<td rowspan="2">
								<label><input type="radio" class="radioBtn" name="choice" value="1" /> 픽업</label>&nbsp;
								<label><input type="radio" class="radioBtn" name="choice" value="0" /> 배달</label></td>
							<td>
								<input type="button" class="cartBtn" value="결제" onclick="payStart()">
								<input type="button" class="cartBtn" value="메인으로" onclick="main_go()">
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

