package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface MileageMapper {
	@Select("SELECT TOTAL_POINT "
			+ "FROM (SELECT TOTAL_POINT,rownum "
			+ "FROM MILEAGE_HISTORY WHERE id=#{id} ORDER BY mno DESC) "
			+ "WHERE rownum=1")
	public int getMileage(String id);
	@Insert("INSERT INTO MILEAGE_HISTORY(mno,id,no,type,state,describe,point,total_point) "
			+ "VALUES(mh_mno_seq.nextval,#{id},#{no},#{type},#{state},#{describe},#{point},#{total_point})")
	public void mileageInsert(MileageVO vo);
	@Select("SELECT regdateStr,type,describe,state,point,total_point,((SELECT COUNT(*) FROM MILEAGE_HISTORY WHERE id='hong')-rownum+1) as num "
			+ "FROM (SELECT regdateStr,type,describe,state,point,total_point,rownum "
			+ "FROM (SELECT TO_CHAR(regdate,'YYYY-MM-DD') as regdateStr,type,describe,state,point,total_point "
			+ "FROM MILEAGE_HISTORY WHERE id=#{id} ORDER BY mno DESC)) "
			+ "WHERE rownum BETWEEN #{start} AND #{end}")
	public List<MileageVO> myMileageListData(Map map);
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM MILEAGE_HISTORY WHERE id=#{id}")
	public int myMileageTotalPage(String id);
}
