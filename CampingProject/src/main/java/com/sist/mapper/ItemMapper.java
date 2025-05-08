package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
public interface ItemMapper {
	@Select("SELECT ino,poster,type,name,price,discount,rcount,num "
			+"FROM (SELECT ino,poster,type,name,price,discount,rcount,rownum as num "
			+"FROM (SELECT ino,poster,type,name,price,discount,rcount "
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
	@Select("SELECT ino,poster,type,name,price,discount,rcount,num "
	        + "FROM (SELECT ino,poster,type,name,price,discount,rcount,rownum as num "
	        + "FROM Item WHERE type=#{category}) "
	        + "WHERE num BETWEEN #{start} AND #{end}")
	public List<ItemVO> itemListByCategory(@Param("start") int start,
	                                        @Param("end") int end,
	                                        @Param("category") String category);
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM item")
	public int itemTotalPageByCategory(String category);
}
