package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.util.Paging;

public interface HouseDealService {

	List<HouseDeal> searchAll();
	
	HouseDeal search(int no);
	
	int insert(HouseDeal housedeal);
	
	int delete( int no);
	
	int update(HouseDeal housedeal);

	List<HouseDeal> searchByOption(List<String> type, String radio, String by, String keyword);
	

	HouseDeal searchRecent(String aptName);

	
	public int countBoard();
	public List<HouseDeal> selectBoard(Paging vo);

}
