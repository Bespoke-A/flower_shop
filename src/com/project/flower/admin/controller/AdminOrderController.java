package com.project.flower.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.admin.dao.OrderInfoDAO;
import com.project.flower.admin.vo.OrderInfoVO;


@WebServlet("/Admin/AdminOrderController")
public class AdminOrderController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		int type = 0;
		int begin = Integer.parseInt(request.getParameter("begin"));
		int end = Integer.parseInt(request.getParameter("end"));
		if(request.getParameter("complete") != null) { // 완료, 미완료에 따른 테이블내 데이터 생성조건
			
			type = Integer.parseInt(request.getParameter("complete"));
			
		}
		
		int paymentId = 0;
		if(request.getParameter("paymentId") != null) { // 완료 버튼 클릭시 
			paymentId = Integer.parseInt(request.getParameter("paymentId"));
			OrderInfoDAO.updateCompleteOrder(paymentId);
			
			response.sendRedirect("orderPaging");
			return;
		}
		//System.out.println("AdminOrderCtrl" + begin + "," + end + "," + type);
		List<OrderInfoVO> list = OrderInfoDAO.orderInfoList2(begin, end, type);
		
		if(type == 1 && list.isEmpty()) {
			 list = OrderInfoDAO.orderInfoList2(begin, end, 0);
		}
		if(type == 0 && list.isEmpty()) {
			type = 1;
			 list = OrderInfoDAO.orderInfoList2(begin, end, type);
			  request.setAttribute("fail", "표시할데이터가없습니다.");
		}
		request.setAttribute("type", type);
		String jsonString = makeJson(list);
		PrintWriter out = response.getWriter();
		out.print(jsonString);

	}
	

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
	
	
	
	private String makeJson(List<OrderInfoVO> list) {
		StringBuilder result = new StringBuilder();
		result.append("{ \"list\" : [");
		
		for (OrderInfoVO vo : list) {
			result.append("{");
			result.append("\"paymentId\": \"" + vo.getPaymentId() +"\",");
			if(vo.getPickDel() == 0) {
				result.append("\"pickDel\": \"배달\",");
			} else if(vo.getPickDel() == 1) {
				result.append("\"pickDel\": \"픽업\",");
			}
			if(vo.getComplete() == 0) {
				result.append("\"complete\": \"배달 & 픽업 미완료 내역\",");
			}
			if(vo.getComplete() == 1) {
				result.append("\"complete\": \"배달 & 픽업 완료 내역\",");
			}
			result.append("\"userName\": \"" + vo.getUserName() +"\",");
			result.append("\"userPhone\": \"" + vo.getUserPhone() + "\",");
			result.append("\"userAddr\": \"" + vo.getUserAddr() + "\",");
			result.append("\"fId\": \"" + vo.getfId() + "\",");
			result.append("\"cnt\": " + vo.getCnt() + ",");
			result.append("\"totPrice\": " + vo.getTotPrice() + ",");
			if(vo.getPaymentSudan() == 0) {
				result.append("\"paymentSudan\": \"카드결제\",");
			} else if(vo.getPickDel() == 1) {
				result.append("\"paymentSudan\": \"만나서 결제\",");
			}
			result.append("\"paymentDate\": \"" + vo.getPaymentDate() + "\",");
			if( vo.getPickDay() == null) {
				result.append("\"pickDay\": \"" + "배송주문" + "\",");
			} else {
				result.append("\"pickDay\": \"" + vo.getPickDay() + "\",");
			}
			if(vo.getDelDay() == null) {
				result.append("\"delDay\": \"" + "픽업주문" + "\",");
			} else {
				result.append("\"delDay\": \"" + vo.getDelDay() + "\",");
			}
			result.append("\"button\": \"완료\"");
			result.append("},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("] }");
		return result.toString();
	}
}
