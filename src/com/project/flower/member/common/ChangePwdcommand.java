package com.project.flower.member.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.member.dao.MemberDAO;
import com.project.flower.member.vo.MemberVO;

public class ChangePwdcommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>changePwd doGet() 실행~");
		//한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");
		
		// DB 데이터 가져오기
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println(id + pwd);
		
		MemberVO memVO = new MemberVO();
		memVO.setUserId(id);
		memVO.setUserPwd(pwd);
		int res = MemberDAO.updatePwd(memVO);
		
		System.out.println("res: " + res);
		
		return "{\"res\" : \""  + "\"}";
	}
}
