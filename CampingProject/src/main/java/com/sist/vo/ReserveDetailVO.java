package com.sist.vo;

import lombok.Data;
import java.util.*;
@Data
public class ReserveDetailVO {
	private int rno,sno,cno,dno;
	private String resdateStr;
	private Date resdate;
	private SiteVO svo;
}
