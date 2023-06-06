package com.project.flower.detail.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.detail.common.Command;
import com.project.flower.detail.common.DetailCommand;

@WebServlet("/Detailcontroller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Map<String, Command> commands = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		commands = new HashMap<String, Command>();
		commands.put("detail", new DetailCommand());
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		Command command = commands.get(type);
		String answer = command.exec(request, response);
		request.getRequestDispatcher(answer).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
