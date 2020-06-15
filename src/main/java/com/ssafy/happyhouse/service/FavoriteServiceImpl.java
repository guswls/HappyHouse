package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.Favorite;
import com.ssafy.happyhouse.repo.FavoriteReop;

@Service
public class FavoriteServiceImpl implements FavoriteService{

	@Autowired
	FavoriteReop fRepo;
	
	@Override
	public int insert(Favorite favorite) {
		// TODO Auto-generated method stub
		return fRepo.insert(favorite);
	}

	@Override
	public int delete(int likeid) {
		// TODO Auto-generated method stub
		return fRepo.delete(likeid);
	}

	@Override
	public int getTotal(int likehdid) {
		// TODO Auto-generated method stub
		return fRepo.getTotal(likehdid);
	}

	@Override
	public List<Favorite> searchAll() {
		// TODO Auto-generated method stub
		return fRepo.SearchAll();
	}

	@Override
	public List<Integer> searchByUser(String likeuid) {
		// TODO Auto-generated method stub
		return fRepo.searchByUser(likeuid);
	}

	@Override
	public List<Integer> getRank() {
		// TODO Auto-generated method stub
		return fRepo.getRank();
	}

}
