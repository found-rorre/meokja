package com.meokja.vo;

import java.util.ArrayList;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class MemberList {
	
ArrayList<MemberVO> list = new ArrayList<MemberVO>();

public ArrayList<MemberVO> getList() {
	return list;
}

public void setList(ArrayList<MemberVO> list) {
	this.list = list;
}

@Override
public String toString() {
	return "MemberList [list=" + list + "]";
}
	

}
