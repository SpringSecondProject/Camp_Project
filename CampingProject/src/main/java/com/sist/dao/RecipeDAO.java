package com.sist.dao;
import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class RecipeDAO {
	@Autowired
	private RecipeMapper mapper;
	
	public List<RecentRecipeVO> selectRecentData()
	{
		return mapper.selectRecentData();
	}
	public void insertRecentData()
	{
		mapper.insertRecentData();
	}
	public void insertRecipeData()
	{
		mapper.insertRecipeData();
	}
	public int findRecipeDetail(String title)
	{
		return mapper.findRecipeDetail(title);
	}
	public int findRecentRecipe(String title)
	{
		return mapper.findRecentRecipe(title);
	}
	
	public List<RecipeVO> recipeListData(Map map)
	{
		return mapper.recipeListData(map);
	}
	public int recipeTotalCount(Map map)
	{
		return mapper.recipeTotalCount(map);
	}
	public RecipeVO recipeDetailData(int no)
	{
		return mapper.recipeDetailData(no);
	}
	
	public List<RecipeVO> chefsRecipeListData(Map map)
	{
		return mapper.chefsRecipeListData(map);
	}
	public int chefsRecipeTotalPage(Map map)
	{
		return mapper.chefsRecipeTotalPage(map);
	}
}
