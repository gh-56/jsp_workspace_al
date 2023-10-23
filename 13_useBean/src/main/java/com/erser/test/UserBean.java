package com.erser.test;

public class UserBean {
	private String id;
	private String pw;
	private String email;
	private int age;
	
	// useBean 태그를 사용할 때 기본생성자로 생성을 하기 때문에 무조건 있어야 한다.
	public UserBean() {}

	// alt + s + a 전체 값을 넘겨 받는 생성자 추가
	public UserBean(String id, String pw, String email, int age) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.age = age;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "UserBean [id=" + id + ", pw=" + pw + ", email=" + email + ", age=" + age + "]";
	}
	

}
