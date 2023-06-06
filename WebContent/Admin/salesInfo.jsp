<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<% String cPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 관리</title>
<link rel="stylesheet" href="<%=cPath %>/css/header_footer.css">
<link rel="stylesheet" href="<%=cPath %>/Admin/css/adminNomal.css">
<style>
	#chart{
		display: flex;
  		justify-content: center;
	}
	#showHead{
		margin-left: 70%;
		margin-bottom: 10px;
	}
	#info{
		margin-left: 3%;
		margin-top: 30px;
	}
	#month{
		margin-top: 10px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<script>
	$(document).ready(function(){
		setDateBox();
		$("#chart").hide();
	});
	function setDateBox(){
		var dt = new Date();
		var date = dt.getDate();  // 날짜
		var year = dt.getFullYear();
		$("#year").append("<option selected disabled>년도</option>");
		for(var y = (year); y <= (year+5); y++){
			$("#year").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
		}
		$("#month").append("<option selected disabled>월</option>");
		for(var i = 1; i <= 12; i++){
			if(String(i).length == '1') {
				$("#month").append("<option value='"+"0" + i +"'>"+"0" + i + "" +"</option>");
			}else{
				$("#month").append("<option value='"+ i +"'>"+ i + "</option>");
			}
		}
		$("#day").val(date);
	}
	function date_go(value){
		$("#chart").hide();
		if(value.length == '1') {
			value = '0' + value;
		}
		$.ajax("SalesInfoController", {
			type : "get",
			data : "day=" + encodeURIComponent(value),
			dataType : "json",
			success : function(data) {
				let htmlTag = "";
				let htmlTagHead = "";
				let tot = 0;
				let alist = data.list;
				$.each(alist, function() {
					htmlTagHead2 = this.day
					htmlTag += "<tr>"
					htmlTag += "<td>" + this.year + "</td>"
					htmlTag += "<td>" + this.month + "</td>"
					htmlTag += "<td>" + this.day + "</td>"
					htmlTag += "<td>" + this.fId + "</td>"
					htmlTag += "<td>" + this.fName + "</td>"
					htmlTag += "<td>" + this.fPrice + "</td>"
					htmlTag += "<td>" + this.cnt + "</td>"
					htmlTag += "<td>" + this.totalPrice + "</td>"
					tot += this.totalPrice
				});
					$("#showTable").html(htmlTag);
					$("#showHead").html("금일 " + " 판매액 : " + tot + " 원");
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(value + "일 매출 데이터가 없습니다. ");
				}
			});
	}
	function month_go() {
		let val = $("#month").val()
		$.ajax("SalesInfoController", {
			type : "get",
			async:false,
			data : "month=" + encodeURIComponent(val),
			dataType : "json",
			success : function(data) {
				let htmlTag = "";
				let htmlTagHead = "";
				let tot = 0;
				let alist = data.list;
				$.each(alist, function() {
					htmlTagHead = this.month
					htmlTag += "<tr>"
					htmlTag += "<td>" + this.year + "</td>"
					htmlTag += "<td>" + this.month + "</td>"
					htmlTag += "<td class='date'>" + this.day + "</td>"
					htmlTag += "<td>" + this.fId + "</td>"
					htmlTag += "<td>" + this.fName + "</td>"
					htmlTag += "<td>" + this.fPrice + "</td>"
					htmlTag += "<td>" + this.cnt + "</td>"
					htmlTag += "<td>" + this.totalPrice + "</td>"
					tot += this.totalPrice
				});
					$("#showTable").html(htmlTag);
					$("#showHead").html(htmlTagHead + " 월 " + " 판매액 : " + tot + " 원");
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("해당 월 매출 데이터가 없습니다. ");
				}
			});
	
	}
	var gbl_data;
	function year_go() {
		let val = $("#year").val();
		$.ajax("SalesInfoController", {
			type : "get",
			async:false,
			data : "year=" + encodeURIComponent(val),
			dataType : "json",
			success : function(data) {
				let htmlTag = "";
				let htmlTagHead = "";
				let tot = 0;
				let alist = data.list;
				let index = "";
				$.each(alist, function(index,sales) {
					htmlTagHead = this.year
					htmlTag += "<tr>"
					htmlTag += "<td>" + this.year + "</td>"
					htmlTag += "<td class='month'>" + this.month + "</td>"
					htmlTag += "<td>" + this.day + "</td>"
					htmlTag += "<td>" + this.fId + "</td>"
					htmlTag += "<td>" + this.fName + "</td>"
					htmlTag += "<td>" + this.fPrice + "</td>"
					htmlTag += "<td>" + this.cnt + "</td>"
					htmlTag += "<td>" + this.totalPrice + "</td>"
					tot += this.totalPrice
				});
					$("#showTable").html(htmlTag);
					$("#showHead").html(htmlTagHead + " 년 " + " 판매액 : " + tot + " 원");
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("해당 년도 매출 데이터가 없습니다. ");
				}
			});
		

	}
	/* let table = document.getElementById("data");
	let apr = Number(0);
	let lenght = table.rows.length;
    for(let i = 1; i < table.rows.length; i++)  {
    	apr += Number(table.rows[i].cells[7].innerHTML);
    } */
	function yearGraph_go(){ // 해당년도 월데이터 그래프
    	$("#chart").show();
    	let $month = 0;
    	var yValues = [];
    	var xValues = [];
    	for(let i = 1; i <= 12; i++){
    		if(i<10){
    			$month = $(".month:contains(0" + i + ")");
    		} else {
    			$month = $(".month:contains(" + i + ")");
    		}
    		let $monthSales = 0;
    		$month.each(function(idx, element){
                console.log(this);
                console.log(">> idx : " + idx + ", this : " + $(this).html());
                $(this).prop("id","para-" + idx);
                $monthSales += Number($(this).siblings("td:eq(06)").text());
            });
    		xValues.push(i + "월");
    		yValues.push($monthSales)
    		console.log(yValues);
    	}
		var barColors = ["red", "green","blue","orange","brown","yellow","black","gray","tomato","olive","purple","pink"];
			new Chart("myChart", {
				  type: "bar",
				  data: {
				    labels: xValues,
				    datasets: [{
				      backgroundColor: barColors,
				      data: yValues
				    }]
				  },
				  options: {
				    legend: {display: false},
				    title: {
				      display: true,
				      text: ""
				    }
				  }
				});
	}
    
    function monthGraph_go(){ //해당월 일데이터 그래프
    	$("#chart").show();
    	let $date = 0;
    	var yValues = [];
    	var xValues = [];
    	var barColors = [];
    	for(let i = 1; i <= 31; i++){
    		if(i<10){
    			$date = $(".date:contains(0" + i + ")");
    		} else {
    			$date = $(".date:contains(" + i + ")");
    		}
    		let $dateSales = 0;
    		$date.each(function(idx, element){
               // console.log(this);
                //console.log(">> idx : " + idx + ", this : " + $(this).html());
                $(this).prop("id","para-" + idx);
                $dateSales += Number($(this).siblings("td:eq(06)").text());
            });
    		xValues.push(i + "일");
    		yValues.push($dateSales);
    		barColors.push("purple");
    		console.log(yValues);
    	}
		
		//var barColors = ["purple"];
			new Chart("myChart", {
				  type: "bar",
				  data: {
				    labels: xValues,
				    datasets: [{
				      backgroundColor: barColors,
				      data: yValues
				    }]
				  },
				  options: {
				    legend: {display: false},
				    title: {
				      display: true,
				      text: ""
				    }
				  }
				});
	}
    
</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	<jsp:include page="adminDropdown.jsp" />
	<div id="info">
		<h2>매출 정보</h2>
	  <select name="year" id="year">
	  </select>
	  <button id="year_graph" onclick="year_go(); yearGraph_go();">년도 데이터 보기</button>&nbsp;&nbsp;&nbsp;&nbsp;
  	  <select name="month" id="month" >
	  </select>
	  <button id="month_graph" onclick="month_go(); monthGraph_go();">월 데이터 보기</button>&nbsp;&nbsp;&nbsp;&nbsp;
	  <button id="day" onclick="date_go(this.value)">금일 데이터 보기</button>
	</div>
	  <br><br> 
	  <h2 id="showHead"></h2>
	  <div id="chart">
	  <canvas id="myChart" style="width:100%;max-width:1300px"></canvas>
	  </div>
	  <div id="tableBox">
		<table id="order">
			<thead>
				<tr>
					<th>년</th>
					<th>월</th>
					<th>일</th>
					<th>코드</th>
					<th>이름</th>
					<th>가격</th>
					<th>수량</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody id="showTable">
	
			</tbody>
		</table>
	  </div>
		<jsp:include page="adminFooter.jsp" />	
</body>
</html>