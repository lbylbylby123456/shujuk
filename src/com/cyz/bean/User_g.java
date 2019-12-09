package com.cyz.bean;

public class User_g {
	
	private int id;
	private String username_g;
	private String password_g;
	private String w_title_g;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUsername_g() {
		return username_g;
	}
	public void setUsername_g(String username_g) {
		this.username_g = username_g;
	}
	public String getPassword_g() {
		return password_g;
	}
	public void setPassword_g(String password_g) {
		this.password_g = password_g;
	}
	public User_g(String name, String psw) {
		this.username_g = name;
		this.password_g = psw;
	}
	public String getW_title_g() {
		return w_title_g;
	}
	public void setW_title_g(String w_title_g) {
		this.w_title_g = w_title_g;
	}
	public int getU_id_g() {
		return id;
	}
	public void setU_id_g(int id) {
		this.id = id;
	}



	public User_g(int id, String username_g, String password_g) {
		this.id = id;
		this.username_g = username_g;
		this.password_g = password_g;
	}
//	public Use_g(String name, String psw) {
//		this.username_g = name;
//		this.password_g = psw;
//
//	}//新加的
	public User_g(){

	}

}
