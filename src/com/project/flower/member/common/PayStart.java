package com.project.flower.member.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.flower.member.dao.MemberDAO;
import com.project.flower.member.vo.MemberVO;

@WebServlet("/payStart")
public class PayStart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> PayStart doGet() 실행~~~");
		//한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
	
		int totMoney = Integer.parseInt(request.getParameter("totMoney"));
		int radioVal = Integer.parseInt(request.getParameter("radioVal"));
		String arrValues = request.getParameter("arrValues");

		MemberVO vo = MemberDAO.selectIdVO(userId);
		System.out.println("vo : " + vo);
		session.setAttribute("totMoney", totMoney);
		session.setAttribute("radioVal", radioVal);
		session.setAttribute("arrValues", arrValues);
		
		if (radioVal == 0) {
			System.out.println("delivery");
			request.getRequestDispatcher("/userpage/delivery.jsp").forward(request, response);
		}
		
		if (radioVal == 1) {
			System.out.println("pickup");
			request.getRequestDispatcher("/userpage/pickup.jsp").forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
