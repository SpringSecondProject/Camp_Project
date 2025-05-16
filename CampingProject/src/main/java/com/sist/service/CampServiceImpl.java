package com.sist.service;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.sist.service.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Service
public class CampServiceImpl implements CampService{
	@Autowired
	private CampDAO cDao;
	@Autowired
	private ReserveDAO rDao;
	@Autowired
	private MileageDAO mDao;
	@Autowired
	private MileageService mService;
	
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
	public ReserveVO reserveDetailData(int rno) {
		return rDao.reserveDetailData(rno);
	}
	
	@Override
	@Transactional
	public Map reserveInsert(ReserveVO vo) {
		Map map=new HashMap();
		String result="";
		Set<Integer> set=new HashSet<Integer>();
		try {
			result="OK";
			ReserveDetailVO dvo=new ReserveDetailVO();
			rDao.reserveInsert(vo);
			int rno=rDao.reserveFindNewRno(vo.getId());
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
	                    set.add(dno);
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
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		List<Integer> list = new ArrayList<>(set);
		Collections.sort(list);
		map.put("msg", result);
		map.put("list", list);
		return map;
	}

	@Override
	public int reserveFindNewRno(String id) {
		return rDao.reserveFindNewRno(id);
	}
	///////////////////////////////////////////////////////////
	@Override
	public List<MileageVO> myMileageListData(Map map) {
		return mDao.myMileageListData(map);
	}
	@Override
	public int myMileageTotalPage(String id) {
		return mDao.myMileageTotalPage(id);
	}
	@Override
	public List<ReserveVO> myReserveListData(Map map) {
		return rDao.myReserveListData(map);
	}
	@Override
	public int myReserveTotalPage(String id) {
		return rDao.myReserveTotalPage(id);
	}
	@Override
	@Transactional
	public String reserveCancel(int rno) {
		String msg="";
		try {
			rDao.reserveDetailDelete(rno);
			rDao.reserveCancelState(rno);
			msg="OK";
		} catch (Exception e) {
			msg="NO";
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return msg;
	}

	@Override
	@Transactional
	public String reserveConfirmedState(int rno) {
		String msg="";
		try {
			rDao.reserveConfirmedState(rno);
			MileageVO vo=new MileageVO();
			vo.setId(rDao.reserveGetId(rno));
			vo.setNo(rno);
			vo.setType(0);
			mService.mileageAdd(vo);
			msg="OK";
		} catch (Exception e) {
			msg="NO";
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return msg;
	}
	/////////////////////////////////////////////////////////////////////////
}
