package com.project.flower.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.project.flower.common.mybatis.DBService;
import com.project.flower.admin.vo.FlowerVO;

public class ProductDAO {

	public static List<FlowerVO> getProductList(int category) {
		SqlSession ss = DBService.getFactory().openSession();
		List<FlowerVO> list = ss.selectList("admin.getProductList",category);
		ss.close();
		return list;
	}
	
	public static List<FlowerVO> sgFlowerList(int begin, int end, int category) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("category", category);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<FlowerVO> list = ss.selectList("admin.sgFlowerList", map);
		ss.close();
		return list;
	}
	public static void updateStarpoint(String fId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("admin.updateStarpoint",fId);
		ss.close();
		return;
	}
	public static int addProduct(FlowerVO fvo) {
		int result;
		SqlSession ss = DBService.getFactory().openSession(true);
		result = ss.update("admin.addProduct",fvo);
		ss.close();
		return result;
	}
	public static int modify_ok(FlowerVO fvo) {
		int result;
		SqlSession ss = DBService.getFactory().openSession(true);
		result = ss.update("admin.flowerModify",fvo);
		ss.close();
		return result;
	}
	public static void delete_ok(String fId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("admin.flowerDelete",fId);
		ss.close();
		return;
	}
	public static FlowerVO getFlower(String fId) {
		SqlSession ss = DBService.getFactory().openSession();
		FlowerVO vo = ss.selectOne("admin.getFlower",fId);
		ss.close();
		return vo;
	}
	public static void fInfoModify_ok(FlowerVO fvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("admin.fInfoModify_ok",fvo);
		ss.close();
		return;
	}
	public static void fImgModify_ok(FlowerVO fvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("admin.fImgModify_ok",fvo);
		ss.close();
		return;
	}
	public static void fThumbnailModify_ok(FlowerVO fvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("admin.fThumbnailModify_ok",fvo);
		ss.close();
		return;
	}
}
