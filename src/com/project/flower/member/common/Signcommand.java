package com.project.flower.member.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.member.dao.MemberDAO;
import com.project.flower.member.vo.MemberVO;



public class Signcommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> GetXmlMembersController doGet() 실행~~~");
		//한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");
		
		MemberVO memVO = new MemberVO();
		memVO.setUserId(request.getParameter("id"));
		memVO.setUserPwd(request.getParameter("password"));
		memVO.setUserName(request.getParameter("name"));
		memVO.setUserBirth(request.getParameter("birth"));
		memVO.setUserPhone(request.getParameter("phone"));
		memVO.setUserAddr(request.getParameter("address"));
		memVO.setUserEmail(request.getParameter("mail"));
		
		
		int re = MemberDAO.insert(memVO);
		System.out.println("reuslt" + re);
		
		return "login/login.jsp";
		//화면출력
	}

	
}
