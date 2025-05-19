package com.sist.web;

import java.util.*;

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
	private MileageService ms;
	
	@Autowired
	private CampManager cm;
	
	@GetMapping("camp/detail.do")
	public String camp_detail(int cno,Model model) {
		String title=service.campGetTitle(cno);
		cm.CampRequest(title, cno);
		model.addAttribute("type",0);
		model.addAttribute("main_jsp","../camp/detail.jsp");
		return "main/main";
	}
	@GetMapping("camp/reserve.do")
	public String camp_reserve(int cno,Model model) {
		model.addAttribute("main_jsp","../camp/reserve.jsp");
		return "main/main";
	}
}
