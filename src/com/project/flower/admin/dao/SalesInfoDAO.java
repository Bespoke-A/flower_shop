package com.project.flower.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.project.flower.common.mybatis.DBService;
import com.project.flower.admin.vo.SalesInfoVO;

public class SalesInfoDAO {
	
	public static List<SalesInfoVO> salesInfoList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<SalesInfoVO> list = ss.selectList("admin.salesInfoList");
		ss.close();
		return list;
	}
	public static List<SalesInfoVO> monthInfoList(String month){
		SqlSession ss = DBService.getFactory().openSession();
		List<SalesInfoVO> list = ss.selectList("admin.monthInfoList", month);
		ss.close();
		return list;
	}
	public static List<SalesInfoVO> dayInfoList(String day) {
		SqlSession ss = DBService.getFactory().openSession();
		List<SalesInfoVO> list = ss.selectList("admin.dayInfoList", day);
		ss.close();
		return list;
	}
	public static List<SalesInfoVO> yearInfoList(String year) {
		SqlSession ss = DBService.getFactory().openSession();
		List<SalesInfoVO> list = ss.selectList("admin.yearInfoList", year);
		ss.close();
		return list;
	}
	
}
