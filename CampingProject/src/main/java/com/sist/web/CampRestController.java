package com.sist.web;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sist.manager.*;
import com.sist.service.*;
import com.sist.vo.*;
import com.sist.commons.*;
@RestController
public class CampRestController {
	@Autowired
	private CampService service;
	@Autowired
	private MileageService ms;

	@GetMapping("camp/detail_vue.do")
	public CampVO camp_detail(int cno) {
		CampVO vo=service.campDetailData(cno);
		return vo;
	}
	@GetMapping("camp/site_list_vue.do")
	public List<SiteVO> camp_reserve_list(int cno) {
		List<SiteVO> list=service.siteListData(cno);
		return list;
	}
	@GetMapping("camp/reserve_list_vue.do")
	public Map camp_reserve_list(ReserveVO vo) {
		Map map=new HashMap();
		List<Integer> list=service.reserveListData(vo);
		map.put("rList", list);
		return map;
	}
	@PostMapping("camp/reserve_vue.do")
	public Map camp_reserve(ReserveVO vo,int point,HttpSession session) {
		Map map=new HashMap();
		try {
			String id=(String)session.getAttribute("userid");
			vo.setId(id);
			map=service.reserveInsert(vo);
			MileageVO mvo=new MileageVO();
			int rno=service.reserveFindNewRno(id);
			mvo.setId(id);
			mvo.setNo(rno);
			mvo.setType(0);
			mvo.setPoint(point);
			ms.mileageUse(mvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	////////////////////// 마이페이지-예약(임시)/////////////////////
	@GetMapping("mypage/reserve_list_vue.do")
	public Map mypage_reserve_list(int page,HttpSession session) {
		Map map=new HashMap();
		String id=(String)session.getAttribute("userid");
		int rowSize=5;
		map=ListUtil.setListRange(page, rowSize);
		map.put("id", id);
		List<ReserveVO> list=service.myReserveListData(map);
		int totalpage=service.myReserveTotalPage(id);
		
		map=new HashMap();
		map.put("list", list);
		
		final int BLOCK=10;
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map=ListUtil.setPageRange(map, BLOCK);
		return map;
	}
	// 예약 취소
	@GetMapping("mypage/reserve_cancel_vue.do")
	public String mypage_reserve_cancel(int rno) {
		return service.reserveCancel(rno);
	}
	// 예약 확정
	@GetMapping("mypage/reserve_confirmed_vue.do")
	public String mypage_reserve_confirmed(int rno) {
		return service.reserveConfirmedState(rno);
	}
	////////////////////////////////////////////////////////////
}
