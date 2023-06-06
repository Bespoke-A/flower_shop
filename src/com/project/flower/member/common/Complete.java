package com.project.flower.member.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.flower.member.vo.CartVO;
import com.project.flower.member.vo.FlowerVO;
import com.project.flower.member.vo.PaymentVO;
import com.project.flower.member.vo.ReviewVO;
import com.project.flower.member.dao.MemberDAO;

/**
 * Servlet implementation class InsertReview
 */
@WebServlet("/Complete")
public class Complete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> complete doGet() 실행~~~");
		//한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		List<CartVO> cList = (List<CartVO>) session.getAttribute("cList");
	
		int choice = Integer.parseInt(request.getParameter("choice"));
		String pickDate = request.getParameter("pickDate");
		String delDate = request.getParameter("delDate");
		String time = request.getParameter("time");
		if (pickDate != null) {
			session.setAttribute("date", pickDate);
		}else if (delDate != null) {
			session.setAttribute("date", delDate);
		}
		session.setAttribute("time", time);
		
		int radioVal = (int) session.getAttribute("radioVal");
		int totMoney = (int) session.getAttribute("totMoney");
		String arrValues = (String) session.getAttribute("arrValues");
		
		String[] array = arrValues.split(",");
		if(radioVal == 0) {
			totMoney = totMoney + 3000;
		}
		session.setAttribute("totMoney", totMoney);
		
		String buyfName = cList.get(0).getfName();
		
		int arrCnt = 0; 
		for(CartVO cvo : cList) {
			int cnt = (Integer.parseInt(array[arrCnt]) / cList.get(arrCnt).getfPrice());
			PaymentVO pVO = new PaymentVO();
			pVO.setUserId(cvo.getUserId());
			pVO.setPaymentSudan(choice);
			pVO.setPickDel(radioVal);
			pVO.setfId(cvo.getfId());
			pVO.setfPrice(cvo.getfPrice());
			pVO.setCnt(cnt);
			pVO.setTotPrice(Integer.parseInt(array[arrCnt]));
			arrCnt++;
			if (pickDate != null) {
				pVO.setPickDay(pickDate + " / " + time);
				MemberDAO.insertPayPick(pVO);
			}else if (delDate != null) {
				pVO.setDelDay(delDate + " / " + time);
				MemberDAO.insertPayDel(pVO);
			}
			//PaymentVO pvo =  MemberDAO.selectPid(cvo.getUserId());
			ReviewVO rVO = new ReviewVO();
			rVO.setUserId(userId);
			//rVO.setPaymentId(pvo.getPaymentId());
			rVO.setfId(cvo.getfId());
			MemberDAO.insertReviewPID(rVO);
			
			MemberDAO.insertOrder();
			FlowerVO fVO = new FlowerVO();
			fVO.setfId(cvo.getfId());
			fVO.setfQuant(cnt);
			MemberDAO.updateQuant(fVO);
		}
		
		request.setAttribute("buyfName", buyfName);
		request.setAttribute("userId", userId);
		MemberDAO.deleteCart(userId);
		//response.sendRedirect("Project_Flower/userpage/resultPay.jsp");
		request.getRequestDispatcher("/userpage/resultPay.jsp").forward(request,	response);
			 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}
