package com.sist.service;

import com.sist.vo.MemberVO;

public interface MemberService {

  public int memberIdCheck(String id);

  public void memberInsert(MemberVO vo);

  public MemberVO memberInfoData(String id);

  public void memberInfoUpdate(MemberVO vo);

  public void memberInfoDelete(String id);
}
