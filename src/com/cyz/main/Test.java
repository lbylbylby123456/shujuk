package com.cyz.main;

import java.util.ArrayList;

import com.cyz.bean.User;
import com.cyz.dao.LRDao;

public class Test {

	public static void main(String[] args) throws Exception {
		LRDao lr = new LRDao();
//		String s="#[多选]不会#会#懂一点";
//		String[] strings=s.split("#");
//		System.out.println(strings[1].substring(1,3));

		while(true){
			ArrayList<User> ar = lr.getListAll();
//			System.out.println("ID\tname\tpsw");
			for(User u : ar){
//				System.out.println(u.getU_id()+"\t"+u.getUsername()+"\t"+u.getPassword()+"\t");
				
			
			}break;
		}
		
//		System.out.println("");
//		System.out.println("密文：");
//		System.out.println(MD5Util.MD5Encode("123", "UTF-8"));

	}

}
