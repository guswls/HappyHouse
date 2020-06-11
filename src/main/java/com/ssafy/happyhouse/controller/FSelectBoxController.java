package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.DongDTO;
import com.ssafy.happyhouse.dto.GugunDTO;
import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.SidoDTO;
import com.ssafy.happyhouse.service.FSelectBoxService;
import com.ssafy.happyhouse.service.HouseDealService;

@RestController
public class FSelectBoxController extends HttpServlet {
	
	static Logger logger = LoggerFactory.getLogger(FSelectBoxController.class);

	@Autowired
	FSelectBoxService fService;
	
	@RequestMapping(value = "/houseinfo", method = RequestMethod.GET)
	public ResponseEntity<List<SidoDTO>> SearchSido() throws Exception {
		List<SidoDTO> sidos = fService.selectSido();
		logger.info(sidos.toString());
		if (sidos.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<SidoDTO>>(sidos, HttpStatus.OK);
	}

	@RequestMapping(value = "/houseinfo/{sido}", method = RequestMethod.GET)
	public ResponseEntity<List<GugunDTO>> SearchGugun(@PathVariable("sido") String sido) throws Exception {
		List<GugunDTO> guguns = fService.selectGugun(sido);
		if (guguns.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<GugunDTO>>(guguns, HttpStatus.OK);
	}

	@RequestMapping(value = "/houseinfo/sido/{gugun}", method = RequestMethod.GET)
	public ResponseEntity<List<DongDTO>> SearchDong(@PathVariable("gugun") String gugun) throws Exception {
		List<DongDTO> dongs = fService.selectDong(gugun);
		if (dongs.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<DongDTO>>(dongs, HttpStatus.OK);
	}
	
	
	@RequestMapping(value ="/houseinfo/sido/gugun/{code}/{dong}", method = RequestMethod.GET)
	public ResponseEntity<List<HouseInfo>> SearchApt(@PathVariable("code") String code, @PathVariable("dong") String dong) throws Exception {
		DongDTO dto = new DongDTO();
		dto.setCode(code);
		dto.setDong(dong);
		List<HouseInfo> Apts = fService.selectApt(dto);
		if (Apts.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<HouseInfo>>(Apts, HttpStatus.OK);
	}
	

	@Autowired
	HouseDealService hdService;

	@GetMapping("/houselist2")
	public ResponseEntity<Map<String, Object>> selectAll2() {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			List<HouseDeal> housedeals = hdService.searchAll();
			entity = handleSuccess(housedeals);
		}catch (RuntimeException e) {
			entity=handleException(e);
		}
		return entity;
	}
	
	
	private ResponseEntity<Map<String, Object>> handleSuccess(Object data) {
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("status", true);
		resultMap.put("data", data);
		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
	}

	private ResponseEntity<Map<String, Object>> handleException(Exception e) {
		logger.error("예외 발생", e);
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("status", false);
		resultMap.put("data", e.getMessage());
		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
