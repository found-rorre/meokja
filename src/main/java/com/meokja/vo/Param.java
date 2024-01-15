package com.meokja.vo;

import lombok.Data;

@Data
public class Param {
	
	private int currentPage = 1;
	
	private int startNo;
	private int endNo;
	private int minLimitAge = 19;
	private int maxLimitAge = 80;
	private String condition;
	private String item;
	private String food_category;
	private String local_category;
//	신고용 
	private int reportIdx;
	private String reportId;
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public int getMinLimitAge() {
		return minLimitAge;
	}
	public void setMinLimitAge(int minLimitAge) {
		this.minLimitAge = minLimitAge;
	}
	public int getMaxLimitAge() {
		return maxLimitAge;
	}
	public void setMaxLimitAge(int maxLimitAge) {
		this.maxLimitAge = maxLimitAge;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
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
	public int getReportIdx() {
		return reportIdx;
	}
	public void setReportIdx(int reportIdx) {
		this.reportIdx = reportIdx;
	}
	public String getReportId() {
		return reportId;
	}
	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	@Override
	public String toString() {
		return "Param [currentPage=" + currentPage + ", startNo=" + startNo + ", endNo=" + endNo + ", minLimitAge="
				+ minLimitAge + ", maxLimitAge=" + maxLimitAge + ", condition=" + condition + ", item=" + item
				+ ", food_category=" + food_category + ", local_category=" + local_category + ", reportIdx=" + reportIdx
				+ ", reportId=" + reportId + "]";
	}

	
}
