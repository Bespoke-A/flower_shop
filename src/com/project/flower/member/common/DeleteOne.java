package com.project.flower.member.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.flower.member.dao.MemberDAO;
import com.project.flower.member.vo.CartVO;

@WebServlet("/DeleteOne")
public class DeleteOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> DeleteOne doGet() 실행~~~");
		//한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String fid = request.getParameter("fid");
		CartVO cVO = new CartVO();
		cVO.setfId(fid);
		cVO.setUserId(userId);
		MemberDAO.deleteOneCart(cVO);
			 
		response.sendRedirect("Cart?");
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
