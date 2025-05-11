package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
public interface ItemMapper {
	@Select("SELECT ino,poster,type,brand,name,price,discount,rcount,num "
			+"FROM (SELECT ino,poster,type,brand,name,price,discount,rcount,rownum as num "
			+"FROM (SELECT ino,poster,type,brand,name,price,discount,rcount "
			+"FROM Item)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<ItemVO> itemListData(
			   @Param("start") int start,
			   @Param("end") int end);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM item")
	public int itemTotalPage();
	
	@Select("SELECT * FROM item "
			  +"WHERE ino=#{ino}")
	public ItemVO itemDetailData(int ino);
	
	@Select("SELECT ino,poster,type,brand,name,price,discount,rcount,num "
	        + "FROM (SELECT ino,poster,type,brand,name,price,discount,rcount,rownum as num "
	        + "FROM Item WHERE type=#{category}) "
	        + "WHERE num BETWEEN #{start} AND #{end}")
	public List<ItemVO> itemListByCategory(@Param("start") int start,
	                                        @Param("end") int end,
	                                        @Param("category") String category);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM item")
	public int itemTotalPageByCategory(String category);
	
	@Select("<script>"
	        + "SELECT ino,poster,type,brand,name,price,discount,rcount,num "
	        + "FROM (SELECT ino,poster,type,brand,name,price,discount,rcount,rownum as num "
	        + "FROM (SELECT * FROM item "
	        + "<where>"
	        + "<if test='min != null'>TO_NUMBER(REPLACE(price, ',', '')) &gt;= #{min}</if>"
	        + "<if test='min != null and max != null'> AND </if>"
	        + "<if test='max != null'>TO_NUMBER(REPLACE(price, ',', '')) &lt;= #{max}</if>"
	        + "</where>"
	        + ")) "
	        + "WHERE num BETWEEN #{start} AND #{end}"
	        + "</script>")
	public List<ItemVO> itemListByPrice(@Param("start") int start, @Param("end") int end,
	                                    @Param("min") Integer min, @Param("max") Integer max);
	
	@Select("<script>"
	        + "SELECT CEIL(COUNT(*)/20.0) FROM item "
	        + "<where>"
	        + "price IS NOT NULL "
	        + "AND REGEXP_LIKE(price, '^[0-9,]+$') "
	        + "<if test='min!=null'>AND TO_NUMBER(REPLACE(price, ',', ''))&gt;=#{min}</if> "
	        + "<if test='min!=null and max != null'>AND</if> "
	        + "<if test='max!=null'>TO_NUMBER(REPLACE(price, ',', ''))&lt;=#{max}</if> "
	        + "</where>"
	        + "</script>")
	public int itemPriceTotalPage(@Param("min") Integer min, @Param("max") Integer max);
	
	@Select("SELECT ino,poster,type,brand,name,price,discount,rcount,num "
            +"FROM (SELECT ino,poster,type,brand,name,price,discount,rcount,rownum as num "
            +"FROM (SELECT /*+ INDEX_ASC(item item_ino_pk)*/ino,poster,type,brand,name,price,discount,rcount "
            +"FROM item WHERE ${fd} LIKE '%'||#{ss}||'%')) "
            +"WHERE num BETWEEN #{start} AND #{end}")
	public List<ItemVO> itemFindList(@Param("start") int start,
			   @Param("end") int end,@Param("fd") String fd,@Param("ss") String ss);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) "
			+"FROM item "
			+"WHERE ${fd} LIKE '%'||#{ss}||'%' ")
	public int itemFindTotalPage(@Param("fd") String fd,@Param("ss") String ss);
}
