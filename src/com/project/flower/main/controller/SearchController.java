package com.project.flower.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.flower.main.dao.MainFlowerDAO;
import com.project.flower.main.vo.FlowerVO;

@WebServlet("/search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fName = request.getParameter("fName");
		List<FlowerVO> flowerSearchList = MainFlowerDAO.flowerSearchList(fName); 
		
		HttpSession session = request.getSession();
		session.setAttribute("fName", fName);
		
		request.setAttribute("fList", flowerSearchList);
		request.getRequestDispatcher("flowerPage/searchPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
