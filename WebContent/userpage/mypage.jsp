<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String cPath=request.getContextPath(); %>
<%-- 	<jsp:useBean id="review" class="com.project.flower.member.vo.ReviewVO" scope="session"></jsp:useBean> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<!-- jQuery import 방식2(CDN 방식) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- fontawesome(아이콘) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- css -->
<link rel="stylesheet" href="<%=cPath %>/css/mypage.css">
<link rel="stylesheet" href="<%=cPath %>/css/default.css">

<script>
var $j364 = jQuery.noConflict();
</script>

<script>
	function searchParam(key) {
		return new URLSearchParams(location.search).get(key);
	};
	var id = searchParam('userId');
	
	function searchMember() { //회원정보 조회
	const body1 = document.getElementById("body1");
	const body2 = document.getElementById("body2");
	const body3 = document.getElementById("body3");
	body1.style.display = "block";
	body2.style.display = "none";
	body3.style.display = "none";
		
	$j364.ajax("DataController?type=searchMember", {
			type : "post",
			data : "id=" + encodeURIComponent(id), // 서버쪽으로 전달할 데이터 
			datatype : "json",
			success : function(result) {
				let data = JSON.parse(result);
				
				$j364("#id").val(data.list[0].id);
				$j364("#name").val(data.list[0].name);
				$j364("#birth").val(data.list[0].birth);
				$j364("#phone").val(data.list[0].phone);
				$j364("#addr").val(data.list[0].addr);
				$j364("#email").val(data.list[0].email);
				$j364("#regdate").val(data.list[0].regdate);
			},
			error : function() {
				alert("Ajax 처리 실패 : \n" + "jqXHR.readyState : "
						+ jqXHR.readyState + "\n" + "textStatus : "
						+ textStatus + "\n" + "errorThrown : " + errorThrown);
			}
		});
	}

	function searchReview() { //리뷰 조회
		const body1 = document.getElementById("body1");
		const body2 = document.getElementById("body2");
		const body3 = document.getElementById("body3");
		body1.style.display = "none";
		body2.style.display = "block";
		body3.style.display = "none";
		
		$j364.ajax("DataController?type=searchReview", {
			type : "post",
			data : "id=" + encodeURIComponent(id), // 서버쪽으로 전달할 데이터 
			datatype : "json",
			success : function(result) {
				let data = JSON.parse(result);
				let htmlTag = "";
				let star ="";
				let alist = data.list; //JSON 객체의 속성명 "list" 값 추출
				htmlTag += "<tr><td><h2>리뷰내역</h2></td></tr>";
				htmlTag += "<tr><td><hr></td></tr>";
				$j364.each(alist, function(index, member) {
					
					if(this.c_comment != "null") {
						htmlTag += "<tr><td>구매품목 :</td><td>" + this.fname + "</td></tr>";
						
						for (var i = 0; i < this.fStarpoint; i++) {
							star += "★";
						}
						htmlTag += "<tr><td>별점 :</td><td>" + star + "</td></tr>";
						htmlTag += "<tr><td>리뷰 내용 : </td><td>" + this.c_comment + "</td></tr>";
						htmlTag += "<tr><td>리뷰 작성 시간 :</td><td>" + this.CommentDate + "</td></tr>";
						if(this.AdminComment == 0) {
							htmlTag += "<tr><td>관리자 댓글 :</td><td>없음</td></tr>";
						} else{
							htmlTag += "<tr><td>관리자 댓글 :</td><td>" + this.AdminComment + "</td></tr>";
						}
						
						htmlTag += "<tr><td><br><hr><br></td></tr>";
						star ="";
					}
				});
				$j364("#body2").html(htmlTag);
			},

			error : function() {
				alert("Ajax 처리 실패 : \n" + "jqXHR.readyState : "
						+ jqXHR.readyState + "\n" + "textStatus : "
						+ textStatus + "\n" + "errorThrown : " + errorThrown);
			}
		});
	}

	function updateMember(frm) { //회원정보 변경
		
		if (!document.userInfo.name.value) {
			alert("이름을 입력하세요.");
			return false;
		}
		if (!(document.userInfo.birth.value)) {
			alert("생년월일을 입력하세요.");
			return false;
		}
		if (isNaN(document.userInfo.birth.value)) {
			alert("생년월일은 숫자만 입력가능합니다.");
			return false;
		}
		var regExpB = /^\d{6}$/;
        if ((document.userInfo.birth.value).match(regExpB) == null) {
           alert("6자리 생년월일을 입력하세요.");
           return false;
        }
		if (!document.userInfo.phone.value) {
			alert("휴대전화 번호를 입력하세요.");
			return false;
		}
		var regExpP = /^\d{3}-\d{3,4}-\d{4}$/;
        if ((document.userInfo.phone.value).match(regExpP) == null) {
	        alert("000-0000-0000 형식으로 입력하세요.");
	        return false;
        }
		if (!document.userInfo.addr.value) {
			alert("주소를 입력하세요.");
			return false;
		}
		if (!document.userInfo.email.value) {
			alert("이메일을 입력하세요.");
			return false;
		}
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if (exptext.test(document.userInfo.email.value) == false) {
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우            
			alert("이메일형식이 올바르지 않습니다.");
			return false;
		};
		
		var params = $j364(frm).serialize();
		$j364.ajax("DataController?type=updateMember", {
			type : "post",
			data : params, // 서버쪽으로 전달할 데이터 
			datatype : "json",
			success : function(result) {
				alert("수정 성공!");
			},
			error : function() {
				alert("Ajax 처리 실패 : \n" + "jqXHR.readyState : "
						+ jqXHR.readyState + "\n" + "textStatus : "
						+ textStatus + "\n" + "errorThrown : " + errorThrown);
			}
		});
	}
	
	window.onload = function () { //페이지 시작시 주문내역 보여주기
		showOrder();
	}
	
	function showOrder() { //주문내역
		const body1 = document.getElementById("body1");
		const body2 = document.getElementById("body2");
		const body3 = document.getElementById("body3");
		body1.style.display = "none";
		body2.style.display = "none";
		body3.style.display = "block";
	
		$j364.ajax("DataController?type=showOrder", {
			type : "post",
			data : "id=" + encodeURIComponent(id), // 서버쪽으로 전달할 데이터 
			datatype : "json",
			success : function(result) {
				
				let data = JSON.parse(result);
				let htmlTag = "";
				alist = data.list; 
				let pick = null;
				
				$j364.each(alist, function(index, member) {
					htmlTag += "<tbody class=\"body\">";

					htmlTag += "<tr><td>결제 날짜 : "+ this.paymentDate +"</td></td>";
					htmlTag += "<tr><td>주문내역 : "+ this.fname +"</td><tr>";
					htmlTag += "<tr><td>수량 : " + this.cnt +" 개 </td><tr>";
					htmlTag += "<tr><td>금액 : "+ this.totPrice +" 원 </td><td>";
					
					if (this.pickDel == 0 ) {
						pick = "배달";
					}else {
						pick = "픽업";
					}
					
					htmlTag += "<tr><td>수령방법 : "+ pick +" 결제</td><tr>";
					// complete 받아와서 컴플리트 값이 1이면 리뷰버튼 보이게
					if (this.complete == 1 && this.reviewOK == 1) {
						htmlTag += "<tr class=\"rBtn\"><td><input type=\"button\" value=\"리뷰 작성\" onclick=\"review("
								+ this.paymentId
								+ ")\"></td><tr>";
					}
					htmlTag += "<hr><td><br><br></td></tr></tbody>";
			
				});
				$j364("#body3").html(htmlTag);

			},
			error : function() {
				alert("실패");
			}
		});
	}
	
	function review(paymentId) { //데이터 추출
		location.href="writeReview.jsp?paymentId="+paymentId;
	}
</script>
</head>
<body id="dispData">
	<!-- 헤더 -->
	<jsp:include page="/main/header.jsp" />
	
	<div class="container">
		<h2>[ ${userName } ] 회원님 반갑습니다</h2>
		<hr>
		<div class="btn-group">
			<button type="button" id="btn1" class="btn btn-primary" onclick="showOrder()">주문내역</button>
			<button type="button" class="btn btn-primary" onclick="searchMember()">정보수정</button>
			<button type="button" class="btn btn-primary" onclick="searchReview()">리뷰관리</button>
		</div>
		<div>
			<form name="userInfo">
			<hr>
				<table class="table">
					<tbody  id="body1" class="body" style="display: none;">
						<tr>
							<td colspan="6">
								<h2>회원정보수정</h2>
							</td>
						</tr>
						<tr><td colspan="6"><hr></td></tr>
						<tr>
							<td colspan="3">아이디</td>
							<td colspan="3"><input type="text" id="id" name="id" readonly /></td>
						</tr>
						<tr>
							<td colspan="3">이름</td>
							<td colspan="3"><input type="text" id="name" name="name" /></td>
						</tr>
						<tr>
							<td colspan="3">전화번호</td>
							<td colspan="3"><input type="text" id="phone" name="phone" /></td>
						</tr>
						<tr>
							<td colspan="3">생년월일</td>
							<td colspan="3"><input type="text" id="birth" name="birth" maxlength="6" /></td>
						</tr>
						<tr>
							<td colspan="3">주소</td>
							<td colspan="3"><input type="text" id="addr" name="addr" /></td>
						</tr>
						<tr>
							<td colspan="3">이메일</td>
							<td colspan="3"><input type="text" id="email" name="email" /></td>
						</tr>
						<tr><td colspan="6"><hr></td></tr>
						<tr>
							<td colspan="6"><input type="button" value="수정" onclick="updateMember(this.form)" /></td>
						</tr>
					</tbody>
					
					<tbody id="body2" class="body" style="display: none;">
					</tbody>

					<tbody id="body3">
					
					</tbody>
				</table>
			</form>
		</div>

	</div>
	
	<!-- footer -->
	<jsp:include page="/main/footer.jsp" />
</body>
</html>

