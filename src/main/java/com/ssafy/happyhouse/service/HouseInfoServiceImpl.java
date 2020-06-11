package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.repo.HouseInfoRepo;

@Service
public class HouseInfoServiceImpl implements HouseInfoService{

	@Autowired
	HouseInfoRepo hRepo;
	/*
	 * @Override public List<HouseInfo> searchAll() throws SQLException { return
	 * hRepo.searchAll(); }
	 * 
	 * @Override public int insert(HouseInfo houseinfo) { return
	 * hRepo.insert(houseinfo); }
	 * 
	 * @Override public int delete(int no) { return hRepo.delete(no); }
	 * 
	 * @Override public int update(HouseInfo info) { return hRepo.update(info); }
	 * 
	 * @Override public List<HouseInfo> searchByDong(String dong) throws
	 * SQLException { return hRepo.searchByDong(dong); }
	 * 
	 * @Override public List<HouseInfo> searchByJibun(String jibun) throws
	 * SQLException { return hRepo.searchByJibun(jibun); }
	 */

	@Override
	public HouseInfo searchByNo(String no) throws SQLException {
		return hRepo.searchByNo(no);
	}

}
