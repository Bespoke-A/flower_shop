package com.project.flower.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.admin.dao.MemberDAO;
import com.project.flower.admin.dao.PagingDAO;
import com.project.flower.admin.paging.Paging;
import com.project.flower.admin.vo.ReviewVO;

@WebServlet("/Admin/reviewMngmt")
public class ReviewMngmt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("adminComment") != null) {
			int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
			String adminComment = request.getParameter("adminComment");
			ReviewVO rvo = new ReviewVO();
			rvo.setAdminComment(adminComment);
			rvo.setReviewNum(reviewNum);
			MemberDAO.adminComment(rvo);
			response.sendRedirect("reviewMngmt");
			return;
		}
		
		
		if(request.getParameter("reviewNum") != null) {
			int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
			ReviewVO rvo = MemberDAO.reviewOne(reviewNum);
			request.setAttribute("rvo", rvo);
			request.getRequestDispatcher("adminComment.jsp").forward(request, response);
			return;
		}
		//--------------------------------------------------------------------------------
		Paging p = new Paging();

		//1. 전체 게시물 수량 구하기
		p.setTotalRecord(PagingDAO.reviewTotCnt());
		p.setTotalPage();

		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
			
		}
		if(cPage == null) {
			cPage = Integer.toString(p.getNowPage());
			System.out.println(cPage);
		}
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		//3-1. (선택적) 끝번호가 데이터 건수보다 커지면 데이터 건수와 동일하게 처리
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		int beginPage = (p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getPagePerBlock() - 1);

		//4-2. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면 끝 페이지를 전체 페이지수로 변경처리
		if(p.getEndPage() > p.getTotalPage()){
			p.setEndPage(p.getTotalPage());
		}

		//=========================================================
		// 현재 페이지 기준 DB데이터(게시글) 가져오기
		List<ReviewVO> list = MemberDAO.reviewList(p.getBegin(), p.getEnd());
		// 데이터를 화면에 표시(출력)
		request.setAttribute("list", list); //게시글 데이터
		request.setAttribute("pvo", p); //페이지 관련 데이터
		request.setAttribute("cPage", cPage); //페이지 관련 데이터
		//------------------------------------------------------------------------
		
		//List<ReviewVO> list = MemberDAO.review();
		//request.setAttribute("list", list);
		request.getRequestDispatcher("reviewMngmt.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
