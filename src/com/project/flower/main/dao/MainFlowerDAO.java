package com.project.flower.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.flower.common.mybatis.DBService;
import com.project.flower.main.vo.FlowerVO;

public class MainFlowerDAO {

	public static List<FlowerVO> hotItemList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<FlowerVO> list = ss.selectList("main.hotItemList");
		ss.close();
		return list;
	}

	public static List<FlowerVO> newItemList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<FlowerVO> list = ss.selectList("main.newItemList");
		ss.close();
		return list;
	}

	public static List<FlowerVO> bestItemList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<FlowerVO> list = ss.selectList("main.bestItemList");
		ss.close();
		return list;
	}

	public static List<FlowerVO> flowerCategoryList(String category) {
		SqlSession ss = DBService.getFactory().openSession();
		List<FlowerVO> list = ss.selectList("main.flowerCategoryList", category);
		ss.close();
		return list;
	}

	public static List<FlowerVO> flowerSearchList(String fName) {
		SqlSession ss = DBService.getFactory().openSession();
		List<FlowerVO> list = ss.selectList("main.flowerSearchList", fName);
		ss.close();
		return list;
	}
	
}
