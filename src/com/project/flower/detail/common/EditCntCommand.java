package com.project.flower.detail.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditCntCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fOrderNum = Integer.parseInt(request.getParameter("fOrderNum"));
		System.out.println("fOrderNum: " + fOrderNum);
		
		return "detail/detail.jsp";
	}

}
