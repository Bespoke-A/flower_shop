<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="<%=cPath %>/css/header_footer.css">
<link rel="stylesheet" href="<%=cPath %>/Admin/css/adminNomal.css">
<style>

</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
function member_detail(userId,cPage) {
	location.href="memberDetail?userId="+userId+"&cPage="+cPage;
}

</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	<jsp:include page="adminDropdown.jsp" />
	<h2 id="showHead">회원관리</h2>
	<div id="tableBox">
	<table id="order">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>이메일</th>
				<th>생년월일</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td><a href="javascript:member_detail('${vo.userId }','${cPage }');">${vo.userId }</a></td>
					<td>${vo.userName }</td>
					<td>${vo.userPhone }</td>
					<td>${vo.userAddr }</td>
					<td>${vo.userEmail }</td>
					<td>${vo.userBirth }</td>
					<td>${vo.userRegdate }</td>
				</tr>
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
									href="MemberListMngmt?cPage=${pvo.beginPage - 1 }">이전</a></li>
							</c:if>
							<%-- 블록내에 표시할 페이지 태그 작성(시작~끝 페이지) --%>
							<c:forEach var="pageNo" begin="${pvo.beginPage }"
								end="${pvo.endPage }">

								<c:if test="${pvo.nowPage == pageNo }">
									<li class="now">${pageNo }</li>
								</c:if>

								<c:if test="${pvo.nowPage != pageNo }">
									<li><a
										href="MemberListMngmt?cPage=${pageNo }">${pageNo }</a></li>
								</c:if>

							</c:forEach>

							<%-- [다음으로]에 대한 사용가능 여부 처리 --%>
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable">다음</li>
							</c:if>
							<c:if test="${pvo.endPage < pvo.totalPage }">
								<li><a
									href="MemberListMngmt
									?cPage=${pvo.endPage + 1 }">다음</a></li>
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