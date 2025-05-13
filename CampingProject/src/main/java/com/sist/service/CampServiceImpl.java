package com.sist.service;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

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

	@Override
	@Transactional
	public String reserveInsert(ReserveVO vo) {
		String result="";
		List<ReserveDetailVO> list=new ArrayList<ReserveDetailVO>();
		try {
			result="OK";
			ReserveDetailVO dvo=new ReserveDetailVO();
			rDao.reserveInsert(vo);
			int rno=rDao.reserveFindRno(vo.getId());
			int sno=rDao.siteFindSno(vo);
			dvo.setRno(rno);
			dvo.setSno(sno);
			dvo.setCno(vo.getCno());
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date startDate = sdf.parse(vo.getStartDateStr());
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(startDate);
			
			for(int i=0;i<vo.getBak();i++) {
				dvo.setResdate(cal.getTime());
				
				for(int dno:vo.getSites()) {
					dvo.setDno(dno);
					int check=rDao.reserveCheck(dvo);
					if(check==1) {
						result="NO";
						ReserveDetailVO nvo=new ReserveDetailVO();
						nvo.setRno(dvo.getRno());
						nvo.setSno(dvo.getSno());
						nvo.setCno(dvo.getCno());
						nvo.setDno(dvo.getDno());
						nvo.setResdate(dvo.getResdate());
	                    list.add(nvo);
						continue;
					}else {
						rDao.reserveDetailInsert(dvo);
					}
				}
				
				cal.add(Calendar.DATE, 1);
			}
			if (result.equals("NO")) {
	            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
	        }
		} catch (Exception e) {
			result="NO";
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		for(ReserveDetailVO v:list) {
			System.out.println(v);
		}
		return result;
	}
}
