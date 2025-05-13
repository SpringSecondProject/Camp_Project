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
@RestController
public class CampRestController {
	@Autowired
	private CampService service;

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
	public String camp_reserve(ReserveVO vo,HttpSession session) {
		String result="";
		try {
			String id=(String)session.getAttribute("userid");
			vo.setId(id);
			System.out.println(vo);
			service.reserveInsert(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
