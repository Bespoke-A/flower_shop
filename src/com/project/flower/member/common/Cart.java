package com.project.flower.member.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.project.flower.member.dao.MemberDAO;
import com.project.flower.member.vo.CartVO;
import com.project.flower.member.vo.MemberVO;


@WebServlet("/Cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> Cart doGet() 실행~~~");
		//한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String f_id = request.getParameter("fId");
		int cnt_cart = 0;
		if (f_id != null) {
			int fQuant = Integer.parseInt(request.getParameter("fQuant"));
			cnt_cart = Integer.parseInt(request.getParameter("fOrderNum"));
			int f_price = Integer.parseInt(request.getParameter("fPrice"));
			int tot_price = Integer.parseInt(request.getParameter("totPrice"));
			String f_thumbnail = request.getParameter("fThumbnail");
			String style = request.getParameter("style");
			CartVO cVO = new CartVO();
			cVO.setUserId(userId);
			cVO.setfId(f_id);
			if (MemberDAO.selectFid(cVO) == null) {
				cVO.setCntCart(cnt_cart);
				cVO.setfPrice(f_price);
				cVO.setTotPrice(tot_price);
				cVO.setfThumbnail(f_thumbnail);
				MemberDAO.insertCart(cVO);
			} else {
				cVO.setCntCart(cnt_cart);
				MemberDAO.updateCntCart(cVO);
				int CntCart = MemberDAO.selectCntCart(cVO);
				if (CntCart >= fQuant) {
					cVO.setCntCart(fQuant);
					MemberDAO.updateFullCnt(cVO);
				}
			}
			if (style.equals("cart")) {
				response.sendRedirect("index.jsp");
				//request.getRequestDispatcher("Detailcontroller?type=detail&fId=" + f_id ).forward(request, response);
			 	return;
			}
		}
		List<MemberVO> mList = MemberDAO.selectId(userId);
		List<CartVO> cList = MemberDAO.selectCart(userId);
		session.setAttribute("cList", cList);
		session.setAttribute("mList", mList);
		request.setAttribute("cnt_cart", cnt_cart);
		System.out.println(cList);
		System.out.println(mList);
		request.getRequestDispatcher("/userpage/cart.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}