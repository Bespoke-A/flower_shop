package com.project.flower.member.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.Document;

import com.project.flower.member.dao.MemberDAO;
import com.project.flower.member.vo.MemberVO;



public class UpdateMembercommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>updateMembercommand doGet() 실행~");
		//한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");
		
		MemberVO memVO = new MemberVO();
		
		memVO.setUserId(request.getParameter("id"));
		memVO.setUserName(request.getParameter("name"));
		memVO.setUserBirth(request.getParameter("birth"));
		memVO.setUserPhone(request.getParameter("phone"));
		memVO.setUserAddr(request.getParameter("addr"));
		memVO.setUserEmail(request.getParameter("email"));
		
		int result = MemberDAO.updateMember(memVO);
		System.out.println(result);
		return "";
	}
}
