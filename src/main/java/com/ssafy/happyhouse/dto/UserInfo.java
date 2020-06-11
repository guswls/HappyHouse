package com.ssafy.happyhouse.dto;

import java.util.List;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class UserInfo {

	private String userid;
	private String userPw;
	private String userName;
	private String address;
	private String phone;


	public int compareTo(UserInfo o) {
		
		if(o!=null && o.userid != null&&userid!=null) {
			return userid.compareTo(o.userid);
		}
		return 0;
	}

	public UserInfo(String userid, String userName,String phone) {
		super();
		this.userid = userid;
		this.userName = userName;
		this.phone = phone;
	}

	public UserInfo(String userid, String userPw) {
		super();
		this.userid = userid;
		this.userPw = userPw;
	}
}
