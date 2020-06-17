package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.repo.HouseDealRepo;

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
	public List<HouseDeal> searchByOption(List<String> type, String radio, String by, String keyword) {
		// TODO Auto-generated method stub
		return hdRepo.searchByOption(type, radio, by, keyword);
	}
	
	@Override
	public HouseDeal searchRecent(String aptName) {
		// TODO Auto-generated method stub
		return hdRepo.searchRecent(aptName);
	}
	

}
