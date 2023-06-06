<%@page import="com.project.flower.admin.paging.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장관리</title>
<link rel="stylesheet" href="<%=cPath %>/css/header_footer.css">
<link rel="stylesheet" href="<%=cPath %>/Admin/css/adminNomal.css">
<style>

</style>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	let list = "${list}"
	function comment_go(reviewNum, cPage){
		location.href="reviewMngmt?reviewNum="+reviewNum+"&cPage="+cPage;
	}
</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	<jsp:include page="adminDropdown.jsp" />
	<h2 id="showHead">리뷰관리</h2>
	<div id="tableBox">
	<table id="order">
		<thead>
			<tr>
				<th>리뷰번호</th>
				<th>아이디</th>
				<th>꽃 코드</th>
				<th>리뷰</th>
				<th>리뷰작성일시</th>
				<th>별점</th>
				<th>관리자 댓글여부</th>
				<th>수정,작성</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<c:if test="${vo.cComment != null }">
				<tr>
					<td>${vo.reviewNum }</td>
					<td>${vo.userId }</td>
					<td>${vo.fId }</td>
					<td>${vo.cComment }</td>
					<td>${vo.commentDate }</td>
					<td>${vo.fStarpoint }</td>
					<td>${vo.adminComment }</td>
					<c:if test="${vo.adminComment == '0' }">
						<td><button onclick="comment_go(${vo.reviewNum },${cPage })">답글 작성</button></td>
					</c:if>
					<c:if test="${vo.adminComment != '0' }">
						<td><button onclick="comment_go(${vo.reviewNum },${cPage })">수정</button></td>
					</c:if>
				</tr>
				</c:if>
			</c:forEach>
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
								<li><a
									href="reviewMngmt?cPage=${pvo.beginPage - 1 }">이전</a></li>
							</c:if>
							<%-- 블록내에 표시할 페이지 태그 작성(시작~끝 페이지) --%>
							<c:forEach var="pageNo" begin="${pvo.beginPage }"
								end="${pvo.endPage }">

								<c:if test="${pvo.nowPage == pageNo }">
									<li class="now">${pageNo }</li>
								</c:if>

								<c:if test="${pvo.nowPage != pageNo }">
									<li><a
										href="reviewMngmt?cPage=${pageNo }">${pageNo }</a></li>
								</c:if>

							</c:forEach>

							<%-- [다음으로]에 대한 사용가능 여부 처리 --%>
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable">다음</li>
							</c:if>
							<c:if test="${pvo.endPage < pvo.totalPage }">
								<li><a
									href="reviewMngmt?cPage=${pvo.endPage + 1 }">다음</a></li>
							</c:if>
						</ol>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
	</div>
</body>
<jsp:include page="adminFooter.jsp" />
</html>