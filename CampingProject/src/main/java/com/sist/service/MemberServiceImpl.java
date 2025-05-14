package com.sist.service;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

  @Autowired
  private MemberDAO dao;

  @Override
  public int memberIdCheck(String id) {
    return dao.memberIdCheck(id);
  }

  @Override
  public void memberInsert(MemberVO vo) {
    dao.memberInsert(vo);
    dao.memberAuthorityInsert(vo.getId());
  }

  @Override
  public MemberVO memberInfoData(String id) {
    return dao.memberInfoData(id);
  }

  @Override
  public void memberInfoUpdate(MemberVO vo) {
    dao.memberInfoUpdate(vo);
  }
}
