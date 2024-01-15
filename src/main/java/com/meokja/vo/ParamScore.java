package com.meokja.vo;

import java.util.List;

import lombok.Data;

@Data
public class ParamScore {
	
	
	private List<String> member_id;
	private List<String> score;
	
	
	public List<String> getMember_id() {
		return member_id;
	}
	public void setMember_id(List<String> member_id) {
		this.member_id = member_id;
	}
	public List<String> getScore() {
		return score;
	}
	public void setScore(List<String> score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "ParamScore [member_id=" + member_id + ", score=" + score + "]";
	}
	
	
	

	
}
