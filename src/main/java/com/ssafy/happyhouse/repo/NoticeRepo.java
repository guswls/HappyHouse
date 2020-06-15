package com.ssafy.happyhouse.repo;

import java.util.List;

import com.ssafy.happyhouse.dto.Notice;

public interface NoticeRepo {

	

	public int insert(Notice notice);
	public List<Notice> selectAll();
	public Notice searchByNo(int no);
	public int update(Notice notice);
	public int delete(int no);
}
