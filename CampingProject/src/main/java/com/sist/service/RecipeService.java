package com.sist.service;

import java.util.*;

import com.sist.vo.*;

public interface RecipeService {
	public List<RecentRecipeVO> selectRecentData(int topSize);
	public int findRecentRecipe(String title);
	public int findRecipeDetail(String title);
	public void insertRecentData(RecentRecipeVO vo);
	
	public List<ChefVO> chefListData(Map map);
	public int chefTotalPage(int rowSize);

	public List<RecipeVO> recipeListData(Map map);
	public int recipeTotalCount(Map map);
	public RecipeVO recipeDetailData(int no);
	public List<RecipeVO> chefsRecipeListData(Map map);
	public int chefsRecipeTotalPage(Map map);
	
}
