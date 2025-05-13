package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.vo.*;
import com.sist.dao.*;


@Service
public class CamplistServiceImpl implements CamplistService {
	
    @Autowired
    private CamplistDAO cDao;

	@Override
	public List<CampVO> campListData(Map map) {
		// TODO Auto-generated method stub
		return cDao.campListData(map);
	}

	@Override
	public int campTotalPage() {
		// TODO Auto-generated method stub
		return cDao.campTotalPage();
	}

	@Override
	public List<CampVO> campFilter(Map map) {
		// TODO Auto-generated method stub
		return cDao.campFilter(map);
	}

	@Override
	public int campFilterTotalPage(Map map) {
		// TODO Auto-generated method stub
		return cDao.campFilterTotalPage(map);
	}

	@Override
	public List<CampVO> campLocationCount() {
		// TODO Auto-generated method stub
		return cDao.campLocationCount();
	}

	@Override
	public List<String> campIndutyList() {
		// TODO Auto-generated method stub
		return cDao.campIndutyList();
	}

	@Override
	public List<String> campLctclList() {
		// TODO Auto-generated method stub
		return cDao.campLctclList();
	}

	@Override
	public void HitIncrement(int cno) {
		// TODO Auto-generated method stub
		cDao.HitIncrement(cno);
	}

	//쿠키용
	@Override
	public CampVO CampCookie(int cno) {
		// TODO Auto-generated method stub
		return cDao.CampCookie(cno);
	}


}