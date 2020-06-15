package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.Notice;

public interface NoticeService {

	public List<Notice> selectAll() ;
	public Notice searchByNo(int no);
	public int insert(Notice notice) ;
	public int delete(int no) ;
	public int update(Notice notice) ;
}
