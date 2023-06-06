package com.project.flower.member.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.member.dao.MemberDAO;
import com.project.flower.member.vo.PaymentVO;
import com.project.flower.member.vo.ReviewVO;



public class ShowOrdercommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>GetJsonMembersController doGet() 실행~");
		//한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		
		System.out.println("id : " + id);
		
		List<PaymentVO> list = MemberDAO.selectOrder(id);
		System.out.println("list.toString() : " + list.toString());
		
		String jsonString = makeJson(list);
		System.out.println("jsonString: " + jsonString);
		
		return jsonString;
		
	}
	private String makeJson(List<PaymentVO> list) {
		StringBuilder result = new StringBuilder();
		result.append("{ \"list\" : [");
		int ok = 0;
		for (PaymentVO vo : list) {
			result.append("{");
			result.append("\"paymentId\": \"" + vo.getPaymentId() +"\", ");
			result.append("\"fId\": \"" + vo.getfId() +"\", ");
			result.append("\"userId\": \"" + vo.getUserId() +"\", ");
			result.append("\"paymentDate\": \"" + vo.getPaymentDate() +"\", ");
			
			
			String rvo = MemberDAO.getReview_ok(vo.getPaymentId());
			
			
			if(rvo == null){
				ok = 1;
				result.append("\"reviewOK\": \"" + ok + "\", ");
			} else {
				ok = 0;
				result.append("\"reviewOK\": \"" + ok + "\", ");
			}
			result.append("\"pickDel\": \"" + vo.getPickDel() + "\", ");
			result.append("\"fname\": \"" + vo.getfname() +"\", ");
			result.append("\"totPrice\": \"" + vo.getTotPrice() + "\", ");
			result.append("\"cnt\": \"" + vo.getCnt() + "\",");
			result.append("\"complete\": \"" + vo.getComplete() + "\",");
			result.deleteCharAt(result.length() - 1);
			result.append("},");
		}
		//result.delete(result.length() - 1, result.length());
		result.deleteCharAt(result.length() - 1);
		result.append("] }");
		return result.toString();
	}
}

