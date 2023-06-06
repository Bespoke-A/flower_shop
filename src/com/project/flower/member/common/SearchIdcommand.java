package com.project.flower.member.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.member.dao.MemberDAO;



public class SearchIdcommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>GetJsonMembersController doGet() 실행~");
		//한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");
		
		String frm = request.getParameter("frm");
		String Idx = MemberDAO.selectOneId(frm);
		
		System.out.println("frm:" +frm + ", Idx: " + Idx);
		
		int result = -1;
	
		if((Idx == null)) {
			result = 1;
		}else {
			result = 0;
		}
		
		System.out.println("result:" + result);
		
		//response.getWriter().print("{\"result\" : \"" + result + "\"}");
		
		return "{\"result\" : \"" + result + "\"}";
	}

}
