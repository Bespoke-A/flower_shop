package com.project.flower.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.admin.dao.ProductDAO;
import com.project.flower.admin.vo.FlowerVO;

/**
 * Servlet implementation class ModifyGo
 */
@WebServlet("/Admin/modifyGo")
public class ModifyGo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FlowerVO fvo = new FlowerVO();
		
		if(request.getParameter("fImg") != null) {
			fvo.setfImg(request.getParameter("fImg"));
			fvo.setfId(request.getParameter("fId"));
			ProductDAO.fImgModify_ok(fvo);
			String category = request.getParameter("fCategory");
			String cPage = request.getParameter("cPage");
			
			request.setAttribute("cPage", cPage);
			request.setAttribute("category", category);
			response.sendRedirect("productPaging?category="+category+"&cPage="+cPage);
			return;
		
		}
		if(request.getParameter("fThumbnail") != null) {
			fvo.setfThumbnail(request.getParameter("fThumbnail"));
			fvo.setfId(request.getParameter("fId"));
			ProductDAO.fThumbnailModify_ok(fvo);
			String category = request.getParameter("fCategory");
			String cPage = request.getParameter("cPage");
			
			request.setAttribute("cPage", cPage);
			request.setAttribute("category", category);
			response.sendRedirect("productPaging?category="+category+"&cPage="+cPage);
			return;
		}
		
		 
		if(request.getParameter("fInfo") != null) {
			fvo.setfInfo(request.getParameter("fInfo"));
			fvo.setfId(request.getParameter("fId"));
			String category = request.getParameter("fCategory");
			String cPage = request.getParameter("cPage");
			
			request.setAttribute("cPage", cPage);
			request.setAttribute("category", category);
			response.sendRedirect("productPaging?category="+category+"&cPage="+cPage);
			ProductDAO.fInfoModify_ok(fvo);
			return;
		}
		int fQuant = Integer.parseInt(request.getParameter("fQuant"));
		int fPrice = Integer.parseInt(request.getParameter("fPrice"));
		String fId = request.getParameter("fId");
		fvo.setfId(fId);
		fvo.setfQuant(fQuant);
		fvo.setfPrice(fPrice);
		ProductDAO.modify_ok(fvo);
		String category = request.getParameter("fCategory");
		String cPage = request.getParameter("cPage");
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("category", category);
		response.sendRedirect("productPaging?category="+category+"&cPage="+cPage);
		//request.getRequestDispatcher("Admin/productPaging?category="+category+"&cPage"+cPage);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
