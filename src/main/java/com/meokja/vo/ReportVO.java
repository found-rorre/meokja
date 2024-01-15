package com.meokja.vo;

import java.util.Date;

public class ReportVO {
	
	private int report_id;		// 신고 ID
	private String member_id;		// 생성자 ID
	private int party_id; 		// 모임 ID
	private Date created_at;   	// 작성일
	
	
	public int getReport_id() {
		return report_id;
	}
	public void setReport_id(int report_id) {
		this.report_id = report_id;
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
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	@Override
	public String toString() {
		return "ReportVO [report_id=" + report_id + ", member_id=" + member_id + ", party_id=" + party_id
				+ ", created_at=" + created_at + "]";
	}
	

	
	
	
	
	
}
