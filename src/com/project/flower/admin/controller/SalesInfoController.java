package com.project.flower.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.admin.dao.SalesInfoDAO;
import com.project.flower.admin.vo.SalesInfoVO;

@WebServlet("/Admin/SalesInfoController")
public class SalesInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String day = "";
		String year = "";
		if(request.getParameter("day") != null) {
			day = request.getParameter("day");
			List<SalesInfoVO> list = SalesInfoDAO.dayInfoList(day);
			String jsonString = makeJson(list);
			PrintWriter out = response.getWriter();
			out.print(jsonString);
			return;
		}
		if(request.getParameter("year") != null) {
			year = request.getParameter("year");
			List<SalesInfoVO> list = SalesInfoDAO.yearInfoList(year);
			String jsonString = makeJson(list);
			PrintWriter out = response.getWriter();
			out.print(jsonString);
			return;
		}
		
		String month = request.getParameter("month");
		List<SalesInfoVO> list = SalesInfoDAO.monthInfoList(month);
		
		String jsonString = makeJson(list);
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	private String makeJson(List<SalesInfoVO> list) {
		StringBuilder result = new StringBuilder();
		result.append("{ \"list\" : [");
		
		for (SalesInfoVO vo : list) {
			result.append("{");
			
			result.append("\"year\": \"" + vo.getYear() +"\",");
			result.append("\"month\": \"" + vo.getMonth() + "\",");
			result.append("\"day\": \"" + vo.getDay() + "\",");
			result.append("\"fId\": \"" + vo.getfId() + "\",");
			result.append("\"fName\": \"" + vo.getfName() + "\",");
			result.append("\"fPrice\": " + vo.getfPrice() + ",");
			result.append("\"cnt\": " + vo.getCnt() + ",");
			result.append("\"totalPrice\": " + vo.getTotalPrice() + ",");
			result.append("\"totalPrice\": " + vo.getTotalPrice() + ",");
			result.append("\"button\": \"완료\"");
			result.append("},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("] }");
		return result.toString();
	}
}
