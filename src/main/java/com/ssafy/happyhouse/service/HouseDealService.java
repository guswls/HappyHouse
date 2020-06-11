package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseDeal;

public interface HouseDealService {

	List<HouseDeal> searchAll();
	
	HouseDeal search(int no);
	
	int insert(HouseDeal housedeal);
	
	int delete( int no);
	
	int update(HouseDeal housedeal);
	
}
