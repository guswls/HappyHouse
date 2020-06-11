package com.ssafy.happyhouse.repo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.UserInfo;

@Repository
public class UserInfoRepoImpl implements UserInfoRepo{

	private static String ns = "com.ssafy.mapper.UserInfo.";

	@Autowired
	SqlSessionTemplate template;

	/*
	 * @Override public UserInfo select(String userid) { // TODO Auto-generated
	 * method stub return template.selectOne(ns+"select",userid); }
	 */
	/*
	 * @Override public List<UserInfo> selectAll() { // TODO Auto-generated method
	 * stub return template.selectList(ns + "selectAll"); }
	 */

	@Override
	public int insert(UserInfo info) {
		// TODO Auto-generated method stub
		return template.insert(ns + "insert", info);
	}

	@Override
	public int update(UserInfo info) {
		// TODO Auto-generated method stub
		return template.update(ns+"update", info);
	}

	@Override
	public int delete(String userid) {
		// TODO Auto-generated method stub
		return template.delete(ns+"delete", userid);
	}

	@Override
	public UserInfo login(UserInfo userinfo) {
		// TODO Auto-generated method stub
		return template.selectOne(ns+"login",userinfo);
	}

	@Override
	public String pw(UserInfo info) {
		
		return template.selectOne(ns + "pw", info);
	}
	

}
