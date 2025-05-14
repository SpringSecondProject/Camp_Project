package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Service
public class MileageServiceImpl implements MileageService{
	@Autowired
	private MileageDAO mDao;
	
	@Autowired
	private ReserveDAO rDao;

	@Override
	public int getMileage(String id) {
		return mDao.getMileage(id);
	}
	@Override
	public String mileageAdd(MileageVO vo) {
		Map map=new HashMap();
		String result="";
		vo.setState("적립");
		try {
			String describe="";
			if(vo.getType()==0) {// 캠핑장 적립
				ReserveVO rvo=rDao.reserveDetailData(vo.getNo());
				int point=(int)(Math.ceil(rvo.getPrice()/100));
				String id=rvo.getId();
				
				vo.setPoint(point);
				vo.setTotal_point(getMileage(id)+point);
				
				describe+=rvo.getTitle()+" ("+rvo.getStartDateStr()+" ~ "+rvo.getEndDateStr()+") 예약 : "+point+" 포인트 적립";
			}else {// 쇼핑몰 적립
				
			}
			vo.setDescribe(describe);
			mDao.mileageInsert(vo);
			result="OK";
		} catch (Exception e) {
			e.printStackTrace();
			result="NO";
		}
		return result;
	}
	@Override
	public String mileageUse(MileageVO vo) {
		Map map=new HashMap();
		String result="";
		vo.setState("사용");
		try {
			String describe="";
			if(vo.getType()==0) {// 캠핑장 사용
				ReserveVO rvo=rDao.reserveDetailData(vo.getNo());
				String id=rvo.getId();
				vo.setTotal_point(getMileage(id)-vo.getPoint());
				
				describe+=rvo.getTitle()+" ("+rvo.getStartDateStr()+" ~ "+rvo.getEndDateStr()+") 예약 : "+vo.getPoint()+" 포인트 사용";
			}else {// 쇼핑몰 사용
				
			}
			vo.setDescribe(describe);
			mDao.mileageInsert(vo);
			result="OK";
		} catch (Exception e) {
			result="NO";
		}
		return result;
	}

}
