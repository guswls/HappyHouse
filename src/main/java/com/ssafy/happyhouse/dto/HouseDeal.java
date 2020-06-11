package com.ssafy.happyhouse.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class HouseDeal implements Serializable, Comparable<HouseDeal> {
	public static String  APT_DEAL="아파트 매매";
	public static String  APT_RENT="아파트 전월세";
	public static String  HOUSE_DEAL="연립,주택 매매";
	public static String  HOUSE_RENT="연립,주택 전월세";
	/**거래 정보를 식별할 번호*/
	private int    no;
	/**법정 동명 */
	private String dong;
	/**아파트 이름 */
	private String aptName;
	/**법정 동코드 */
	private int code;
	/**거래 금액 */
	private String dealAmount;
	/**건축 연도*/
	private int buildYear;
	/**거래 연도*/
	private int dealYear;
	/**거래 월 */
	private int dealMonth;
	/**거래 일 */
	private int dealDay;
	/**전용면적 */
	private double area;
	/**층*/
	private int floor;
	/**지번*/
	/** */
	private String lat;
	private String lng;
	private String jibun;
	/**type
	 * 1 : 아파트 매매
	 * 2 : 연립 다세세 매매
	 * 3 : 아파트 전월세
	 * 4 : 연립 다세세 전월세
	 * */
	private String type;
	private String rentMoney;
	private String img;

	@Override
	public int compareTo(HouseDeal o) {
		if(o!=null && o.dong != null&&dong!=null) {
			return dong.compareTo(o.dong);
		}
		return 0;
	}

}







