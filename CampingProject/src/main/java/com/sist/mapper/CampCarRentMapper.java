package com.sist.mapper;

import com.sist.vo.CampCarRentVO;
import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface CampCarRentMapper {

  @Select("SELECT id, cid, startdate, enddate, regdate, price, poster, name, capacity, num "
      + "FROM (SELECT id, cid, startdate, enddate, regdate, price, poster, name, capacity, rownum as num "
      + "FROM (SELECT id, cid, startdate, enddate, regdate, price, poster, name, capacity "
      + "FROM CAMPCARRENT where pid=#{id} order by id desc )) "
      + "WHERE num BETWEEN #{start} AND #{end} ")
  public List<CampCarRentVO> campcarrentListData(
      @Param("start") int start,
      @Param("end") int end,
      @Param("id") String id
  );

  @Select("SELECT CEIL(COUNT(*) / 12.0) FROM CAMPCARRENT where pid=#{id}")
  public int campcarrentTotalPage(String id);

  @Insert(
      "INSERT INTO CAMPCARRENT(pid, cid, startdate, enddate, regdate, price, poster, name, capacity) "
          + "VALUES(#{pid}, #{cid}, TO_DATE(#{startdate}, 'YYYY-MM-DD'), TO_DATE(#{enddate}, 'YYYY-MM-DD'), SYSDATE, #{price}, #{poster}, #{name}, #{capacity})")
  public void campcarrentInsert(CampCarRentVO vo);


}
