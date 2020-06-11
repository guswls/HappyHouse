package com.ssafy.happyhouse.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.DongDTO;
import com.ssafy.happyhouse.dto.GugunDTO;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.SidoDTO;

@Repository
public class FSelectBoxDAOImpl implements FSelectBoxDAO {

	String ns = "com.ssafy.happyhouse.SidoCode.";
	
	@Autowired
	SqlSession template;
	
	@Override
	public List<SidoDTO> selectSido() throws Exception {
		return template.selectList(ns+"selectsido");
	}

	@Override
	public List<GugunDTO> selectGugun(String sido_code) throws Exception {
		return template.selectList(ns+"selectgugun", sido_code);
	}

	@Override
	public List<DongDTO> selectDong(String gugun_code) throws Exception {
		return template.selectList(ns+"selectdong", gugun_code);
	}

	@Override
	public List<HouseInfo> selectApt(DongDTO dto) throws Exception {
		return template.selectList(ns+"selectapt", dto);
	}


}
