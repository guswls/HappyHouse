package com.ssafy.happyhouse;


import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;
import java.sql.SQLException;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;

import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.service.HouseInfoService;
import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.repo.HouseDealRepo;

@SpringBootTest
class HappyHouseSpringApplicationTests {
	static Logger logger = LoggerFactory.getLogger(HappyHouseSpringApplicationTests.class);
	
	@Autowired
	HouseDealRepo hdRepo;
	
	@Test
	void test() {
		

		
		int no=14;
		HouseDeal hd = hdRepo.search(no);
		System.out.println(hd);
				
		
	}

}
