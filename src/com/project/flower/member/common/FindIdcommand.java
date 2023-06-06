package com.project.flower.member.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.flower.member.dao.MemberDAO;
import com.project.flower.member.vo.MemberVO;



public class FindIdcommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>searchMembercommand doGet() 실행~");
		//한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");
		
		// DB 데이터 가져오기
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		System.out.println("email : " + email + ", phone : " + phone);

		MemberVO memVO = new MemberVO();
		memVO.setUserName(name);
		memVO.setUserEmail(email);
		memVO.setUserPhone(phone);
		System.out.println("memVO : " + memVO.toString());
		
		String id  = MemberDAO.findId(memVO);
		System.out.println("id : " + id);
		
		return "{\"id\" : \"" + id + "\"}";
	}
	/*
	 * private String makeJson(List<MemberVO> list) { StringBuilder result = new
	 * StringBuilder(); result.append("{ \"list\" : [");
	 * 
	 * for (MemberVO vo : list) { result.append("{"); result.append("\"id\": \"" +
	 * vo.getUserId() +"\", "); result.append("\"name\": \"" + vo.getUserName() +
	 * "\", "); result.append("\"birth\": \"" + vo.getUserBirth() +"\", ");
	 * result.append("\"email\": \"" + vo.getUserEmail() + "\", ");
	 * result.append("\"phone\": \"" + vo.getUserPhone() + "\", ");
	 * result.append("\"addr\": \"" + vo.getUserAddr() + "\", ");
	 * result.append("\"regdate\": \"" + vo.getUserRegdate() + "\"");
	 * result.append("},"); } //result.delete(result.length() - 1, result.length());
	 * result.deleteCharAt(result.length() - 1); result.append("] }"); return
	 * result.toString(); }
	 */
}
