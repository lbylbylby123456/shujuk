package com.cyz.bean;

public class User_d {

	private int id_d;
	private String username_d;
	private String password_d;
	private String w_title_d;
	public int getId() {
		return id_d;
	}
	public void setId(int id) {
		this.id_d = id;
	}

	public String getUsername_d() {
		return username_d;
	}
	public void setUsername_d(String username_d) {
		this.username_d = username_d;
	}
	public String getPassword_d() {
		return password_d;
	}
	public void setPassword_d(String password_d) {
		this.password_d = password_d;
	}
	public User_d(String name, String psw) {
		this.username_d = name;
		this.password_d = psw;
	}
	public String getW_title_d() {
		return w_title_d;
	}
	public void setW_title_d(String w_title_g) {
		this.w_title_d = w_title_d;
	}
	public int getU_id_d() {
		return id_d;
	}
	public void setU_id_d(int id_d) {
		this.id_d = id_d;
	}



	public User_d(int id_d, String username_d, String password_d) {
		this.id_d = id_d;
		this.username_d = username_d;
		this.password_d = password_d;
	}
	//	public Use_g(String name, String psw) {
//		this.username_g = name;
//		this.password_g = psw;
//
//	}//新加的
	public User_d(){

	}

}
