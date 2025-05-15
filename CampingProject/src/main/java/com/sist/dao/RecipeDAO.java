package com.sist.dao;
import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class RecipeDAO {
	@Autowired
	private RecipeMapper mapper;
	
	public List<RecentRecipeVO> selectRecentData(int topSize)
	{
		return mapper.selectRecentData(topSize);
	}
	@Transactional
	public void insertRecentData(RecentRecipeVO vo)
	{
		String title=vo.getTitle();
		if(vo.getNo()==0)
		{
			mapper.insertRecipeData(vo.getRvo());
			vo.setNo(mapper.findRecipeDetail(vo.getTitle()));
		}
		mapper.insertRecentData(vo);
	}
	public void insertRecipeData(RecipeVO vo)
	{
		mapper.insertRecipeData(vo);
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
