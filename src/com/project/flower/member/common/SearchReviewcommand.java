package com.project.flower.member.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.member.dao.MemberDAO;
import com.project.flower.member.vo.ReviewVO;

public class SearchReviewcommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>searchMembercommand doGet() 실행~");
		// 한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");

		// DB 데이터 가져오기
		String id = request.getParameter("id");
		System.out.println(id);

		List<ReviewVO> list = MemberDAO.selectReview(id);
		System.out.println("list : " + list);

		String jsonString = makeJson(list);

		return jsonString;
	}

	private String makeJson(List<ReviewVO> list) {
		StringBuilder result = new StringBuilder();
		result.append("{ \"list\" : [");

		for (ReviewVO vo : list) {
			result.append("{");
			result.append("\"UserId\": \"" + vo.getUserId() +"\", ");
			result.append("\"ReviewNum\": " + vo.getReviewNum() + ", ");
			result.append("\"fname\": \"" + vo.getFname() +"\", ");
			result.append("\"Complete\": " + vo.getComplete() + ", ");
			result.append("\"c_comment\": \"" + vo.getcComment() + "\", ");
			result.append("\"CommentDate\": \"" + vo.getCommentDate() + "\", ");
			result.append("\"AdminComment\": \"" + vo.getAdminComment() + "\", ");
			result.append("\"fStarpoint\": \"" + vo.getfStarpoint() + "\"");
			result.append("},");
		}

		// result.delete(result.length() - 1, result.length());
		result.deleteCharAt(result.length() - 1);
		result.append("] }");
		System.out.println("result.toString() : " + result.toString());
		return result.toString();
	}
}
