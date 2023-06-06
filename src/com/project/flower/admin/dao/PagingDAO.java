package com.project.flower.admin.dao;


import org.apache.ibatis.session.SqlSession;
import com.project.flower.common.mybatis.DBService;


public class PagingDAO {

	public static int flowerTotCnt(int fCategory) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("adminPaging.flowerTotCnt",fCategory);
		ss.close();
		return totalCount;
	}
	public static int orderTotCnt(int type) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("adminPaging.orderTotCnt",type);
		ss.close();
		return totalCount;
	}
	public static int reviewTotCnt() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("adminPaging.reviewTotCnt");
		ss.close();
		return totalCount;
	}
	public static int memberTotCnt() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("adminPaging.memberTotCnt");
		ss.close();
		return totalCount;
	}

}
