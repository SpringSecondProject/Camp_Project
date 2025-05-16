package com.sist.mapper;

import com.sist.vo.CampCarVO;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface CampCarMapper {

  @Select("SELECT id, name, capacity, price, poster, num "
      + "FROM (SELECT id, name, capacity, price, poster, rownum as num "
      + "FROM (SELECT id, name, capacity, price, poster "
      + "FROM CAMPCAR order by id desc)) "
      + "WHERE num BETWEEN #{start} AND #{end}")
  public List<CampCarVO> campcarListData(
      @Param("start") int start,
      @Param("end") int end
  );

  @Select("SELECT ceil(COUNT(*) / 12.0) FROM CAMPCAR")
  public int campcarTotalPage();

  @Select("SELECT id, name, capacity, price, poster, options, address, content FROM CAMPCAR WHERE id=#{id}")
  public CampCarVO campcarDetailData(int id);

}
