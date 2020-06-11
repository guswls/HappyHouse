package com.ssafy.happyhouse.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HouseInfo implements Serializable, Comparable<HouseInfo> {
	/**아파트를 식별할 번호*/
	private int no;
	/**법정 동명 */
	private String dong;
	/**아파트 이름 */
	private String AptName;
	/**법정 동코드 */
	private int code;
	/**건축 연도*/
	private int buildYear;
	/**지번*/
	private String jibun;
	/** */
	private String lat;
	private String lng;
	/**이미지 경로*/
	protected String img;
	
	public HouseInfo(int no) {
		this.no = no;
	}
	
	public int compareTo(HouseInfo o) {
		if(o!=null && o.dong != null&&dong!=null) {
			return dong.compareTo(o.dong);
		}
		return 0;
	}
}



