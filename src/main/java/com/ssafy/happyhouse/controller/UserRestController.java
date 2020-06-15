package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.User;
import com.ssafy.happyhouse.dto.UserInfo;

@RestController
@RequestMapping("/api")
public class UserRestController {

	static Logger logger = LoggerFactory.getLogger(UserRestController.class);

	@GetMapping("/session")
	public ResponseEntity<User> retrieveSessionUser(HttpSession session) {
		User user = null;
		try {
		logger.debug("retrieveSessionUser - 호출");
		UserInfo userinfo = (UserInfo) session.getAttribute("userinfo");
		if (userinfo == null) 
			return new ResponseEntity<>(new User(null), HttpStatus.OK);
		System.out.println(userinfo.toString());
		user = new User(userinfo.getUserid());
		} catch (Exception | Error e) {
			e.printStackTrace();
			e.getCause().printStackTrace();
		}
		return new ResponseEntity<User>(user, HttpStatus.OK);
	}
    
}