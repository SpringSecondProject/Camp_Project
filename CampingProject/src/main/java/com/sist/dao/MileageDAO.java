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
		int mileage=0;
		try {
			mileage=mapper.getMileage(id);
		} catch (Exception e) {
			mileage=0;
		}
		return mileage; 
	}
	public void mileageInsert(MileageVO vo) {
		mapper.mileageInsert(vo);
	}
}
