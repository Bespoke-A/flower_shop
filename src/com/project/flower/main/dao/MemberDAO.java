package com.project.flower.main.dao;


import org.apache.ibatis.session.SqlSession;

import com.project.flower.common.mybatis.DBService;
import com.project.flower.main.vo.MemberVO;

public class MemberDAO {

	public static MemberVO memberLogin(MemberVO vo){
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO mvo = ss.selectOne("main.memberLogin", vo);
		ss.close();
		return mvo;
	}
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              