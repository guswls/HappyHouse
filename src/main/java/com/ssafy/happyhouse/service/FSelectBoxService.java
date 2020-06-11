package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.DongDTO;
import com.ssafy.happyhouse.dto.GugunDTO;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.SidoDTO;

public interface FSelectBoxService {
	List<SidoDTO> selectSido() throws Exception;
	List<GugunDTO> selectGugun(String sido_code) throws Exception;
	List<DongDTO> selectDong(String gugun_code) throws Exception;
	List<HouseInfo> selectApt(DongDTO dto) throws Exception;
}
