package com.meokja.vo;

import java.util.Date;

public class PartyVO {
	
	private int party_id; 			// 모임 ID
	private String member_id;		// 생성자 ID
	private String food_category;  	// 음식 카테고리
	private String local_category; 	// 지역 카테고리
	private String subject;  		// 글제목
	private String contents;		// 글내용
	private String map;		      	// 가게 맵 키위드
	private Date mealed_at;    		// 식사일
	private Date created_at;   		// 작성일
	private String thumbnail;   	// 썸네일
	private int limitNum = 2;		// 인원수 제한
	private int reportCount;		// 신고 수
	private String status = "일반";	// 삭제 후 '삭제'으로 변경
	
	
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
	public String getFood_category() {
		return food_category;
	}
	public void setFood_category(String food_category) {
		this.food_category = food_category;
	}
	public String getLocal_category() {
		return local_category;
	}
	public void setLocal_category(String local_category) {
		this.local_category = local_category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getMealed_at() {
		return mealed_at;
	}
	public void setMealed_at(Date mealed_at) {
		this.mealed_at = mealed_at;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getLimitNum() {
		return limitNum;
	}
	public void setLimitNum(int limitNum) {
		this.limitNum = limitNum;
	}

	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	@Override
	public String toString() {
		return "PartyVO [party_id=" + party_id + ", member_id=" + member_id + ", food_category=" + food_category
				+ ", local_category=" + local_category + ", subject=" + subject + ", contents=" + contents + ", map="
				+ map + ", mealed_at=" + mealed_at + ", created_at=" + created_at + ", thumbnail=" + thumbnail
				+ ", limitNum=" + limitNum + ", reportCount=" + reportCount + ", status=" + status + "]";
	}


	
	
	
}
