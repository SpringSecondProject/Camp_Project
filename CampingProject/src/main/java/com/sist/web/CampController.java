package com.sist.web;

import java.util.*;

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
	private CampManager cm;
	
	@GetMapping("camp/detail.do")
	public String camp_detail(int cno,Model model) {
		String title=service.campGetTitle(cno);
		Map data=new HashMap();
		List<String> images=new ArrayList<String>();
		try {
			//상세정보
			String detail=cm.CampJsonData(title);
			JSONParser jp=new JSONParser();
			JSONObject root=(JSONObject)jp.parse(detail);
			JSONObject response=(JSONObject)root.get("response");
			JSONObject body=(JSONObject)response.get("body");
			JSONObject items=(JSONObject)body.get("items");
			JSONArray item=(JSONArray)items.get("item");
			JSONObject detail_data=(JSONObject)item.get(0);
			
			data=detail_data;
			//이미지정보
			String images_data=cm.CampImagesData(cno);
			root=(JSONObject)jp.parse(images_data);
			response=(JSONObject)root.get("response");
			body=(JSONObject)response.get("body");
			items=(JSONObject)body.get("items");
			item=(JSONArray)items.get("item");
			if(item.size()!=0) {
				for(int i=0;i<item.size();i++) {
					JSONObject image=(JSONObject)item.get(i);
					String url=(String)image.get("imageUrl");
					images.add(url);
				}
			}
		} catch (Exception e) {}
		model.addAttribute("vo",data);
		model.addAttribute("images",images);
		model.addAttribute("main_jsp","../camp/detail.jsp");
		return "main/main";
	}
	@GetMapping("camp/reserve.do")
	public String camp_reserve(Model model) {
		model.addAttribute("main_jsp","../camp/reserve.jsp");
		return "main/main";
	}
}
