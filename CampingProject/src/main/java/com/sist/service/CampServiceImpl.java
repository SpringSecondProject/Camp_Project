package com.sist.service;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.*;
import com.sist.vo.*;
@Service
public class CampServiceImpl implements CampService{
	@Autowired
	private CampDAO cDao;

	@Override
	public String campGetTitle(int cno) {
		return cDao.campGetTitle(cno);
	}

	@Override
	public CampVO campDetailData(int cno) {
		return cDao.campDetailData(cno);
	}
}
