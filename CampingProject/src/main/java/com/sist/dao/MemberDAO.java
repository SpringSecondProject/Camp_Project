package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.*;
import com.sist.vo.*;
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
}
