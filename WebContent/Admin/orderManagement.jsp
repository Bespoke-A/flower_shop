<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<% String cPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역관리</title>
<link rel="stylesheet" href="<%=cPath %>/css/header_footer.css">
<link rel="stylesheet" href="<%=cPath %>/Admin/css/adminNomal.css">
<style>
	#cbtn{
		margin-left: 50px;
		margin-bottom: 7px;
	}
	#completeButton #notCompleteButton{
		margin-right: 5px;
		
	}
</style>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	var begin = '${pvo.begin}';
	var end = '${pvo.end}';
	var pvo = '${pvo}';
	var type = '${type}';
	var cPage = '${cPage}';
		
	function complete(paymentId) {
		location.href = "AdminOrderController?paymentId=" + paymentId + "&begin=" + begin + "&end=" + end + "&type="+type;
	}

	function orderMngmt(type) {
		location.href = "orderPaging?type=" + type + "";
	}
		$.ajax("AdminOrderController", {
			type : "get",
			data : "complete=" + encodeURIComponent(type)+"&begin=" + encodeURIComponent(begin)+"&end=" + encodeURIComponent(end),
			dataType : "json",
			success : function(data) {
				let htmlTag = "";
				let htmlTagHead = "";
				let alist = data.list;
				$.each(alist, function() {
					htmlTagHead = this.complete
					htmlTag += "<tr class='ajaxTable'>"
					htmlTag += "<td>" + this.paymentId + "</td>"
					htmlTag += "<td>" + this.pickDel + "</td>"
					htmlTag += "<td>" + this.paymentSudan + "</td>"
					htmlTag += "<td>" + this.userName + "</td>"
					htmlTag += "<td>" + this.userPhone + "</td>"
					htmlTag += "<td>" + this.userAddr + "</td>"
					htmlTag += "<td>" + this.fId + "</td>"
					htmlTag += "<td>" + this.cnt + "</td>"
					htmlTag += "<td>" + this.totPrice + "</td>"
					htmlTag += "<td>" + this.paymentDate + "</td>"
					htmlTag += "<td>" + this.pickDay + "</td>"
					htmlTag += "<td>" + this.delDay + "</td>"
					if(this.complete === "배달 & 픽업 미완료 내역"){
						let paymentId = this.paymentId;
						htmlTag += "<td><button class='completeBtn' onclick='complete(" + paymentId + ")'>" 
								+ this.button + "</button></td>"
					}
					htmlTag += "</tr>"
					if(htmlTagHead == "배달 & 픽업 미완료 내역"){
						$(".show").show();
					}
					if(htmlTagHead == "배달 & 픽업 완료 내역"){
						$(".hide").hide();
					}
				});
				if(htmlTagHead == "배달 & 픽업 완료 내역" && type == 0){
						alert("미완료 내역이 없습니다.");
						
				}
				if(htmlTagHead == "배달 & 픽업 미완료 내역" && type == 1){
					alert("완료 내역이 없습니다.");
					
			}
				$("#showTable").html(htmlTag);
				$("#showHead").html(htmlTagHead);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("내역이 없습니다.");
			}
		});
	//}

</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	<jsp:include page="adminDropdown.jsp" />
	<h2 id="showHead"></h2>
	<div id="cbtn">
		<button id="completeButton" onclick="orderMngmt(1)">완료 리스트</button>
		<button id="notCompleteButton" onclick="orderMngmt(0)">미완료 리스트</button>
	</div>
	<div id="tableBox">
	<table id="order">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>픽업/배달</th>
				<th>결제수단</th>
				<th>이름</th>
				<th>연락처</th>
				<th>주소</th>
				<th>품명</th>
				<th>수량</th>
				<th>금액</th>
				<th>주문일자</th>
				<th>픽업예정일</th>
				<th>배달예정일</th>
				<th class="hide show">완료하기</th>
			</tr>
		</thead>
		<tbody id="showTable">

		</tbody>
		<tfoot>
			<tr id=footer>
				<td colspan="12">
					<div class="footer">
						<ol class="paging">
							<%-- [이전으로]에 대한 사용가능 여부 처리 --%>
							<c:if test="${pvo.beginPage == 1 }">
								<li class="disable">이전</li>
							</c:if>
							<c:if test="${pvo.beginPage != 1 }">
								<li><a
									href="orderPaging?cPage=${pvo.beginPage - 1 }&type=${type}">이전</a></li>
							</c:if>
							<%-- 블록내에 표시할 페이지 태그 작성(시작~끝 페이지) --%>
							<c:forEach var="pageNo" begin="${pvo.beginPage }"
								end="${pvo.endPage }">

								<c:if test="${pvo.nowPage == pageNo }">
									<li class="now">${pageNo }</li>
								</c:if>

								<c:if test="${pvo.nowPage != pageNo }">
									<li><a
										href="orderPaging?cPage=${pageNo }&type=${type}">${pageNo }</a></li>
								</c:if>

							</c:forEach>

							<%-- [다음으로]에 대한 사용가능 여부 처리 --%>
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable">다음</li>
							</c:if>
							<c:if test="${pvo.endPage < pvo.totalPage }">
								<li><a
									href="orderPaging?cPage=${pvo.endPage + 1 }&type=${type}">다음</a></li>
							</c:if>
						</ol>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
	</div>
		<jsp:include page="adminFooter.jsp" />
</body>
</html>