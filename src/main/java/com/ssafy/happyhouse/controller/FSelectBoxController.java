package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServlet;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.DongDTO;
import com.ssafy.happyhouse.dto.Favorite;
import com.ssafy.happyhouse.dto.GugunDTO;
import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.SidoDTO;
import com.ssafy.happyhouse.service.FSelectBoxService;
import com.ssafy.happyhouse.service.FavoriteService;
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
	
	@Autowired
	FavoriteService favService;

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
	
	@RequestMapping("/houselist3")
	public  ResponseEntity<Map<String, Object>> selectByOption(
			@RequestBody HashMap<String, Object> paramMap) throws IOException{
		List<String> type = (List<String>) paramMap.get("type");
		Object radio = paramMap.get("radio");
		Object by = paramMap.get("by");
		Object keyword = paramMap.get("keyword");
		ResponseEntity<Map<String, Object>> entity = null;
		System.out.println("답 : 실행 ㄲrrrrr"+type+","+radio + "  "+  by + " " + keyword );
		try { 
			List<HouseDeal> housedeals = hdService.searchByOption(type, (String)radio, (String)by, (String)keyword);
			entity = handleSuccess(housedeals); 
		}catch (RuntimeException e) {
			entity=handleException(e);
		}return entity;
	
	}
	@GetMapping("/myfavlist2/{likeuid}")
	public  ResponseEntity<Map<String, Object>> select23(Model model,@PathVariable String likeuid) throws IOException{
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			
			
			List<Integer> temp = favService.searchByUser(likeuid);
			
			List<HouseDeal> housedeals = new ArrayList<>();
			for(int i=0;i<temp.size();i++) {
					housedeals.add(hdService.search(temp.get(i)));
				}
			System.out.println(housedeals);
			entity = handleSuccess(housedeals);
			
		}catch (RuntimeException e) {
			logger.error("조회실패" , e);
			entity=handleException(e);
		}
		return entity;	
	}
	

	@GetMapping("/rank")
	public  ResponseEntity<Map<String, Object>> selectRank(Model model) throws IOException{
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			
			
			List<Integer> temp = favService.getRank();
			
			List<HouseDeal> hds = new ArrayList<>();
			for(int i=0;i<temp.size();i++) {
				hds.add(hdService.search(temp.get(i)));
				}
			System.out.println(hds);
			entity = handleSuccess(hds);
			
		}catch (RuntimeException e) {
			logger.error("조회실패" , e);
			entity=handleException(e);
		}
		return entity;	
	}
	
	   @RequestMapping(value = "/news")
	   public ResponseEntity<Map<String, Object>> todayNews() throws IOException {
		  ResponseEntity<Map<String, Object>> entity = null;
	     try {
		  String url ="https://land.naver.com/news/headline.nhn?bss_ymd=20200615";
	   
	      
	      Document doc =Jsoup.connect(url).get();
	      Elements element = doc.select("div.section_headline");
	      String title = element.select("ul").text();
	      
	      List<String> temp = new ArrayList<>();
	      for(Element el : element.select("li")) {
	         //System.out.println(el.text());
	    	  temp.add(el.text());       
	         System.out.println(el.text());
	      }
	      
	      List<String> news = new ArrayList<>();
	      boolean[] chk = new boolean[temp.size()];
	      while(news.size() <5) {
	    	  double rv = Math.random();    
	          int iv = (int)(rv * temp.size());
	          if(!chk[iv]) {
	        	  news.add(temp.get(iv));
	        	  chk[iv] = true;
	          }
	      }
	      System.out.println(news);
		
	      entity = handleSuccess(news);
	     }catch (RuntimeException e) {
				entity = handleException(e);
			}
			System.out.println(entity + "이거는 news");
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
