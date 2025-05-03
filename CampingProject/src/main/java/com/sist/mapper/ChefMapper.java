package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface ChefMapper {
	
	@Select("SELECT no,chef,poster,rcount,scount,wcount,fcount,num "
			+ "FROM (SELECT no,chef,poster,rcount,scount,wcount,fcount,rownum as num  "
			+ "FROM (SELECT no,chef,poster,rcount,scount,wcount,fcount "
			+ "FROM chef "
			+ "ORDER BY TO_NUMBER(REPLACE(${fd},',','')) DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<ChefVO> chefListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/#{rowSize}) FROM chef")
	public int chefTotalPage(@Param("rowSize") int rowSize);
	
}
