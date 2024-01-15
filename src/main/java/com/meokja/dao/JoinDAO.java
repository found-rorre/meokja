package com.meokja.dao;

import java.util.ArrayList;

import com.meokja.vo.JoinVO;

public interface JoinDAO {

	void joinInsert(JoinVO joinVO);

	ArrayList<JoinVO> selectJoinList(int party_id);

	JoinVO selectByJoin_id(JoinVO joinVO);

	void joinGrant(JoinVO joinVO);

	void joinReject(JoinVO joinVO);

	int joinCHK(JoinVO joinVO);

	void deleteJoin(JoinVO joinVO);

}
