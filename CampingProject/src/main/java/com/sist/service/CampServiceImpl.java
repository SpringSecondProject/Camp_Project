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
	@Autowired
	private ReserveDAO rDao;
	
	private String[] camp= {"","일반 야영장","자동차 야영장","글램핑 야영장","카라반","개인 카라반 구역"};
	
	@Override
	public String campGetTitle(int cno) {
		return cDao.campGetTitle(cno);
	}

	@Override
	public CampVO campDetailData(int cno) {
		return cDao.campDetailData(cno);
	}
	
	@Override
	public List<SiteVO> siteListData(int cno) {
		List<SiteVO> list=rDao.siteListData(cno);
		for(SiteVO vo:list) {
			vo.setTypeStr(camp[vo.getType()]);
		}
		return list;
	}

	@Override
	public List<Integer> reserveListData(ReserveVO vo) {
		List<Integer> list=new ArrayList<Integer>();
		List<SiteVO> sList=rDao.siteListData(vo.getCno());
		List<Integer> rList=rDao.reserveListData(vo);
		for(SiteVO svo:sList) {
			if(svo.getType()==vo.getType()) {
				for(int i=0;i<svo.getCount();i++) {
					list.add(0);
				}
			}
		}
		for(int r:rList) {
			list.set(r-1,1);
		}
		
		return list;
	}
}
