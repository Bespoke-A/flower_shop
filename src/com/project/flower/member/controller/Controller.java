package com.project.flower.member.controller;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.member.common.Command;
import com.project.flower.member.common.Signcommand;

@WebServlet("/controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Command> commands = null;
	@Override
	public void init(ServletConfig config) throws ServletException {
		//commands에 Map 객체 생성해서 저장하고
		//commands에 요청작업명-요청처리객체 저장
		//예) commands.put("list", new ListCommand());
		commands = new HashMap<String, Command>();
		commands.put("sign", new Signcommand());
		//commands.put("insertReview", new insertReviewcommand());
		
	}
	@Override	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doGet() 실행-----------");
		String type = request.getParameter("type");
		System.out.println(":: type : " + type);
		
		Command command = commands.get(type);
		String answer = command.exec(request, response);
		request.getRequestDispatcher(answer).forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doPost() 실행-----------");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}