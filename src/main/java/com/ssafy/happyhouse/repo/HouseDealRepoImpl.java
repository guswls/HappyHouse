package com.ssafy.happyhouse.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HousePageBean;

@Repository
public class HouseDealRepoImpl implements HouseDealRepo {

	private static String ns = "com.ssafy.mapper.HouseDeal.";
	@Autowired
	SqlSession template;
	@Override
	public List<HouseDeal> searchAll() {
		return template.selectList(ns+"houseDealSelectAll");
	}

	@Override
	public HouseDeal search(int no) {
		return template.selectOne(ns+"houseDealSelect",Integer.toString(no));
	}


	@Override
	public int insert(HouseDeal housedeal) {
		return template.insert(ns + "insert", housedeal);
	}

	@Override
	public int delete(int no) {
		return template.delete(ns+"delete", no);
	}

	@Override
	public int update(HouseDeal housedeal) {
		return template.update(ns + "update", housedeal);
	}


	@Override
	public List<HouseDeal> searchAll(int currentPage, int sizePerPage, HousePageBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount(HousePageBean bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HouseDeal> searchByOption(List<String> type, String radio, String by, String keyword) {
		HousePageBean pagebean = new HousePageBean();
		int[] st = new int[type.size()];
		for(int i=0;i<type.size();i++) {
			st[i]= Integer.parseInt(type.get(i)) +1;
		}
		pagebean.setOrderType(radio);
		pagebean.setKeyword(keyword);
		pagebean.setBy(by);
		System.out.println(pagebean.toString());
		pagebean.setSearchType(st);
		return template.selectList(ns+"searchByOption", pagebean);
	}
}
