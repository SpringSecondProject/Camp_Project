package com.sist.vo;
import java.util.*;
import lombok.Data;
/*
NO     NOT NULL NUMBER        
CHEF   NOT NULL VARCHAR2(300) 
POSTER          VARCHAR2(260) 
RCOUNT          VARCHAR2(30)  
SCOUNT          VARCHAR2(30)  
WCOUNT          VARCHAR2(30)  
FCOUNT          VARCHAR2(30)  
 */
@Data
public class ChefVO {
	private int no;
	private String chef,poster,rcount,scount,wcount,fcount;
}
