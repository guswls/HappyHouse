/*package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.Notice;
import com.ssafy.happyhouse.dto.UserInfo;
import com.ssafy.happyhouse.service.NoticeService;

import io.swagger.annotations.ApiOperation;

@Controller

public class NoticeController {
	
	
	static Logger logger = LoggerFactory.getLogger(NoticeController.class);

	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	NoticeService nService;
	


	

   
	
	@GetMapping("/noticeBoard") 
	public String selectAll(@ModelAttribute Notice notice, Model model)  {
   		try {
   			logger.debug("호출완료오오오오오오");
			List<Notice> selected = nService.selectAll();
			model.addAttribute("notices", selected);
			return "noticeBoard";// sendredirect			
		} catch (RuntimeException e) {	
			logger.error("리스트 출력 실패", e);
			return "error"; // sendrerdirect ? or forward?
		}
   	}
   	
   	// 등록
   	@PostMapping("/boardregist")
	public String insert(@ModelAttribute Notice notice, Model model)  {
		try {
			logger.debug("ssss");
			int result = nService.insert(notice);
			
			model.addAttribute("notice", result);
			return "redirect:/noticeBoard";// sendredirect	
		} catch (RuntimeException e) {
			logger.error("등록출력 실패", e);
			return "error"; // sendrerdirect ? or forward?
		}
	}

  // 정보 수정
   		@PutMapping("/boarddetail")
  	public String update( Model model, @ModelAttribute Notice notice) {
  		
  		try {
  			logger.debug("ssdddss");
  			int result = nService.update(notice);
  			model.addAttribute("notice", result);
			return "noticeBoard";// sendredirect	
  		} catch (RuntimeException e) {
  			logger.error("수정 실패", e);
			return "error"; // sendrerdirect ? or forward?
  		}
  	}
   
  	
	@PutMapping("/boarddetail/{no}")
   	public ResponseEntity<String> update(@RequestBody Notice notice) {
   		logger.debug("update- 호출");
   		logger.debug("" + notice);
   		
   		if (nService.update(notice)==1) {
   			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
   		}
   		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
   	}
  	

  	
	//상세정보
   	@GetMapping("/boarddetail/{no}") 
	public String searchByNo(@PathVariable String no, Model model)  {
   		try {
   			logger.debug("완료오오오오오오");
			Notice result = nService.searchByNo(Integer.parseInt(no));
			model.addAttribute("notice", result);
			return "boarddetail";// sendredirect			
		} catch (RuntimeException e) {	
			logger.error("리스트 출력 실패", e);
			return "error"; // sendrerdirect ? or forward?
		}
   	}
  

   	
   	
   	
 	@DeleteMapping("/boarddetail/{no}")
   	public String delete(@PathVariable Notice notice, Model model) {
 		try {
   			logger.debug("삭제에ㅔ에");
			int result = nService.delete(notice);
			model.addAttribute("notice", result);
			return "noticeBoard";// sendredirect			
		} catch (RuntimeException e) {	
			logger.error("리스트 출력 실패", e);
			return "error"; // sendrerdirect ? or forward?
		}
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
*/



package com.ssafy.happyhouse.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.Notice;
import com.ssafy.happyhouse.service.NoticeService;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/api/board")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	@Autowired
	private NoticeService noticeService;
	
	
    @ApiOperation(value = "모든 질문게시판 정보를 반환한다.", response = List.class)
	@GetMapping
	public ResponseEntity<List<Notice>> selectAll() throws Exception {
		logger.debug("selectAll - 호출");
		return new ResponseEntity<List<Notice>>(noticeService.selectAll(), HttpStatus.OK);
	}
   
    
    @ApiOperation(value = "글번호에 해당하는 게시글의 정보를 반환한다.", response = Notice.class)    
   	@GetMapping("{no}")
   	public ResponseEntity<Notice> searchByNo(@PathVariable int no) {
   		logger.debug("detailQnA - 호출");
   		return new ResponseEntity<Notice>(noticeService.searchByNo(no), HttpStatus.OK);
   	}

    @ApiOperation(value = "새로운 질문게시판의 정보를 입력한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
   	@PostMapping
   	public ResponseEntity<String> insert(@RequestBody Notice notice) {
   		logger.debug("writeQnA - 호출");
   		if (noticeService.insert(notice)==1) {
   			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
   		}
   		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
   	}

    @ApiOperation(value = "글번호에 해당하는 질문게시판의 정보를 수정한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
   	@PutMapping("{no}")
   	public ResponseEntity<String> update(@RequestBody Notice notice) {
   		logger.debug("updateQnA - 호출");
   		logger.debug("" + notice);
   		
   		if (noticeService.update(notice)==1) {
   			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
   		}
   		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
   	}

    @ApiOperation(value = "글번호에 해당하는 질문게시판의 정보를 삭제한다. 그리고 DB삭제 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
   	@DeleteMapping("{no}")
   	public ResponseEntity<String> delete(@PathVariable int no) {
   		logger.debug("deleteNotice - 호출");
   		if (noticeService.delete(no)==1) {
   			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
   		}
   		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
   	}

}
