package com.project.flower.admin.dao;
import com.project.flower.common.mybatis.DBService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.flower.admin.vo.MemberVO;
import com.project.flower.admin.vo.ReviewVO;

public class MemberDAO {
	
	public static List<MemberVO> selectMemberAll(){
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("admin.selectMemberAll");
		ss.close();
		return list;
	}
	public static MemberVO selectMemberOne(String userId){
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO vo = ss.selectOne("admin.selectMemberOne",userId);
		ss.close();
		return vo;
	}
	public static int memberAllPrice(String userId){
		SqlSession ss = DBService.getFactory().openSession();
		int price = 0;
		if(null != ss.selectOne("admin.memberAllPrice",userId)) {
			price = ss.selectOne("admin.memberAllPrice",userId);
		}
		ss.close();
		return price;
	}
	
	public static List<ReviewVO> memberList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("admin.memberList", map);
		ss.close();
		return list;
	}
	public static List<ReviewVO> review(){
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("admin.reviewAll");
		ss.close();
		return list;
	}
	public static List<ReviewVO> reviewList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("admin.reviewList", map);
		ss.close();
		return list;
	}
	
	public static ReviewVO reviewOne(int reviewNum) {
		SqlSession ss = DBService.getFactory().openSession();
		ReviewVO vo = ss.selectOne("admin.reviewOne", reviewNum);
		ss.close();
		return vo;
	}
	public static void adminComment(ReviewVO rvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("admin.adminComment", rvo);
		ss.close();
		return ;
		
	}
	
}
