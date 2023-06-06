<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String cPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cPath %>/Admin/css/adminSmall.css">
<link rel="stylesheet" href="<%=cPath %>/css/header_footer.css">
<style>
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	function adminComment_go(reviewNum) {
		let adminComment = $(".textarea").val()
		console.log(reviewNum);
		location.href="reviewMngmt?adminComment="+adminComment+"&reviewNum="+reviewNum;
	}
</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	<jsp:include page="adminDropdown.jsp" />
	<h2 id="showHead">관리자 답글</h2>
	<div>
		<div id="tableBox">
			<table id="order">
				<thead>
					<tr>
						<th>리뷰번호</th>
						<td>${rvo.reviewNum}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${rvo.userId }</td>
					</tr>
					<tr>
						<th>구매제품</th>
						<td>${rvo.fId }</td>
					</tr>
					<tr>
						<th>별점</th>
						<td>${rvo.fStarpoint }</td>
					</tr>
					<tr>
						<th>리뷰일자</th>
						<td>${rvo.commentDate }</td>
					</tr>
					<tr>
						<th>리뷰</th>
						<td>${rvo.cComment }</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th colspan="2">관리자 답글</th>
					</tr>
					<tr>
						<td colspan="2">
							<textarea class="textarea" rows="" cols="5"></textarea>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="작성" onclick="adminComment_go(${rvo.reviewNum})">
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div>
		</div>
	</div>
<jsp:include page="adminFooter.jsp" />
</body>
</html>