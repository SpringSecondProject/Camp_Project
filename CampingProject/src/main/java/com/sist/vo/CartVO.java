package com.sist.vo;

import java.util.*;
import lombok.Data;

@Data
public class CartVO {
	private int cno,ino,account,price,status,bno;
	private String id;
	private Date regdate;
}