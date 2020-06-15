package com.ssafy.happyhouse.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Favorite {

	private int likeid;
	private String likeuid;
	private int likehdid;
	private Date likedate;
}
