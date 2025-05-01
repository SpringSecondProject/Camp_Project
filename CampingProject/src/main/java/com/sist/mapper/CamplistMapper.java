package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import com.sist.vo.*;
import java.util.*;

public interface CamplistMapper {
	//camp_no_pk 시퀀스 생성
	
	@Select("SELECT cno,title,intro,poster,induty,lctcl,num "
			+ "FROM (SELECT cno,title,intro,poster,induty,lctcl,rownum as num "
			+ "FROM (SELECT /*+ INDEX_ASC(camp camp_no_pk) */cno,title,intro,poster,induty,lctcl "
			+ "FROM camp WHERE poster IS NOT NULL AND intro IS NOT NULL))"
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<CampVO> campListData(Map map);
	
	@Select("SELECT COUNT(*) FROM camp WHERE poster IS NOT NULL AND intro IS NOT NULL")
	public int campTotalPage(); 
}
