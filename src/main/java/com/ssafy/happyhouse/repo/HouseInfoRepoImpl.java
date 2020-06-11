package com.ssafy.happyhouse.repo;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.HouseInfo;

@Repository
public class HouseInfoRepoImpl implements HouseInfoRepo{

	String ns = "com.ssafy.happyhouse.HouseInfo.";
	
	@Autowired
	SqlSession template;
	/*
	 * @Override public List<HouseInfo> searchAll() throws SQLException { return
	 * template.selectList(ns+"searchAll"); }
	 * 
	 * @Override public int insert(HouseInfo houseinfo) { return
	 * template.insert(ns+"insert", houseinfo); }
	 * 
	 * @Override public int delete(int no) { return template.delete(ns+"delete",
	 * no); }
	 * 
	 * @Override public int update(HouseInfo info) { return
	 * template.update(ns+"update", info); }
	 * 
	 * @Override public List<HouseInfo> searchByDong(String dong) throws
	 * SQLException { return template.selectList(ns+"searchByDong", dong); }
	 * 
	 * @Override public List<HouseInfo> searchByJibun(String jibun) throws
	 * SQLException { // TODO Auto-generated method stub return
	 * template.selectList(ns+"searchByJibun", jibun); }
	 */

	@Override
	public HouseInfo searchByNo(String no) throws SQLException {
		// TODO Auto-generated method stub
		return template.selectOne(ns+"searchByAptName", no);
	}

	/*
	 * @Override public int changeName(String aptName, String nameToChange) throws
	 * SQLException { return 0; }
	 * 
	 * @Override public HouseInfo search(String dong, String aptName) throws
	 * SQLException { return template.selectList(ns+"searchByDongandAptname",); }
	 */

}
