package com.sist.mapper;

import com.sist.vo.MemberVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface MemberMapper {

  // ID 중복 체크
  @Select("SELECT COUNT(*) FROM member WHERE id=#{id}")
  public int memberIdCheck(String id);

  // 회원가입
  @Insert(
      "INSERT INTO member(id,pwd,name,sex,birthday,email,post,addr1,addr2,phone,content,enable) "
          + "VALUES(#{id},#{pwd},#{name},#{sex},TO_DATE(#{dbday}, 'YYYY-MM-DD'),#{email},#{post},#{addr1},#{addr2},#{phone},#{content},1)")
  public void memberInsert(MemberVO vo); 

  // 권한 부여
  @Insert("INSERT INTO authority VALUES(#{id},'ROLE_USER')")
  public void memberAuthorityInsert(String id);

  // 세션 저장 정보
  @Select("SELECT id,name,nickname,email,sex,post,addr1,addr2,phone FROM member WHERE id=#{id}")
  public MemberVO memberInfoData(String id);

  @Update("UPDATE member SET nickname=#{nickname}, post=#{post}, addr1=#{addr1}, addr2=#{addr2}, phone=#{phone} WHERE id=#{id}")
  public void memberInfoUpdate(MemberVO vo);

  @Delete("DELETE FROM member WHERE id=#{id}")
  public void memberInfoDelete(String id);
}
