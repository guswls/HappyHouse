package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.Notice;
import com.ssafy.happyhouse.repo.NoticeRepo;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeRepo nRepo;
	@Override
	public List<Notice> selectAll() {
		// TODO Auto-generated method stub
		return nRepo.selectAll();
	}

	@Override
	public Notice searchByNo(int no) {
		// TODO Auto-generated method stub
		return nRepo.searchByNo(no);
	}

	@Override
	public int insert(Notice notice) {
		// TODO Auto-generated method stub
		return nRepo.insert(notice);
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return nRepo.delete(no);
	}

	@Override
	public int update(Notice notice) {
		// TODO Auto-generated method stub
		return nRepo.update(notice);
	}

}
