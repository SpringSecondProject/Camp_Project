package com.sist.dao;

import com.sist.mapper.MemberMapper;
import com.sist.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

  @Autowired
  private MemberMapper mapper;

  public int memberIdCheck(String id) {
    return mapper.memberIdCheck(id);
  }

  public void memberInsert(MemberVO vo) {
    mapper.memberInsert(vo);
  }

  public void memberAuthorityInsert(String id) {
    mapper.memberAuthorityInsert(id);
  }

  public MemberVO memberInfoData(String id) {
    return mapper.memberInfoData(id);
  }

  public void memberInfoUpdate(MemberVO vo) {
    mapper.memberInfoUpdate(vo);
  }

  public void memberInfoDelete(String id) {
    mapper.memberInfoDelete(id);
  }
}
