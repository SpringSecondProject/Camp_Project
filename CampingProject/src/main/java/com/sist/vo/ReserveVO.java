package com.sist.vo;

import lombok.Data;
import java.util.*;

@Data
public class ReserveVO {
	private int rno,id,cno,price,state,type;
	private String name,regdateStr,startDateStr,endDateStr;
	private Date regdate,startDate,endDate;
	private List<ReserveDetailVO> rdList;
}
