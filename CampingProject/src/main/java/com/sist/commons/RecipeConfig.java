package com.sist.commons;

import java.util.*;

public class RecipeConfig {
	public static final int RECIPE_SIZE=12;
	public static final int TOP_SIZE=12;
	public static final int CHEF_SIZE=100;
	public static final int BLOCK_SIZE=10;
	public static final int COOKIE_SIZE=5;
	
	public static final int REVIEW_TYPE=2;
	public static final int REVIEW_SIZE=10;
	public static final int REVIEW_BLOCK=5;

	public static final String PAGE_DEFAULT="1";
	public static final String RECIPE_DEFAULT="57";
	public static final String CHEF_FD_DEFAULT="fcount";
	
	public static final Map<String, String> RECIPE_FIND_TYPE= new LinkedHashMap<String, String>() {{
															    put("title", 		"레시피명");
															    put("chef", 		"셰프명");
															    put("content", 		"소개");
															    put("materials", 	"재료");
															}};

	public static final String STEP_SEPERATOR="\n";
	public static final String IMAGE_SEPERATOR="^";
	public static final String MATERIAL_SEPERATOR=",";
}
