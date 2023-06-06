package com.project.flower.admin.dao;
import com.project.flower.common.mybatis.DBService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.flower.admin.vo.OrderInfoVO;

public class OrderInfoDAO {
	
	public static List<OrderInfoVO> orderInfoList(int type){
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderInfoVO> list = ss.selectList("admin.orderInfoList", type);
		ss.close();
		return list;
	}
	public static List<OrderInfoVO> orderInfoList2(int begin, int end, int type) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("complete", type);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderInfoVO> list = ss.selectList("admin.orderInfoList2", map);
		ss.close();
		return list;
	}
	public static void updateCompleteOrder(int paymentId){
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("admin.updateCompleteOrder", paymentId);
		ss.close();
		return;
	}
}
