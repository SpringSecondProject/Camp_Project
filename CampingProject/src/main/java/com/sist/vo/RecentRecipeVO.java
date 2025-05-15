package com.sist.vo;

import lombok.Data;
import com.sist.vo.*;

/*
RNO    NOT NULL NUMBER         
POSTER NOT NULL VARCHAR2(4000) 
TITLE  NOT NULL VARCHAR2(1000) 
NO              NUMBER      
 */
@Data
public class RecentRecipeVO {
	private int rno,no;
	private String poster,title;
	private String url;
	
	private RecipeVO rvo;
}
