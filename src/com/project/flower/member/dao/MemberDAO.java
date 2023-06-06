package com.project.flower.member.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.flower.common.mybatis.DBService;
import com.project.flower.member.vo.CartVO;
import com.project.flower.member.vo.FlowerVO;
import com.project.flower.member.vo.MemberVO;
import com.project.flower.member.vo.PaymentVO;
import com.project.flower.member.vo.ReviewVO;

public class MemberDAO {
	
	
	public static List<MemberVO> selectId(String ID){ //ID로 회원정보 조회
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("member.selectId", ID);
		ss.close();
		return list;
	}
	
	public static MemberVO selectIdVO(String ID){ //ID로 회원정보 조회
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO vo = ss.selectOne("member.selectId", ID);
		ss.close();
		return vo;
	}
	
	public static String selectOneId(String ID){ //ID 중복 확인
		SqlSession ss = DBService.getFactory().openSession();
		String idx= ss.selectOne("member.selectOneId", ID);
		ss.close();
		return idx;
	}
	public static int insert(MemberVO memVO) { //회원정보 입력
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("member.insert", memVO);
		ss.close();
		return result;
	}
	public static int updateMember(MemberVO memVO) { //ID로 회원정보 변경
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("member.update", memVO);
		ss.close();
		return result;
	}
	
	public static List<ReviewVO> selectReview(String ID){//ID로 리뷰검색
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("member.selectReview", ID);
		ss.close();
		return list;
	}
	
	public static String findId(MemberVO vo){ //EMAIL PHONE으로 ID찾기
		SqlSession ss = DBService.getFactory().openSession();
		String id = ss.selectOne("member.findId", vo);
		ss.close();
		return id;
	}
	public static String findPwd(MemberVO vo){ //ID EMAIL PHONE으로 ID 찾기
		SqlSession ss = DBService.getFactory().openSession();
		String id = ss.selectOne("member.findPwd", vo);
		ss.close();
		return id;
	}
	
	public static int updatePwd(MemberVO memVO) { //ID로 PW 변경
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("member.updatePwd", memVO);
		ss.close();
		return result;
	}
	
	public static List<PaymentVO> selectOrder(String ID){ //ID로 결제정보 찾기
		SqlSession ss = DBService.getFactory().openSession();
		List<PaymentVO> list = ss.selectList("member.selectOrder", ID);
		ss.close();
		return list;
	}
	
	public static PaymentVO selectPayId(int paymentId){//ID로 리뷰검색
		SqlSession ss = DBService.getFactory().openSession();
		PaymentVO vo = ss.selectOne("member.selectPayId", paymentId);
		ss.close();
		return vo;
	}
	
	public static int insertReview(ReviewVO revVO){//
		SqlSession ss = DBService.getFactory().openSession(true);
		int re = ss.insert("member.insertReview", revVO);
		ss.close();
		return re;
	}
	public static List<CartVO> selectCart(String ID){//
		SqlSession ss = DBService.getFactory().openSession();
		List<CartVO> list = ss.selectList("member.selectCart", ID);
		ss.close();
		return list;
	}
	
	public static int insertCart(CartVO cVO ){//
		SqlSession ss = DBService.getFactory().openSession(true);
		int re = ss.insert("member.insertCart", cVO);
		ss.close();
		return re;
	}
	
	public static FlowerVO selectFlower(String ID){//F_ID로 FLOWER 불러오기
		SqlSession ss = DBService.getFactory().openSession();
		FlowerVO vo = ss.selectOne("member.selectFlower", ID);
		ss.close();
		return vo;
	}
	
	public static String selectFid(CartVO cVO){//F_ID로 F_ID 불러오기
		SqlSession ss = DBService.getFactory().openSession();
		String result = ss.selectOne("member.selectFid", cVO);
		ss.close();
		return result;
	}
	
	public static int updateCntCart(CartVO cVO) { // F_ID로 cnt_cart 더하기
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("member.updateCntCart", cVO);
		ss.close();
		return result;
	}
	
	public static int deleteCart(String ID) { // USER_ID로 CART 삭제
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("member.deleteCart", ID);
		ss.close();
		return result;
	}
	
	public static int deleteOneCart(CartVO vo) { // USER_ID로 CART 삭제
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("member.deleteOneCart", vo);
		ss.close();
		return result;
	}
	
	public static int insertPayPick(PaymentVO VO ){//
		SqlSession ss = DBService.getFactory().openSession(true);
		int re = ss.insert("member.insertPayPick", VO);
		ss.close();
		return re;
	} 
	public static int insertPayDel(PaymentVO VO ){//
		SqlSession ss = DBService.getFactory().openSession(true);
		int re = ss.insert("member.insertPayDel", VO);
		ss.close();
		return re;
	}
	
//	public static int selectPid(String ID){//USER_ID로 PAYMENT_ID 불러오기
//		SqlSession ss = DBService.getFactory().openSession();
//		int result = ss.selectOne("member.selectPid", ID);
//		ss.close();
//		return result;
//	}
	public static PaymentVO selectPid(String ID){//USER_ID로 PAYMENT_ID 불러오기
		SqlSession ss = DBService.getFactory().openSession();
		PaymentVO vo = ss.selectOne("member.selectPid", ID);
		ss.close();
		return vo;
	}
	
	public static void insertOrder( ){//ORDERHISTORY에 PAYMENTID 넣기
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("member.insertOrder");
		ss.close();
		return;
	}
	
	public static int updateQuant(FlowerVO vo) { //QUANT 변경
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("member.updateQuant", vo);
		ss.close();
		return result;
	}
	
	public static int insertReviewPID(ReviewVO vo ){//REVIEW에 PAYMENTID 넣기
		SqlSession ss = DBService.getFactory().openSession(true);
		int re = ss.insert("member.insertReviewPID", vo);
		ss.close();
		return re;
	}
	
	public static int updateReview(ReviewVO revVO){//
		SqlSession ss = DBService.getFactory().openSession(true);
		int re = ss.update("member.updateReview", revVO);
		ss.close();
		return re;
	}
	
	public static String getReview_ok(int paymentId) {
		SqlSession ss = DBService.getFactory().openSession();
		//ReviewVO rvo = new ReviewVO();
		System.out.println("MemberDAO - paymentId : " + paymentId);
		String comment = ss.selectOne("member.getReview_ok", paymentId);
//		if(comment==null) {
//			comment = "0";
//		}
		ss.close();
		System.out.println("MemberDAO - comment : " + comment);
		return comment;
	}
	
	public static int selectCntCart(CartVO vo){
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("member.selectCntCart", vo);
		ss.close();
		return result;
	}
	
	public static int updateFullCnt(CartVO cVO) { // F_ID로 cnt_cart 더하기
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("member.updateFullCnt", cVO);
		ss.close();
		return result;
	}
}
