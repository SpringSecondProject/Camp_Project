package com.sist.service;

import java.util.*;
import com.sist.vo.*;

public interface MemberService {
	public int memberIdCheck(String id);
	public void memberInsert(MemberVO vo);
	public MemberVO memberInfoData(String id);
}
