package com.ssafy.happyhouse.repo;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.Favorite;
@Repository
public class FavoriteRepoImpl implements FavoriteReop{

	private static String ns ="com.ssafy.mapper.Favorite.";
	@Autowired
	SqlSession template;
	@Override
	public int insert(Favorite favorite) {
		// TODO Auto-generated method stub
		return template.insert(ns+"insert", favorite);
	}

	@Override
	public int delete(int likeid) {
		// TODO Auto-generated method stub
		return template.delete(ns+"delete",likeid);
	}

	@Override
	public int getTotal(int likehdid) {
		// TODO Auto-generated method stub
		return template.selectOne(ns+"selectByHd",likehdid);
	}

	@Override
	public List<Favorite> SearchAll() {
		// TODO Auto-generated method stub
		return template.selectList(ns+"selectAll");
	}

	@Override
	public List<Integer> searchByUser(String likeuid) {
		// TODO Auto-generated method stub
		return template.selectList(ns+"selectByUser", likeuid);
	}

	@Override
	public List<Integer> getRank() {
		// TODO Auto-generated method stub
		return template.selectList(ns+"getRank");
	}

}
