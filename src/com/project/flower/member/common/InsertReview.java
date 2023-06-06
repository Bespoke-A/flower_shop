package com.project.flower.member.common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.member.dao.MemberDAO;
import com.project.flower.member.vo.PaymentVO;
import com.project.flower.member.vo.ReviewVO;

/**
 * Servlet implementation class InsertReview
 */
@WebServlet("/userpage/insertReview")
public class InsertReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");
		
		String starpoint = request.getParameter("starpoint");
		String cCommnet = request.getParameter("c_comment");
		int paymentId = Integer.parseInt(request.getParameter("paymentId"));
		PaymentVO vo = MemberDAO.selectPayId(paymentId);
		
		ReviewVO revVO = new ReviewVO();
		revVO.setfStarpoint(starpoint);
		revVO.setcComment(cCommnet);
		revVO.setPaymentId(paymentId);
		//revVO.setUserId(vo.getUserId());
		//revVO.setfId(vo.getfId());
		int re = MemberDAO.updateReview(revVO);
		
		response.sendRedirect("mypage.jsp?userId=" + vo.getUserId());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
