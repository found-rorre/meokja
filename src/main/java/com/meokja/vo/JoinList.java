package com.meokja.vo;

import java.util.ArrayList;

public class JoinList {

	ArrayList<JoinVO> list = new ArrayList<JoinVO>();

	public ArrayList<JoinVO> getList() {
		return list;
	}

	public void setList(ArrayList<JoinVO> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "JoinList [list=" + list + "]";
	}
}
