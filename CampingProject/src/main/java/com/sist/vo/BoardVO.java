package com.sist.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int bno,type,hit,lcount,fcount,rcount;
	private String id,nickname,subject,content,regdate;
}
