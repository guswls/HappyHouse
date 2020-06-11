package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.UserInfo;
import com.ssafy.happyhouse.repo.UserInfoRepo;
@Service
public class UserInfoServiceImpl implements UserInfoService{

	@Autowired
	UserInfoRepo uRepo;
	
	
	
	@Override
	public UserInfo login(UserInfo userinfo) {
		// TODO Auto-generated method stub
		return uRepo.login(userinfo);
	}

	/*
	 * @Override public List<UserInfo> selectAll() { // TODO Auto-generated method
	 * stub return uRepo.selectAll(); }
	 */
	@Override
	public int insert(UserInfo info) {
		// TODO Auto-generated method stub
		return uRepo.insert(info);
	}

	@Override
	public int update(UserInfo info) {
		// TODO Auto-generated method stub
		return uRepo.update(info);
	}

	@Override
	public int delete(String userid) {
		// TODO Auto-generated method stub
		return uRepo.delete(userid);
	}

	@Override
	public String pw(UserInfo info) {
		
		return uRepo.pw(info);
	}



	
	

}
