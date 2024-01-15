package com.meokja.vo;

import java.util.Date;

public class JoinVO extends JoinMember {
	
	private int join_id; 			// 참여 ID
	private int party_id; 			// 모임 ID
	private String member_id;		// 생성자 ID
	private String contents;		// 글내용
	private Date created_at;   		// 작성일
	private String status = "대기";	// 수락 이후 '수락'으로 변경
	
	private int limitNum;         // 인원제한
	private int count;            // 참여인원
	
	public int getJoin_id() {
		return join_id;
	}
	public void setJoin_id(int join_id) {
		this.join_id = join_id;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getLimitNum() {
		return limitNum;
	}
	public void setLimitNum(int limitNum) {
		this.limitNum = limitNum;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "JoinVO [join_id=" + join_id + ", party_id=" + party_id + ", member_id=" + member_id + ", contents="
				+ contents + ", created_at=" + created_at + ", status=" + status + ", limitNum=" + limitNum + ", count="
				+ count + "]";
	}

	
	
}
