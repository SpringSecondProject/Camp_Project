package com.sist.web;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sist.manager.*;
import com.sist.service.*;
import com.sist.vo.*;
@RestController
public class CampRestController {
	@Autowired
	private CampService service;
	
	@Autowired
	private CampManager cm;
	@GetMapping("camp/detail_vue.do")
	public Map camp_detail(int cno) {
		Map map=new HashMap();
		String title=service.campGetTitle(cno);
		try {
			String json=cm.CampJsonData(title);
			JSONParser jp=new JSONParser();
			JSONObject root=(JSONObject)jp.parse(json);
			JSONObject response=(JSONObject)root.get("response");
			JSONObject body=(JSONObject)response.get("body");
			JSONObject items=(JSONObject)body.get("items");
			JSONArray item=(JSONArray)items.get("item");
			JSONObject data=(JSONObject)item.get(0);
			map=data;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
