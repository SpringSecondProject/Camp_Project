package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import java.util.*;
import com.sist.vo.*;
public interface CampMapper {
	@Select("SELECT title FROM camp WHERE cno=#{cno}")
	public String campGetTitle(int cno);
	@Select("SELECT * FROM camp WHERE cno=#{cno}")
	public CampVO campDetailData(int cno);
}
