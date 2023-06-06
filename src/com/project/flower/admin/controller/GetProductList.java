package com.project.flower.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.admin.dao.ProductDAO;
import com.project.flower.admin.vo.FlowerVO;

@WebServlet("/Admin/GetProductList")
public class GetProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		int category = Integer.parseInt(request.getParameter("category"));
		int begin = Integer.parseInt(request.getParameter("begin"));
		int end = Integer.parseInt(request.getParameter("end"));
		//System.out.println("getProductList" + begin + "," + end + "," + category);
		//List<FlowerVO> list = ProductDAO.getProductList(category);
		
		List<FlowerVO> list = ProductDAO.sgFlowerList(begin,end,category);
		for(int i = 0; i < list.size(); i++) {
			ProductDAO.updateStarpoint(list.get(i).getfId()); 
		}
		list = ProductDAO.sgFlowerList(begin,end,category);
		String jsonString = makeJson(list);
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		
		// 현재 페이지 기준 DB데이터(게시글) 가져오기
		//List<BbsVO> list = BbsDAO.getList(p.getBegin(), p.getEnd());
		// 데이터를 화면에 표시(출력)
		//request.setAttribute("list", list); //게시글 데이터
		
		
		
		
		
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private String makeJson(List<FlowerVO> list) {
		
		StringBuilder result = new StringBuilder();
		result.append("{ \"list\" : [");
		
		for (FlowerVO vo : list) {
			result.append("{");
			if(vo.getfCategory() == 0) {
				result.append("\"fCategory\": \"꽃한송이\",");
			}
			if(vo.getfCategory() == 1) {
				result.append("\"fCategory\": \"꽃다발\",");
			}
			if(vo.getfCategory() == 2) {
				result.append("\"fCategory\": \"화분\",");
			}
			if(vo.getfCategory() == 3) {
				result.append("\"fCategory\": \"꽃바구니\",");
			}
			result.append("\"fId\": \"" + vo.getfId() +"\",");
			result.append("\"fImg\": \"" + vo.getfImg() + "\",");
			result.append("\"fInfo\": \"" + vo.getfInfo() + "\",");
			result.append("\"fName\": \"" + vo.getfName() + "\",");
			result.append("\"fPrice\": " + vo.getfPrice() + ",");
			result.append("\"fQuant\": " + vo.getfQuant() + ",");
			switch (vo.getfStarpoint()) {
				case "0": vo.setfStarpoint("☆");
					break;
				case "1": vo.setfStarpoint("★");
					break;
				case "2": vo.setfStarpoint("★★");
					break;
				case "3": vo.setfStarpoint("★★★");
					break;
				case "4": vo.setfStarpoint("★★★★");
					break;
				case "5": vo.setfStarpoint("★★★★★");
					break;
			}
			result.append("\"fStarpoint\": \"" + vo.getfStarpoint() + "\",");
			result.append("\"fThumbnail\": \"" + vo.getfThumbnail() + "\",");
			result.append("\"button\": \"저장\",");
			result.append("\"button2\": \"상품삭제\"");
			result.append("},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("] }");
		return result.toString();
	}
}
