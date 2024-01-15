package com.meokja.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.meokja.vo.MemberVO;
import com.meokja.vo.PartyVO;
import com.meokja.vo.ScoreVO;

public interface ScoreDAO {

	ArrayList<MemberVO> scoreList(int party_id);

	ArrayList<MemberVO> scoreMemeberList(ArrayList<String> member_idList);

	PartyVO score_selectByparty_id(int party_id);

	void scoreInsert(ScoreVO scoreVO);

	int scoreCount(String member_id);

	int totalScore(String member_id);

	double avgScore(String member_id);


}
