package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.repo.HouseDealRepo;
import com.ssafy.happyhouse.util.Paging;

@Service
public class HouseDealServiceImpl implements HouseDealService {

	
	@Autowired
	HouseDealRepo hdRepo;
	
	@Override
	public List<HouseDeal> searchAll() {
		// TODO Auto-generated method stub
		return hdRepo.searchAll();
	}

	@Override
	public HouseDeal search(int no) {
		return hdRepo.search(no);
	}

	@Override
	public int insert(HouseDeal housedeal) {
		// TODO Auto-generated method stub
		return hdRepo.insert(housedeal);
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return hdRepo.delete(no);
	}

	@Override
	public int update(HouseDeal housedeal) {
		// TODO Auto-generated method stub
		return hdRepo.update(housedeal);
	}

	@Override
	public int countBoard() {
		return hdRepo.countBoard();
	}

	@Override
	public List<HouseDeal> selectBoard(Paging vo) {
		return hdRepo.selectBoard(vo);
	}
	
	
	

}
