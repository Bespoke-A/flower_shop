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
import com.project.flower.member.common.ChangePwdcommand;
import com.project.flower.member.common.FindIdcommand;
import com.project.flower.member.common.FindPwdcommand;
import com.project.flower.member.common.SearchIdcommand;
import com.project.flower.member.common.SearchMembercommand;
import com.project.flower.member.common.SearchReviewcommand;
import com.project.flower.member.common.ShowOrdercommand;
import com.project.flower.member.common.Signcommand;
import com.project.flower.member.common.UpdateMembercommand;
import com.project.flower.member.common.WriteReviewcommand;


@WebServlet("/userpage/DataController")
public class DataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Command> commands = null;
	@Override
	public void init(ServletConfig config) throws ServletException {
		//commands에 Map 객체 생성해서 저장하고
		//commands에 요청작업명-요청처리객체 저장
		//예) commands.put("list", new ListCommand());
		System.out.println("datacontroller 실행");
		commands = new HashMap<String, Command>();
		commands.put("searchId", new SearchIdcommand());
		commands.put("searchMember", new SearchMembercommand());
		commands.put("searchReview", new SearchReviewcommand());
		commands.put("updateMember", new UpdateMembercommand());
		commands.put("findId", new FindIdcommand());
		commands.put("findPwd", new FindPwdcommand());
		commands.put("changePwd", new ChangePwdcommand());
		commands.put("showOrder", new ShowOrdercommand());
		commands.put("sign", new Signcommand());
		commands.put("writeReview", new WriteReviewcommand());

	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println(">> FrontController doGet() 실행-----------");
		String type = request.getParameter("type");
		System.out.println(":: type : " + type);
		
		Command command = commands.get(type);
		String answer = command.exec(request, response);
		System.out.println(":: type : " + type);

	    response.setContentType("text/plain");
	    response.getWriter().write(answer);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doPost() 실행-----------");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
