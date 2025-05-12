package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface ReserveMapper {
	@Select("SELECT * FROM CAMP_SITE WHERE cno=#{cno}")
	public List<SiteVO> siteListData(int cno);
	@Select("SELECT DISTINCT DNO FROM RESERVE_DETAIL d "
			+ "WHERE RESDATE IN(#{startDateStr},#{endDateStr}) "
			+ "AND sno=(SELECT SNO FROM CAMP_SITE s WHERE s.CNO=#{cno} AND TYPE=#{type})")
	public List<Integer> reserveListData(ReserveVO vo);
}
