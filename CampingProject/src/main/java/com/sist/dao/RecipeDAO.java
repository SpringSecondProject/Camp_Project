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
	
	public List<RecipeVO> recipeListData(Map map)
	{
		return mapper.recipeListData(map);
	}
	public int recipeTotalPage(int pageSize)
	{
		return mapper.recipeTotalPage(pageSize);
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
