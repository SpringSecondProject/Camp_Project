package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface MileageMapper {
	@Select("SELECT TOTAL_POINT FROM MILEAGE_HISTORY WHERE id=#{id} AND rownum=1 ORDER BY mno DESC")
	public int getMileage(String id);
	@Insert("INSERT INTO MILEAGE_HISTORY(mno,id,no,type,state,describe,point,total_point) "
			+ "VALUES(mh_mno_seq.nextval,#{id},#{no},#{type},#{state},#{describe},#{point},#{total_point})")
	public void mileageInsert(MileageVO vo);
}
