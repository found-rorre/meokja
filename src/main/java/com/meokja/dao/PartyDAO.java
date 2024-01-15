package com.meokja.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.meokja.vo.MemberVO;
import com.meokja.vo.Param;
import com.meokja.vo.PartyVO;

public interface PartyDAO {

	int selectCount();
	int selectCountMulti(Param param);

	ArrayList<PartyVO> selectList(HashMap<String, Integer> hmap);
	ArrayList<PartyVO> selectListMulti(Param param);
	
	PartyVO score_party_id(int party_id);
	PartyVO selectByParty_id(int party_id);
	ArrayList<PartyVO> selectSlider();
	void insert(PartyVO partyVO);
	ArrayList<PartyVO> create_myList(MemberVO user);
	ArrayList<PartyVO> join_myList(MemberVO user);
	void partyUpdate(PartyVO partyVO);
	void partyDelete(PartyVO partyVO);
	ArrayList<PartyVO> score_myList(MemberVO user);



}
