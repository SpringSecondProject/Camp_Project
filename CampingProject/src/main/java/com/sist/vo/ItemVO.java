package com.sist.vo;

import lombok.Data;

/*
 * INO      NOT NULL NUMBER         
BRAND             VARCHAR2(100)  
TYPE              VARCHAR2(50)   
NAME              VARCHAR2(400)  
POSTER            VARCHAR2(300)  
IMAGES            VARCHAR2(4000) 
PRICE             VARCHAR2(50)   
CONTENT           CLOB           
DISCOUNT          NUMBER         
HIT               NUMBER         
FCOUNT            NUMBER         
RCOUNT            NUMBER 
 */
@Data
public class ItemVO {
	private int ino,discount,hit,fcount,rcount;
	private String brand,type,name,poster,images,price,content;
}
