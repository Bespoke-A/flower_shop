package com.project.flower.detail.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.detail.dao.FlowerDAO;
import com.project.flower.detail.vo.DetailVO;
import com.project.flower.detail.vo.ReviewVO;

public class DetailCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fId = request.getParameter("fId");
		DetailVO vo = FlowerDAO.flowerDetail(fId);
		request.setAttribute("vo", vo);
		List<ReviewVO> list = FlowerDAO.detailReview(fId);
		request.setAttribute("list", list);
		return "detail/detail.jsp";
	}
	
}
