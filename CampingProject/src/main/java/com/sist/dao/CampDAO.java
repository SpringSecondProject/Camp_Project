package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.manager.*;
import com.sist.mapper.CampMapper;
import com.sist.vo.*;
@Repository
public class CampDAO {
	@Autowired
	private CampMapper mapper;
	
	public String campGetTitle(int cno) {
		return mapper.campGetTitle(cno);
	}
}
