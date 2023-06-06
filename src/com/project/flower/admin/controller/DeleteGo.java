package com.project.flower.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.admin.dao.ProductDAO;
import com.project.flower.admin.vo.FlowerVO;

@WebServlet("/Admin/deleteGo")
public class DeleteGo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!request.getParameter("fId").trim().equals("")) {
			String fId = request.getParameter("fId");
			FlowerVO fvo = ProductDAO.getFlower(fId);
			int category = fvo.getfCategory();
			
			//request.setAttribute("category", category);
			ProductDAO.delete_ok(fId);
			//request.getRequestDispatcher("productMngmt.jsp").forward(request, response);
			response.sendRedirect("productPaging?category="+category);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
