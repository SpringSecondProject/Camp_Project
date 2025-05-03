package com.sist.vo;

import lombok.Data;
/*
NO           NOT NULL NUMBER         
POSTER       NOT NULL VARCHAR2(4000) 
TITLE        NOT NULL VARCHAR2(1000) 
CHEF         NOT NULL VARCHAR2(1000) 
CHEF_POSTER  NOT NULL VARCHAR2(1000) 
CHEF_COMMENT NOT NULL VARCHAR2(1000) 
COOK_PORTION NOT NULL VARCHAR2(100)  
COOK_TIME    NOT NULL VARCHAR2(100)  
COOK_LEVEL   NOT NULL VARCHAR2(100)  
CONTENT      NOT NULL VARCHAR2(4000) 
FOODMAKE     NOT NULL CLOB           
MATERIALS             CLOB           
LIKECOUNT             NUMBER         
REPLYCOUNT            NUMBER    
SCRAPCOUNT            NUMBER    
 */
@Data
public class RecipeVO {
	private int no,likecount,replycount,scrapcount;
	private String poster,title,content,foodmake,materials;
	private String chef,chef_poster,chef_comment;
	private String cook_portion,cook_time,cook_level;
}
