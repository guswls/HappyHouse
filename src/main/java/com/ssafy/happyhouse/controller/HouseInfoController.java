package com.ssafy.happyhouse.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.service.HouseInfoService;

@RestController
public class HouseInfoController {
	static Logger logger = LoggerFactory.getLogger(HouseInfoController.class);
	
	@Autowired
	HouseInfoService hService;
		
	@RequestMapping(value = "/houseinfo/apt/{no}", method = RequestMethod.GET)
	public ResponseEntity<HouseInfo> SearchByAptName(@PathVariable("no") String no) throws Exception {
		HouseInfo h = hService.searchByNo(no);
		logger.info(h.toString());
		if (h == null) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<HouseInfo>(h, HttpStatus.OK);
	}

}
