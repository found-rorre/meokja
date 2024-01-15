package com.meokja.vo;


public class MemberVO {
	
	private String member_id;	// 회원 ID
	private String pw;			// 비밀번호
	private String name;		// 이름
	private String nickname;	// 별명
	private int age;			// 나이
	private String gender;		// 성별
	private String jumin;	    // 주민번호
	private String email;		// 이메일
	private String phone;		// 전화번호	
	private String photo;		// 프로필사진
	private String postCode;	// 우편번호
	private String address;		// 주소
	private float scoreAvg;		// 평균점수	
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public float getScoreAvg() {
		return scoreAvg;
	}
	public void setScoreAvg(float scoreAvg) {
		this.scoreAvg = scoreAvg;
	}
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", pw=" + pw + ", name=" + name + ", nickname=" + nickname
				+ ", age=" + age + ", gender=" + gender + ", jumin=" + jumin + ", email=" + email + ", phone=" + phone
				+ ", photo=" + photo + ", postCode=" + postCode + ", address=" + address + ", scoreAvg=" + scoreAvg
				+ "]";
	}
	
	
	
	

	
	
}
