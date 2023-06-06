<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장관리</title>
<link rel="stylesheet" href="<%=cPath %>/css/header_footer.css">
<link rel="stylesheet" href="<%=cPath %>/Admin/css/adminSmall.css">
<style>
input::-webkit-inner-spin-button {
  appearance: none;
  -moz-appearance: none;
  -webkit-appearance: none;
  
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	function addProduct_go(form){
		if(true == category_chk(form) &&
		   true == fId_chk(form) &&
		   true == fName_chk(form) &&
		   true == fPrice_chk(form) &&
		   true == fQuant_chk(form) &&
		   true == fInfo_chk(form) 
		   ){
			form.submit();
			
		}
		
	}
	function fQuantMaxLength(e) {
		 if(e.value.length > e.maxLength){
	            e.value = e.value.slice(0, e.maxLength);
	        }
	}
	function fPriceMaxLength(e) {
		 if(e.value.length > e.maxLength){
	            e.value = e.value.slice(0, e.maxLength);
	        }
	}
	function category_chk(form) {
		let chk = true;
		let category = form.category.value;
		if (category.trim() == "") {
			alert("카테고리를 입력하세요");
			form.category.focus();
			chk = false;
		} return chk;
	}
	function fId_chk(form) {
		let chk = true;
		let fId = form.fId.value;
		if (fId.trim() == "") {
			alert("코드를 입력하세요");
			form.fId.focus();
			chk = false;
		} return chk;
	}
	function fName_chk(form) {
		let chk = true;
		let fName = form.fName.value;
		if (fName.trim() == "") {
			alert("이름을 입력하세요");
			form.fName.focus();
			chk = false;
		} return chk;
	}
	function fPrice_chk(form) {
		let chk = true;
		let fPrice = form.fPrice.value;
		if (fPrice.trim() == "") {
			alert("가격을 입력하세요");
			form.fPrice.focus();
			chk = false;
		} 
		return chk;
	}
	function fQuant_chk(form) {
		let chk = true;
		let fQuant = form.fQuant.value;
		if (fQuant.trim() == "") {
			alert("수량을 입력하세요");
			form.fQuant.focus();
			chk = false;
		}
		return chk;
	}
	function fInfo_chk(form) {
		let chk = true;
		let content = document.querySelector('#textarea').value; //textarea 값 
		if (content.trim() == "") {
			alert("내용을 입력하세요");
			form.textarea.focus();
			chk = false;
		} return chk;
	}
</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	<jsp:include page="adminDropdown.jsp" />
	<h2 id="showHead">상품추가</h2>
	<form action="addProduct_ok.jsp" method="post" enctype="multipart/form-data">
		<div id="tableBox">
		<table id="order">
			<tbody>
				<tr>
					<th>카테고리</th>
					<td>
						꽃송이<input type="radio" name="category" value="0">
						꽃다발<input type="radio" name="category" value="1">
						화분<input type="radio" name="category" value="2">
						꽃바구니<input type="radio" name="category" value="3">
					</td>
				</tr>
				<tr>
					<th>코드 :</th>
					<td><input type="text" name="fId"></td>
				</tr>
				<tr>
					<th>이름 :</th>
					<td><input type="text" name="fName"></td>
				</tr>	
				<tr>
					<th>가격 :</th>
					<td><input type="number" name="fPrice" oninput="fPriceMaxLength(this)" maxlength="6"></td>
				</tr>
				<tr>
					<th>수량 :</th>
					<td><input type="number" name="fQuant" oninput="fQuantMaxLength(this)" maxlength="3"></td>
				</tr>
				<tr>
					<th>정보 :</th>
					<td>
						<textarea id="textarea" name="fInfo" rows="10" cols="60"></textarea>
					</td>
				</tr>
				<tr>
					<th>이미지파일 : </th>
					<td><input type="file" name="fImg" ></td>
				</tr>
				<tr>
					<th>썸네일파일 : </th>
					<td><input type="file" name="fThumbnail" ></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="추가하기" onclick="addProduct_go(this.form)">
						<input type="reset" value="초기화">
					</td>
				</tr>
			</tfoot>
		</table>
		</div>
	</form>
	<jsp:include page="adminFooter.jsp" />
</body>
</html>