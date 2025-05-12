package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.*;
@Repository
public class ReserveDAO {
	@Autowired
	private ReserveMapper mapper;
	
	public List<SiteVO> siteListData(int cno){
		return mapper.siteListData(cno);
	}
	public List<Integer> reserveListData(ReserveVO vo) {
		return mapper.reserveListData(vo);
	}
}
