<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<!-- 자바스크립트 -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- fontawesome(아이콘) -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	
<link rel="stylesheet" href="css/flowerPage.css">
<link rel="stylesheet" href="css/default.css">
<script>
	
</script>
</head>
<body>
	<jsp:include page="/main/header.jsp" />
	<script>
		
	</script>
	<!-- content -->
	<div class=container>
		
			<!-- flower -->
			<div id="title">
				<p>"<span>${fName }</span>" 검색 결과입니다.</p>
				<div class="itembox">
					<c:choose>
						<c:when test="${empty fList || fName == ''}">
							<p id="empty">검색된 내용이 존재하지 않습니다.</p>
						</c:when>
						<c:otherwise>
							<table>
								<%-- for문 --%>
								<tr>
									<c:forEach var="vo" items="${fList}" begin="0" end="2">
										<td><a href="Detailcontroller?type=detail&fId=${vo.fId }">
												<img src="img/flower/${vo.fImg }" alt="hot_item01">
												<p>${vo.fName }</p> <span>품절임박:${vo.fQuant }개</span>
												<p>가격: ${vo.fPrice }원</p>
										</a></td>
									</c:forEach>
								</tr>
								<tr>
									<c:forEach var="vo" items="${fList}" begin="3" end="5">
										<td><a href="Detailcontroller?type=detail&fId=${vo.fId }">
												<img src="img/flower/${vo.fImg }" alt="hot_item01">
												<p>${vo.fName }</p> <span>품절임박:${vo.fQuant }개</span>
												<p>가격: ${vo.fPrice }원</p>
										</a></td>
									</c:forEach>
								</tr>
								<tr>
									<c:forEach var="vo" items="${fList}" begin="6" end="8">
										<td><a href="Detailcontroller?type=detail&fId=${vo.fId }">
												<img src="img/flower/${vo.fImg }" alt="hot_item01">
												<p>${vo.fName }</p> <span>품절임박:${vo.fQuant }개</span>
												<p>가격: ${vo.fPrice }원</p>
										</a></td>
									</c:forEach>
								</tr>
								<tr>
									<c:forEach var="vo" items="${fList}" begin="8" end="10">
										<td><a href="Detailcontroller?type=detail&fId=${vo.fId }">
												<img src="img/flower/${vo.fImg }" alt="hot_item01">
												<p>${vo.fName }</p> <span>품절임박:${vo.fQuant }개</span>
												<p>가격: ${vo.fPrice }원</p>
										</a></td>
									</c:forEach>
								</tr>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
			
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/main/footer.jsp" />
</body>
</html>