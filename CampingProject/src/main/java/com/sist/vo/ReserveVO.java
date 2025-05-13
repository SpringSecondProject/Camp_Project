package com.sist.vo;

import lombok.Data;
import java.util.*;

@Data
public class ReserveVO {
	private int rno,cno,price,state,type;
	private String id,title,regdateStr,startDateStr,endDateStr;
	private Date regdate,startDate,endDate;
	private List<ReserveDetailVO> rdList;
	private int[] sites;
	private int bak; //예약일 수
}
