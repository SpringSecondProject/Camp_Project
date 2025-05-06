package com.sist.service;

import java.util.*;

import com.sist.vo.*;

public interface RecipeService {
	public List<RecipeVO> chefsRecipeListData(Map map);
	public int chefsRecipeTotalPage(Map map);
	
	public List<ChefVO> chefListData(Map map);
	public int chefTotalPage(int rowSize);
}
