package com.sist.vo;
import java.util.*;

import lombok.Data;
/*
RNO        NOT NULL NUMBER        
ID         NOT NULL VARCHAR2(20)  
NO         NOT NULL NUMBER        
TYPE       NOT NULL NUMBER        
NICKNAME            VARCHAR2(200) 
SCORE               NUMBER        
MSG        NOT NULL CLOB          
REGDATE    NOT NULL DATE          
MODDATE             DATE          
GROUP_ID   NOT NULL NUMBER        
GROUP_STEP          NUMBER    
 */
@Data
public class ReviewVO {
	private int rno,no,type,group_id,group_step;
	private String id,nickname,sex,msg;
	private Double score;
	private Date regdate,moddate;
	private String rgday,mdday;
}
