package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.dto.HouseInfo;

public interface HouseInfoService {
	public HouseInfo searchByNo(String no) throws SQLException;
	
	/*
	 * 
	 * public List<HouseInfo> searchAll() throws SQLException; public
	 * List<HouseInfo> searchByDong(String dong) throws SQLException; public
	 * List<HouseInfo> searchByJibun(String jibun) throws SQLException; int
	 * insert(HouseInfo houseinfo); int delete(int no); public int update(HouseInfo
	 * info);
	 */
}
