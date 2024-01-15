package com.meokja.vo;


public class ScoreVO {
	
	private int score_id;	// 식별자
	private int party_id;	// 모임 ID
	private String member_id;	// 회원 ID
	private int score;			// 평가점수
	
	
	public int getScore_id() {
		return score_id;
	}
	public void setScore_id(int score_id) {
		this.score_id = score_id;
	}
	public int getParty_id() {
		return party_id;
	}
	public void setParty_id(int party_id) {
		this.party_id = party_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "ScoreVO [score_id=" + score_id + ", party_id=" + party_id + ", member_id=" + member_id + ", score="
				+ score + "]";
	}
	
	
	
	
	
	

	
	
}
