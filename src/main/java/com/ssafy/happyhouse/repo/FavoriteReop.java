package com.ssafy.happyhouse.repo;

import java.util.List;

import com.ssafy.happyhouse.dto.Favorite;

public interface FavoriteReop {
	
	int insert(Favorite favorite);
	
	int delete(int likeid);
	
	int getTotal(int likehdid);
	
	List<Favorite> SearchAll();

	List<Integer> searchByUser(String likeuid);
	
	List<Integer> getRank();
}
