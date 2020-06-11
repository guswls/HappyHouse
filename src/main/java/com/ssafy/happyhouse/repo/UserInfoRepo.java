package com.ssafy.happyhouse.repo;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.dto.UserInfo;



public interface UserInfoRepo {

//	UserInfo select(UserInfo userinfo);
	
	
	UserInfo login(UserInfo userinfo);
	

	int insert(UserInfo info);
	
	int update(UserInfo info);
	
	int delete(String userId);

	String pw(UserInfo info);

}
