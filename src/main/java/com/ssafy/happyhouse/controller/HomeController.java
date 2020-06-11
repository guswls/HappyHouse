package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;


import javax.servlet.http.HttpSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HousePageBean;
import com.ssafy.happyhouse.service.HouseDealService;

@Controller
public class HomeController {

	static Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	HouseDealService hdService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "index";
	}

	@RequestMapping("about")
	public String about() {
		return "about";
	}

	@RequestMapping("houselist")
	public String houselist() {
		return "houselist";	
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	

	@RequestMapping("login")
	public String login() {
		return "login";	
	}
	
	@RequestMapping("signup")
	public String signup() {
		return "signup";	
	}
	@RequestMapping("detail")
	public String detail() {
		return "detail";	
	}
	@RequestMapping("searchpass")
	public String searchpass() {
		return "searchpass";	
	}
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Locale locale, Model model) {
		return "notice";
	}
	
	@RequestMapping("housedetail/{no}")
	public  String  select(Model model,@PathVariable String no) throws IOException{
		HouseDeal house = null;

		try {
			HouseDeal housedeal = hdService.search(Integer.parseInt(no));
			model.addAttribute("housedeal",housedeal);
			
			return "housedetail";
		}catch (RuntimeException e) {
			logger.error("로그인 실패" , e);
			model.addAttribute("message", e.getMessage());
			return "error";
		}
		
	}
	
	
	@GetMapping("/houselist")
	public String selectAll() {
		return"houselist";
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
