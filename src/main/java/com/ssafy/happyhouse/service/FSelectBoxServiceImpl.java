package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.DongDTO;
import com.ssafy.happyhouse.dto.GugunDTO;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.SidoDTO;
import com.ssafy.happyhouse.repo.FSelectBoxDAO;


@Service
public class FSelectBoxServiceImpl implements FSelectBoxService {

	@Autowired
	FSelectBoxDAO fRepo;
	
	@Override
	public List<SidoDTO> selectSido() throws Exception {
		return fRepo.selectSido();
	}

	@Override
	public List<GugunDTO> selectGugun(String sido_code) throws Exception {
		return fRepo.selectGugun(sido_code);
	}

	@Override
	public List<DongDTO> selectDong(String gugun_code) throws Exception {
		return fRepo.selectDong(gugun_code);
	}

	@Override
	public List<HouseInfo> selectApt(DongDTO dto) throws Exception {
		return fRepo.selectApt(dto);
	}


}
