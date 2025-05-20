package com.sist.web;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.manager.*;
import com.sist.service.*;
import com.sist.vo.*;

@Controller
public class CampController {
	@Autowired
	private CampService service;

	@Autowired
	private CamplistService campservice;
	
	
	@Autowired
	private CCTVService cctvService;  

	@Autowired
	private MileageService ms;

	@Autowired
	private CampManager cm;

	@GetMapping("camp/detail.do")
	public String camp_detail(int cno, Model model,HttpServletRequest request) {
		String title = service.campGetTitle(cno);
		cm.CampRequest(title, cno);
		
		CampVO cctvlist = campservice.CampCctv(cno);
		double mapX = Double.parseDouble(cctvlist.getMapX());
		double mapY = Double.parseDouble(cctvlist.getMapY());
		CCTVVO cctv = cctvService.getNearestCCTV(mapX, mapY);
//		System.out.println(mapX);
//		System.out.println(mapY);
		model.addAttribute("cctvlist", cctvlist);
		model.addAttribute("cctv", cctv);
		
		// 쿠키 출력
		 List<CampVO> recentList = new ArrayList();
	        Cookie[] cookies = request.getCookies();
	        if (cookies != null) {
	            for (int i = cookies.length - 1; i >= 0; i--) {
	                Cookie c = cookies[i];
	                if (c.getName().startsWith("spring_camp_")) {
	                    try {
	                        cno = Integer.parseInt(c.getValue());
	                        CampVO vo = campservice.CampCookie(cno);

	              	       //System.out.println(cno);
	                        recentList.add(vo);
	                    } catch (Exception e) {}
	                } 
	            }
	        }
	    //System.out.println(recentList);
	    model.addAttribute("recentList", recentList);
	    
		model.addAttribute("type", 1); 
		model.addAttribute("main_jsp", "../camp/detail.jsp");
		return "main/main";
	}

	@GetMapping("camp/reserve.do")
	public String camp_reserve(int cno, Model model) {
		model.addAttribute("main_jsp", "../camp/reserve.jsp");
		return "main/main";
	}
}
