package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class MileageDAO {
	@Autowired
	private MileageMapper mapper;
	
	public int getMileage(String id) {
		return mapper.getMileage(id);
	}
	public void mileageInsert(MileageVO vo) {
		mapper.mileageInsert(vo);
	}
}
