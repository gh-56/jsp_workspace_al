package com.erser.vo;

/**
 *	회원 정보를 저장하는 객체
 *	Value Object 
 */
public class MemberVO {
	private String uid;
	private String upw;
	private String uname;
	
	public MemberVO() {}
	
	public MemberVO(String uid, String upw, String uname) {
		this.uid = uid;
		this.upw = upw;
		this.uname = uname;
	}

	// getter setter alt + s + r
	
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}
	
	// toString() alt + s + s + s
	
	@Override
	public String toString() {
		return "MemberVO [uid=" + uid + ", upw=" + upw + ", uname=" + uname + "]";
	}
}
