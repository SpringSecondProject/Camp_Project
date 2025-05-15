package com.sist.vo;

import lombok.Data;
import java.util.*;

@Data
public class ReserveVO {
	private int rno,cno,price,state,type;
	private String id,title,regDateStr,startDateStr,endDateStr;
	private Date regDate,startDate,endDate;
	private CampVO cvo;
	private List<ReserveDetailVO> rdList;
	private int[] sites;
	private int bak; //예약일 수
}
