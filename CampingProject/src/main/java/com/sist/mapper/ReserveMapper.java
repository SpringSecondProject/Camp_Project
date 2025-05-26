package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

public interface ReserveMapper {
	@Select("SELECT * FROM CAMP_SITE WHERE cno=#{cno}")
	public List<SiteVO> siteListData(int cno);
	@Select("SELECT DISTINCT DNO FROM RESERVE_DETAIL d "
			+ "WHERE RESDATE IN(TO_DATE(#{startDateStr}, 'YYYY-MM-DD'),TO_DATE(#{endDateStr}, 'YYYY-MM-DD')) "
			+ "AND sno=(SELECT SNO FROM CAMP_SITE s WHERE s.CNO=#{cno} AND TYPE=#{type})")
	public List<Integer> reserveListData(ReserveVO vo);
	@Insert("INSERT INTO CAMP_RESERVE(rno,id,cno,title,regdate,startdate,enddate,price,state) "
			+ "VALUES(cr_rno_seq.nextval,#{id},#{cno},#{title},SYSDATE,TO_DATE(#{startDateStr}, 'YYYY-MM-DD'),TO_DATE(#{endDateStr}, 'YYYY-MM-DD'),#{price},0)")
	public void reserveInsert(ReserveVO vo);
	@Select("SELECT rno FROM (SELECT rno FROM CAMP_RESERVE WHERE id=#{id} ORDER BY rno DESC) WHERE rownum=1")
	public int reserveFindNewRno(String id);
	@Select("SELECT sno FROM CAMP_SITE WHERE cno=#{cno} AND type=#{type}")
	public int siteFindSno(ReserveVO vo);
	@Select("SELECT COUNT(*) FROM RESERVE_DETAIL WHERE sno=#{sno} AND dno=#{dno} AND resdate=#{resdate}")
	public int reserveCheck(ReserveDetailVO vo);
	@Insert("INSERT INTO RESERVE_DETAIL(rno,sno,cno,dno,resdate) "
			+ "VALUES(#{rno},#{sno},#{cno},#{dno},#{resdate})")
	public void reserveDetailInsert(ReserveDetailVO vo);
	
	public ReserveVO reserveDetailData(int rno);
	public List<ReserveVO> myReserveListData(Map map); 
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM CAMP_RESERVE WHERE id=#{id} AND TRUNC(SYSDATE) <= TRUNC(endDate) AND state!=-1")
	public int myReserveTotalPage(String id);
	//예약 취소
	@Delete("DELETE FROM RESERVE_DETAIL WHERE rno=#{rno}")
	public void reserveDetailDelete(int rno);
	@Update("UPDATE CAMP_RESERVE SET state=-1 WHERE rno=#{rno}")
	public void reserveCancelState(int rno);
	@Update("UPDATE CAMP_RESERVE SET state=1 WHERE rno=#{rno}")
	public void reserveConfirmedState(int rno);
	@Select("SELECT id FROM CAMP_RESERVE WHERE rno=#{rno}")
	public String reserveGetId(int rno);
	@Select("SELECT * FROM CAMP_RESERVE WHERE STATE=0 AND TRUNC(SYSDATE)+7 >= TRUNC(startDate)")
	public List<ReserveVO> reserveConfirmedList();
}
