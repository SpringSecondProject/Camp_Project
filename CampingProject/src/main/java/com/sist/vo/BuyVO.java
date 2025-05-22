package com.sist.vo;

import java.util.*;

import lombok.Data;

@Data
public class BuyVO {
	private int bno,total_price,num;
	private String id,regdateStr;
	private Date regdate;
	private List<CartVO> cList;
	private int[] carts;
}
