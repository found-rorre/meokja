package com.meokja.dao;

import java.util.ArrayList;

import com.meokja.vo.JoinVO;
import com.meokja.vo.MemberVO;

public interface MemberDAO {
	
	int IDCheck(MemberVO memberVO);

	void memberInsert(MemberVO memberVO);

	MemberVO selectById(String member_id);

	MemberVO selectByName(MemberVO memberVO);

	MemberVO pwSerch(MemberVO memberVO);

	void myProfileUpdate(MemberVO memberVO);

	ArrayList<MemberVO> joinMemberList(JoinVO joinVO);

}
