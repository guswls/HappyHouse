package com.ssafy.happyhouse.repo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.Notice;

@Repository
public class NoticeRepoImpl implements NoticeRepo{
	
	private static String ns = "com.ssafy.mapper.Notice.";

	@Autowired
	SqlSessionTemplate template;

	@Override
	public int insert(Notice notice) {
		// TODO Auto-generated method stub
		return template.insert(ns+"insert", notice);
	}

	@Override
	public List<Notice> selectAll() {
		// TODO Auto-generated method stub
		return template.selectList(ns+"selectAll");
	}

	@Override
	public Notice searchByNo(int no) {
		// TODO Auto-generated method stub
		return template.selectOne(ns+"selectOne", no);
	}

	@Override
	public int update(Notice notice) {
		// TODO Auto-generated method stub
		return template.update(ns+"update", notice);
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return template.delete(ns+"delete", no);
	}
	
	

}
