package com.ssafy.happyhouse.repo;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HousePageBean;
import com.ssafy.happyhouse.util.Paging;

public interface HouseDealRepo {
	
	List<HouseDeal> searchAll();
	
	HouseDeal search(int no);
	
	int insert(HouseDeal housedeal);
	
	int delete(int  no);
	
	int update(HouseDeal housedeal);
	
	int getTotalCount(HousePageBean bean);

	List<HouseDeal> searchAll(int currentPage, int sizePerPage, HousePageBean bean);
	
	public int countBoard();
	public List<HouseDeal> selectBoard(Paging vo);
}
