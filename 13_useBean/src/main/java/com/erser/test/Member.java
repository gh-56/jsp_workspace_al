package com.erser.test;

public class Member {
	private String name = "이건호";
	
	// alt + s + r
	// getter setter generator

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Member [name=" + name + "]";
	}
	

}
