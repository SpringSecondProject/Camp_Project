package com.sist.mapper;

import com.sist.vo.ServiceVO;
import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ServiceMapper {

  @Select("SELECT id, pid, type, title, content, regdate, ok, num "
      + "FROM (SELECT id, pid, type, title, content, regdate, ok, rownum as num "
      + "FROM (SELECT id, pid, type, title, content, regdate, ok "
      + "FROM service where type=0 order by id desc)) "
      + "WHERE num BETWEEN #{start} AND #{end}")
  public List<ServiceVO> serviceListData(
      @Param("start") int start,
      @Param("end") int end
  );

  @Select("SELECT ceil(COUNT(*) / 12.0) FROM service where type=0")
  public int serviceTotalPage();

  @Select("SELECT id, pid, type, title, content, regdate, ok "
      + "from service where id=#{id} and type=0 ")
  public ServiceVO serviceDetailQuestion(@Param("id") int id);

  @Select("SELECT id, pid, type, title, content, regdate, ok "
      + "from service where pid=#{id} and type=1 ")
  public ServiceVO serviceDetailAnswer(@Param("id") String id);

  @Insert("INSERT INTO service(id, pid, type, title, content, regdate, ok) "
      + "values (SERVICE_SEQ.nextval, #{pid}, 0, #{title}, #{content}, SYSDATE, 0) ")
  public void serviceWriteQuestion(ServiceVO vo);

  @Update("UPDATE service set ok=1 where id=#{id} ")
  public void serviceUpdateOk(@Param("id") int id);

  @Insert("INSERT INTO service(id, pid, type, title, content, regdate, ok) "
      + "values (SERVICE_SEQ.nextval, #{pid}, 1, #{title}, #{content}, sysdate, 1) ")
  public void serviceWriteAnswer(ServiceVO vo);
}
