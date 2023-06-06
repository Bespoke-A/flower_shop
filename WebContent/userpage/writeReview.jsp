<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<% String cPath=request.getContextPath(); %>
<%-- <jsp:useBean id="review" class="com.project.flower.member.vo.ReviewVO" scope="session"></jsp:useBean>
<jsp:getProperty property="sendfname" name="review"/> --%>
<%-- 	<jsp:setProperty property="sendfname" name="review"/> --%>
<%-- <% HttpSession Session = request.getSession(true); %> --%>
<%response.setContentType("text/html;charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!-- fontawesome(아이콘) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- css분리 -->
<link rel="stylesheet" href="<%=cPath %>/css/review.css">
<link rel="stylesheet" href="<%=cPath %>/css/default.css">

<script>
	function insertReview(frm) {
		let starpoint = reviewData.starpoint.value;
		let c_comment = reviewData.c_comment.value;
		let paymentId = reviewData.paymentId.value;
	 	if (c_comment == "") {
			alert("내용을 입력하세요");
			return;
		}

		location.href="insertReview?starpoint="+starpoint+"&c_comment="+c_comment+"&paymentId="+paymentId;
	}
	
</script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/main/header.jsp" />
	
	<form class="md-3" name="reviewData" id="myform" method="post">
		<fieldset>
			<input type="radio" name="starpoint" value="5" id="rate1"><label
				for="rate1">★</label>
			<input type="radio" name="starpoint" value="4" id="rate2"><label
				for="rate2">★</label>
			<input type="radio" name="starpoint" value="3" id="rate3"><label
				for="rate3">★</label>
			<input type="radio" name="starpoint" value="2" id="rate4"><label
				for="rate4">★</label>
			<input type="radio" name="starpoint" value="1" id="rate5"><label
				for="rate5">★</label>
			<br>
			<div><span class="text-bold">별점을 선택해주세요</span></div>
		</fieldset>
		<div>
			<textarea class="col-auto" name="c_comment"  id="reviewContents"
					  placeholder="좋은 리뷰를 남겨주시면 꽃요일에 큰 힘이 됩니다!"></textarea>
		</div>
		<input type="button" id='find_id' class="write" onclick="insertReview(this.form)" value="작성" />
		<input type="button" id='find_id' class="no" onclick="history.back();" value="취소" />
		<input type="hidden" name="paymentId" value="${param.paymentId}">
	</form>		
			
	<!-- footer -->
	<jsp:include page="/main/footer.jsp" />
</body>
</html>