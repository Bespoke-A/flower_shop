<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% String cPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배달결제창</title>
<!-- jQuery import 방식2(CDN 방식) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- fontawesome(아이콘) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="<%=cPath %>/css/order.css" type="text/css">
<link rel="stylesheet" href="<%=cPath %>/css/default.css">

<script>
$(document).ready(function(){
	setDateBox();
});
function setDateBox(){
	var dt = new Date();
	var hour = new Date();
	
	for(let i = 10; i < 19; i++){
		dt.setHours(i);
		var time = dt.getHours();
		$("#"+i).text(time + "시");
		if(hour.getHours() >= i){
			$("#"+i).attr("disabled",true);
		}
		if(hour.getHours() < i){
			$("#"+i).attr("disabled",false);
		}
	}
			var now_utc = Date.now()
			var timeOff = new Date().getTimezoneOffset()*60000;
			var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
			
			document.getElementById("datepicker").setAttribute("min", today);
}

	function complete(frm) {
		if (!document.userInfo.delDate.value) {
			alert("날짜를 선택하세요.");
			return false;
		}
		frm.action = "<%=cPath %>/Complete"; // 요청
		frm.submit();
	}
	function main_go() {
		location.href="main";
	}
	function selectDate() {
		var now_utc = Date.now()
		var timeOff = new Date().getTimezoneOffset()*60000;
		var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		var selectDay = document.getElementById("datepicker").value
		if(selectDay != today){
			$(".time").attr("disabled",false);
		} else if(selectDay == today) {
			setDateBox();
		}
	}
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="container">
		<div class="order">
		<h2> 결제하기 - [ 배달 ]</h2>
			<form name="userInfo">
				<table class="table">
					<tr>
						<td>  주문자 성함 </td>
						<td> ${mList[0].userName } </td>
					</tr>
					<tr>
						<td> 전화번호 </td>
						<td> ${mList[0].userPhone } </td>
					</tr>
					<tr>
						<td> 주소 </td>
						<td> ${mList[0].userAddr } </td>
					</tr>
					<tr>
						<td>예상 방문 날짜 </td>
						<td>
							<input type="date" name="delDate" id="datepicker" onchange="selectDate()">
						</td>
					</tr>
					<tr>
						<td>예상 방문 시간 </td>
						<td>
							<select name="time" id="time">
								<option selected="selected" disabled>시간선택</option>
								<option class="time" id="10" value="" ></option>
									<option class="time" id="11" value=""></option>
									<option class="time" id="12" value=""></option>
									<option class="time" id="13" value=""></option>
									<option class="time" id="14" value=""></option>
									<option class="time" id="15" value=""></option>
									<option class="time" id="16" value=""></option>
									<option class="time" id="17" value=""></option>
									<option class="time" id="18" value=""></option>
								</select>
						</td>
					<tr>
						<td> 결제금액  </td>
						<td>  ${totMoney} 원 </td>
					</tr>
					<tr>
						<td> 배달비  </td>
						<td> + 3000원 </td>
					</tr>
					<tr>
						<td>결제수단 </td>
						<td>
							<label><input type="radio" name="choice" value="0" checked="checked" /> 카드결제</label>&nbsp;
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="결제하기" onclick="complete(this.form)" class="endBtn">
							<input type="button" value="메인으로" onclick="main_go()" class="endBtn">
						</td>
					<tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

