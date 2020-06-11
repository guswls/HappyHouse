package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.UserInfo;

public interface UserInfoService {

	UserInfo login(UserInfo userinfo);
	//List<UserInfo> selectAll();
	int insert(UserInfo info);
	
	int update(UserInfo info);
	
	int delete(String userid);
	
	String pw(UserInfo info);
}
