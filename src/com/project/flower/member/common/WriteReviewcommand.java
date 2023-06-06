package com.project.flower.member.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;



public class WriteReviewcommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>writeReviewcommand doGet() 실행~");
		//한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");
		HttpSession Session = request.getSession(true);
	
	  String fname = request.getParameter("fname"); 
	  String id = request.getParameter("id"); 
	  String fid = request.getParameter("fid");
	  System.out.println("fname : " + fname + ", id : " + id + ", fid : " + fid);
	  Session.setAttribute("fname", fname); 
	  Session.setAttribute("id", id);
	  Session.setAttribute("fid", fid);
	  
	  return "userpage/writeReview.jsp";
	}
}
