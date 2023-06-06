package com.project.flower.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.admin.dao.PagingDAO;
import com.project.flower.admin.paging.Paging;
@WebServlet("/Admin/productPaging")
public class ProductPagingGo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0. 페이징 처리를 위한 객체(Paging) 생성해서 필요한 데이터 참조
		Paging p = new Paging();
		//1. 전체 게시물 수량 구하기
		
		if(request.getParameter("category") != null) {
			p.setTotalRecord(PagingDAO.flowerTotCnt(Integer.parseInt(request.getParameter("category"))));
			
		}else {
			p.setTotalRecord(PagingDAO.flowerTotCnt(0));
		}
		p.setTotalPage();

		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		//3-1. (선택적) 끝번호가 데이터 건수보다 커지면 데이터 건수와 동일하게 처리
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		// 3 * 3블락 begin값 구하기
		//[1](1,2,3)-1/3*3+1 = 1 -- 1-3페이지 블록(1블록)
		//[2](4,5,6)-1/3*3+1 = 4 -- 4-6페이지 블록(2블록)
		//(페이지번호 - 1) / 블록당페이지수 * 블록당페이지수 + 1
		//--- 블록(계산하기)-----
		//4. 블록 시작페이지, 끝페이지 구하기(현재 페이지 번호 사용)
		//4-1. 시작페이지, 끝페이지 구하기
		int beginPage = (p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getPagePerBlock() - 1);

		//4-2. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면 끝 페이지를 전체 페이지수로 변경처리
		if(p.getEndPage() > p.getTotalPage()){
			p.setEndPage(p.getTotalPage());
		}

		//=========================================================
		// 현재 페이지 기준 DB데이터(게시글) 가져오기
		//List<BbsVO> list = BbsDAO.getList(p.getBegin(), p.getEnd());
		// 데이터를 화면에 표시(출력)
		//request.setAttribute("list", list); //게시글 데이터
		
		request.setAttribute("cPage", cPage); //페이지 관련 데이터
		request.setAttribute("pvo", p); //페이지 관련 데이터
		if(request.getParameter("category") != null) {
			String category = (String) request.getParameter("category");
			request.setAttribute("category", category); //페이지 관련 데이터
			request.getRequestDispatcher("productMngmt.jsp?category="+category+"&cPage="+cPage).forward(request, response);
		}else {
			String category = "0";
			request.setAttribute("category", category); //페이지 관련 데이터
			request.getRequestDispatcher("productMngmt.jsp?category=0").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
