package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface RecipeMapper {

	@Select("SELECT no,poster,title,num "
			+ "FROM (SELECT no,poster,title,rownum as num  "
			+ "FROM (SELECT /* INDEX_ASC(recipeDetail rd_no_pk)*/no,poster,title "
			+ "FROM recipeDetail)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<RecipeVO> recipeListData(Map map);
	
	@Select("SELECT COUNT(*) FROM recipeDetail")
	public int recipeTotalCount(Map map);
	@Select("SELECT * FROM recipeDetail "
			+ "WHERE no=#{no}")
	public RecipeVO recipeDetailData(int no);
	
	public List<RecipeVO> chefsRecipeListData(Map map);
	public int chefsRecipeTotalPage(Map map);
}
