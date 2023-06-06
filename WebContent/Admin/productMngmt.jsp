<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장관리</title>
<link rel="stylesheet" href="<%=cPath %>/css/header_footer.css">
<link rel="stylesheet" href="<%=cPath %>/Admin/css/adminNomal.css">
<style>
	input{
		text-align: center;
		width: 100%;
	    border: none;
	    resize: none;
	}
	#order tr:nth-child(even){background-color: #f2f2f2;}
	#order tr:nth-child(even) input {background-color: #f2f2f2;}
	#order tr:hover {background-color: #ddd;}
	#order tr:hover input {background-color: #ddd;}
	#order:eq(4){
		width: 10%;
	}
	.active{
		color: red;
	}
</style>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	var begin = '${pvo.begin}';
	var end = '${pvo.end}';
	var pvo = '${pvo}';
	var category = 0;
	var cPage = '${pvo.nowPage}'
	if('${category}' != ""){
		category = '${category}';
	} else {
		category = 0;
	}
	function modify_go (fId){
		let fQuant = $("td:contains(" + fId + ")").siblings("td:eq(6):first").children(":first").val();
		let fPrice = $("td:contains(" + fId + ")").siblings("td:eq(5):first").children(":first").val();
		location.href="modifyGo?fQuant="+fQuant+"&fPrice="+fPrice+"&fId="+fId+"&fCategory="+category+"&cPage="+cPage;
	}
	function delete_go (fId){
		let answer = confirm("정말 삭제할까요?");
		if (answer) {
			alert("삭제되었습니다.");
			location.href="deleteGo?fId="+fId;
		} else {
			alert("삭제요청이 취소되었습니다.");
		}
	}
	function fInfoModify_go(fId){
		$(".textarea").attr("readonly", false);
		$("td:contains(" + fId + ")").siblings("td:eq(3):first").children(":first").focus();
	}
	function fInfoModify_ok(fId){
		let fInfo = $("td:contains(" + fId + ")").siblings("td:eq(3):first").children(":first").val();
		$(".textarea").attr("readonly", true);
		location.href="modifyGo?fId="+fId+"&fInfo="+fInfo+"&fCategory="+category+"&cPage="+cPage;
	}
	function fPriceMaxLength(e) {
		if(e.value.length > e.maxLength){
            e.value = e.value.slice(0, e.maxLength);
        }
	}
	function fQuantMaxLength(e) {
		if(e.value.length > e.maxLength){
            e.value = e.value.slice(0, e.maxLength);
        }
	}
	function img_go(fId){
		let file = $("td:contains(" + fId + ")").siblings("td:eq(1):first").children(":last").val().split("\\");
		let imgName = file[file.length-1];
		location.href="modifyGo?fId="+fId+"&fImg="+imgName+"&fCategory="+category+"&cPage="+cPage;
	}
	function thumb_go(fId){
		let file = $("td:contains(" + fId + ")").siblings("td:eq(2):first").children(":last").val().split("\\");
		let thumbName = file[file.length-1];
		location.href="modifyGo?fId="+fId+"&fThumbnail="+thumbName+"&fCategory="+category+"&cPage="+cPage;
	}
	//function getProductList(category) {
		$.ajax("GetProductList", {
			type : "get",
			//data : "category=" + encodeURIComponent(category),
			data : "category=" + encodeURIComponent(category)+"&begin=" + encodeURIComponent(begin)+"&end=" + encodeURIComponent(end),
			dataType : "json",
			success : function(data) {
				//console.log(data.list);
				let htmlTag = "";
				let htmlTagHead = "";
				let alist = data.list;
				$.each(alist, function() {
					htmlTagHead = this.fCategory
					htmlTag += "<tr>"
					htmlTag += "<td>'" + this.fId + "'</td>"
					htmlTag += "<td>" + this.fName + "</td>"
					htmlTag += "<td><a href='flower/photo/"+this.fImg+"'>" + this.fImg + "</a><br><br>"
							+ "<input type='file' name='img' class='img' onchange='img_go(\""+this.fId+"\")'></td>"
							
					htmlTag += "<td><img src='flower/thumb/"+this.fThumbnail+"'/><br>" + this.fThumbnail + "<br>"
							+ "<input type='file' name='thumb' class='thumb' onchange='thumb_go(\""+this.fId+"\")'></td>"
					htmlTag += "<td><textarea class='textarea' name='fInfo'rows='5' cols='30' readonly>" + this.fInfo + "</textarea><br>"
							+ "<button onclick='fInfoModify_go(\""+this.fId+"\")'>" + "설명 수정" + "</button>"+'&nbsp;&nbsp;&nbsp;&nbsp;'
							+ "<button onclick='fInfoModify_ok(\""+this.fId+"\")'>" + "설명 저장" + "</button></td>"
					htmlTag += "<td>" + this.fStarpoint + "</td>"
					//htmlTag += "<td>" + this.fPrice + "</td>"
					htmlTag += "<td><input type='number' name='fPrice' oninput='fPriceMaxLength(this)' maxlength='6' step='1000' value='" + this.fPrice + "'></td>"
					//htmlTag += "<td>" + this.fQuant + "</td>"
					htmlTag += "<td><input type='number' name='fQuant' oninput='fQuantMaxLength(this)' maxlength='3' value='" +  this.fQuant + "'></td>"
					
					htmlTag += "<td><button class='modifyBtn' onclick='modify_go(\""+this.fId+"\")'>" + this.button + "</button></td>"
					htmlTag += "<td><button class='deleteBtn' onclick='delete_go(\""+this.fId+"\")'>" + this.button2 + "</button></td>"
					
					htmlTag += "</tr>"
				});
				$("#showTable").html(htmlTag);
				$("#showHead").html(htmlTagHead);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Ajax 처리 실패 : \n" + "jqXHR.readyState : "
						+ jqXHR.readyState + "\n" + "textStatus : "
						+ textStatus + "\n" + "errorThrown : " + errorThrown);
				console.log("Ajax 처리 실패 : \n" + "jqXHR.readyState : "
						+ jqXHR.readyState + "\n" + "textStatus : "
						+ textStatus + "\n" + "errorThrown : " + errorThrown);
			}
		});
	//}
	
</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	<jsp:include page="adminDropdown.jsp" />
	<h2 id="showHead"></h2>
	<div id="productMenu">
		<div>
			<a id="sg" href="productPaging?category=0&cPage=1">꽃한송이 / </a>
			<a id="bk" href="productPaging?category=1&cPage=1">꽃다발 / </a>
			<a id="bs" href="productPaging?category=2&cPage=1">화분 / </a>
			<a id="bk" href="productPaging?category=3&cPage=1">꽃바구니</a>
		</div>
	</div>
	<div id="tableBox">
		<table id="order">
			<thead>
				<tr>
					<th width="5%">코드</th>
					<th>이름</th>
					<th width="10%">이미지</th>
					<th width="10%">썸네일</th>
					<th>설명</th>
					<th>별점</th>
					<th width="10%">가격수정</th>
					<th width="10%">수량수정</th>
					<th width="10%">가격, 수량 데이터 저장</th>
					<th>상품삭제</th>
				</tr>
			</thead>
			<tbody id="showTable">
	
			</tbody>
				<tfoot>
					<tr>
						<td colspan="12">
							<div class="footer">
							<ol class="paging">
							<%-- [이전으로]에 대한 사용가능 여부 처리 --%>
							<c:if test="${pvo.beginPage == 1 }">
								<li class="disable">이전</li>
							</c:if>
							<c:if test="${pvo.beginPage != 1 }">
								<li><a href="productPaging?cPage=${pvo.beginPage - 1 }&category=${category}">이전</a></li>
							</c:if>
							<%-- 블록내에 표시할 페이지 태그 작성(시작~끝 페이지) --%>
							<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
							
								<c:if test="${pvo.nowPage == pageNo }">
									<li class="now">${pageNo }</li>
								</c:if>
								
								<c:if test="${pvo.nowPage != pageNo }">
									<li><a href="productPaging?cPage=${pageNo }&category=${category}">${pageNo }</a></li>
								</c:if>
								
							</c:forEach>	
								
							<%-- [다음으로]에 대한 사용가능 여부 처리 --%>
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable">다음</li>
							</c:if>	
							<c:if test="${pvo.endPage < pvo.totalPage }">
								<li><a href="productPaging?cPage=${pvo.endPage + 1 }&category=${category}">다음</a></li>
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