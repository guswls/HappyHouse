package com.ssafy.happyhouse.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Notice {
	
	private int no;
	private String subject;
	private String content;
	private Date date;
	
	
	public Notice(String subject, String content) {
		super();
		this.subject = subject;
		this.content = content;
	}

}
