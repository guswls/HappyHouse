package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.Favorite;

public interface FavoriteService {

	int insert(Favorite favorite);
	
	int delete (int likeid);
	
	int getTotal(int likehdid);
	
	List<Favorite> searchAll();
	
	List<Integer> searchByUser(String likeuid);
	
	List<Integer> getRank();
}
