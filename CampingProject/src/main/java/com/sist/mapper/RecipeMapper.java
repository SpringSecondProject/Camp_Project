package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface RecipeMapper {

	@Select("SELECT rno,poster,title,no "
			+ "FROM recipeDetail "
			+ "WHERE rownum<=#{topSize}"
			+ "ORDER BY rno DESC")
	public List<RecentRecipeVO> selectRecentData(int topSize);
	@Insert("INSERT INTO recentRecipe VALUES("
			+ "(SELECT NVL(MAX(rno)+1,1) FROM recentRecipe),"
			+ "#{poster},#{title},#{no})")
	public void insertRecentData(RecentRecipeVO vo);
	@Insert("INSERT INTO recipeDetail VALUES("
			+ "(SELECT NVL(MAX(no)+1,1) FROM recipeDetail),"
			+ "#{poster},#{title},#{chef},#{chef_poster},#{chef_comment},"
			+ "#{cook_portion},#{cook_time},#{cook_level},#{content},#{foodmake},#{materials},"
			+ "0,0,0)")
	public void insertRecipeData(RecipeVO vo);
	@Select("SELECT NVL(MAX(no),0) FROM recipeDetail "
			+ "WHERE title=#{title}")
	public int findRecipeDetail(String title);
	@Select("SELECT NVL(MAX(rno),0) FROM recentRecipe "
			+ "WHERE title=#{title}")
	public int findRecentRecipe(String title);
	
	@Select("SELECT no,poster,title,num "
			+ "FROM (SELECT no,poster,title,rownum as num  "
			+ "FROM (SELECT /* INDEX_DESC(recipeDetail rd_no_pk)*/no,poster,title "
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
