package com.ssafy.happyhouse.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.UserInfo;
import com.ssafy.happyhouse.service.UserInfoService;

import io.swagger.annotations.ApiOperation;

@Controller
public class UserInfoController {
	

	private static final Logger logger = LoggerFactory.getLogger(UserInfoController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@Autowired
	UserInfoService uService;

	/*@RequestMapping(value = "/", method = RequestMethod.POST)
	public String login(Model model, @ModelAttribute UserInfo info, HttpSession session) {
		try {
			UserInfo selected = uService.login(info.getUserid());
			session.setAttribute("userinfo", selected);
			return "redirect:/";// sendredirect			
		} catch (RuntimeException e) {
			logger.error("로그인 실패", e);
			model.addAttribute("message", e.getMessage());
			return "error"; // sendrerdirect ? or forward?
		}
	}*/
	
	
	
	
	@PostMapping("/login")
	public String login(@ModelAttribute UserInfo userinfo, HttpSession session) {
		
		
		try {
			UserInfo selected = uService.login(userinfo);
			System.out.println(userinfo);
			System.out.println(selected);
			session.setAttribute("userinfo", selected);
			return "redirect:/";// sendredirect			
		} catch (RuntimeException e) {	
			logger.error("로그인 실패", e);
			return "error"; // sendrerdirect ? or forward?
		}
	}
	
	@PostMapping("/pw")
	public ResponseEntity<Map<String, Object>> pw(@RequestBody UserInfo userInfo){
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			String result = uService.pw(userInfo);
			entity = handleSuccess(result);
		} catch (RuntimeException e) {
			entity = handleException(e);
		}
		return entity;
	}

	
	/*
	 * @GetMapping("/main") public String main(Model model) { // 회원 정보를 조사해서 넘겨주기
	 * try { List<UserInfo> selected = uService.selectAll();
	 * model.addAttribute("users", selected); return "main";// forward } catch
	 * (RuntimeException e) { logger.error("사용자 조회 실패", e);
	 * model.addAttribute("message", e.getMessage()); return "error"; //
	 * sendrerdirect ? or forward? } }
	 */
	

	// 회원가입 
	@PostMapping("/signup")
	public ResponseEntity<Map<String, Object>> insert(@RequestBody UserInfo userInfo){
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			int result = uService.insert(userInfo);
			entity = handleSuccess(userInfo.getUserid()+"가 추가되었습니다.");
		} catch (RuntimeException e) {
			entity = handleException(e);
		}
		return entity;
	}
	



	//사용자 정보 수정
	@PutMapping("/detail")
	public ResponseEntity<Map<String, Object>> update(@RequestBody UserInfo userInfo){
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			int result = uService.update(userInfo);
			entity = handleSuccess(userInfo.getUserid()+"가 수정되었습니다.");
		} catch (RuntimeException e) {
			entity = handleException(e);
		}
		return entity;
	}

	//사용자 정보 삭제 
	@DeleteMapping("/detail/{userid}")
	public ResponseEntity<Map<String, Object>> delete(@PathVariable String userid){
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			int result = uService.delete(userid);
			entity = handleSuccess(userid+"가 탈퇴되었습니다.");
		} catch (RuntimeException e) {
			entity = handleException(e);
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
