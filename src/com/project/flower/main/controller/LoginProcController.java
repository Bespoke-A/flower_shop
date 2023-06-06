package com.project.flower.main.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.flower.main.dao.MemberDAO;
import com.project.flower.main.vo.MemberVO;

@WebServlet("/login/loginProc")
public class LoginProcController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * System.out.println("LoginProcController.doGet() 실행"); }
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글처리
		String cPath=request.getContextPath();
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		
		MemberVO vo = new MemberVO();
		vo.setUserId(id);
		vo.setUserPwd(pwd);
		
		MemberDAO dao = new MemberDAO();
		//@SuppressWarnings("static-access")
		MemberVO mvo = dao.memberLogin(vo);
		
		
		if (mvo != null) { // 로그인 성공 시
			HttpSession session = request.getSession();
			session.setAttribute("userId", id);
			session.setAttribute("userName", mvo.getUserName());
			response.sendRedirect(cPath+"/index.jsp");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('id 또는 비밀번호가 틀립니다.');");
			
			out.println("history.back();");
			out.println("</script>");
		}
		
	}

}
