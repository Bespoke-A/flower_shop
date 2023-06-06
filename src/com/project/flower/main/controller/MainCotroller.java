package com.project.flower.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.main.dao.MainFlowerDAO;
import com.project.flower.main.vo.FlowerVO;

@WebServlet("/main")
public class MainCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// HotItem
		List<FlowerVO> hotItemList = MainFlowerDAO.hotItemList(); 
		// NewItem
		List<FlowerVO> newItemList = MainFlowerDAO.newItemList(); 
		// BestItem
		List<FlowerVO> bestItemList = MainFlowerDAO.bestItemList(); 
		
		request.setAttribute("hItem", hotItemList);
		request.setAttribute("nItem", newItemList);
		request.setAttribute("bItem", bestItemList);
		request.getRequestDispatcher("main/main.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
