package com.project.flower.detail.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.flower.common.mybatis.DBService;
import com.project.flower.detail.vo.DetailVO;
import com.project.flower.detail.vo.ReviewVO;

public class FlowerDAO {
	
	public static DetailVO flowerDetail(String fId) {
		SqlSession ss = DBService.getFactory().openSession();
		DetailVO dvo = ss.selectOne("detail.detail", fId);
		ss.close();
		
		return dvo;
	}
	
	public static List<ReviewVO> detailReview(String fId) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("detail.detailReview", fId);
		ss.close();
		return list;
		
	}
}
