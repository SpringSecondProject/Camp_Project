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
	
	@GetMapping("camp/list.do")
	public String camp_list(Model model) {
		model.addAttribute("main_jsp","../camp/list.jsp");
		return "main/main";
	}
	
	private String[] icons={"","전기","무선인터넷","장작판매","온수","트렘폴린","물놀이장","놀이터","산책로","운동장","운동시설","마트.편의점","덤프스테이션"};
	@GetMapping("camp/detail.do")
	public String camp_detail(int cno,Model model) {
		String title=service.campGetTitle(cno);
		Map data=new HashMap();
		List<String> images=new ArrayList<String>();
		List<Map> sbrsCl=new ArrayList<Map>();
		String main="";
		String floor="";
		String size="";
		String safe="";
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
			
			//시설 정보
			String sbrsCl_str=(String)detail_data.get("sbrsCl");
			String[] sbr=sbrsCl_str.split(",");
			for(int i=0;i<icons.length;i++) {
				Map map=new HashMap();
				map.put("no", i+1);
				map.put("text", icons[i]);
				int isSbr=0;
				for(String s:sbr) {
					if(icons[i].equals(s)) {
						isSbr=1;
						break;
					}
				}
				map.put("check", isSbr);
				sbrsCl.add(map);
			}
			//주요 시설 정보
			List<String> mList = new ArrayList<>();
			if(!detail_data.get("gnrlSiteCo").equals("0")) mList.add("일반야영장("+detail_data.get("gnrlSiteCo")+"면)"); 
			if(!detail_data.get("autoSiteCo").equals("0")) mList.add("자동차야영장("+detail_data.get("autoSiteCo")+"면)"); 
			if(!detail_data.get("glampSiteCo").equals("0")) mList.add("글램핑("+detail_data.get("glampSiteCo")+"면)"); 
			if(!detail_data.get("caravSiteCo").equals("0")) mList.add("카라반("+detail_data.get("caravSiteCo")+"면)"); 
			if(!detail_data.get("indvdlCaravSiteCo").equals("0")) mList.add("개인 카라반("+detail_data.get("indvdlCaravSiteCo")+"면)"); 	
			
			main=String.join(", ", mList);
			//바닥 형태 정보
			List<String> fList = new ArrayList<>();
			if(!detail_data.get("siteBottomCl1").equals("0")) fList.add("잔디("+detail_data.get("siteBottomCl1")+")"); 
			if(!detail_data.get("siteBottomCl2").equals("0")) fList.add("파쇄석("+detail_data.get("siteBottomCl2")+")"); 
			if(!detail_data.get("siteBottomCl3").equals("0")) fList.add("테크	("+detail_data.get("siteBottomCl3")+")"); 
			if(!detail_data.get("siteBottomCl4").equals("0")) fList.add("자갈("+detail_data.get("siteBottomCl4")+")"); 
			if(!detail_data.get("siteBottomCl5").equals("0")) fList.add("맨흙("+detail_data.get("siteBottomCl5")+")"); 
			
			floor=String.join(", ", fList);
			//사이트 크기 정보
			List<String> sList = new ArrayList<>();
			if(!detail_data.get("siteMg1Co").equals("0")) sList.add((String)detail_data.get("siteMg1Width")+" X "+detail_data.get("siteMg1Vrticl")+" : "+detail_data.get("siteMg1Co")+"개"); 
			if(!detail_data.get("siteMg2Co").equals("0")) sList.add((String)detail_data.get("siteMg2Width")+" X "+detail_data.get("siteMg2Vrticl")+" : "+detail_data.get("siteMg2Co")+"개"); 
			if(!detail_data.get("siteMg3Co").equals("0")) sList.add((String)detail_data.get("siteMg3Width")+" X "+detail_data.get("siteMg3Vrticl")+" : "+detail_data.get("siteMg3Co")+"개"); 
			
			size=String.join(", ", sList);
			//안전시설 정보
			List<String> aList = new ArrayList<>();
			if(!detail_data.get("extshrCo").equals("0")) aList.add("소화기 : "+detail_data.get("extshrCo")+"개"); 
			if(!detail_data.get("frprvtWrppCo").equals("0")) aList.add("방화수 : "+detail_data.get("frprvtWrppCo")+"개"); 
			if(!detail_data.get("frprvtSandCo").equals("0")) aList.add("방화사 : "+detail_data.get("frprvtSandCo")+"개"); 
			if(!detail_data.get("fireSensorCo").equals("0")) aList.add("화재감지기 : "+detail_data.get("fireSensorCo")+"개"); 
			
			safe=String.join(", ", aList);
			
			//이미지정보
			String images_data=cm.CampImagesData(cno);
			JSONObject iRoot=(JSONObject)jp.parse(images_data);
			JSONObject iResponse=(JSONObject)iRoot.get("response");
			JSONObject iBody=(JSONObject)iResponse.get("body");
			JSONObject iItems=(JSONObject)iBody.get("items");
			JSONArray iItem=(JSONArray)iItems.get("item");
			if(iItem.size()!=0) {
				for(int i=1;i<iItem.size();i++) {
					JSONObject image=(JSONObject)iItem.get(i);
					String url=(String)image.get("imageUrl");
					images.add(url);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("vo",data);
		model.addAttribute("images",images);
		model.addAttribute("sbrsCl",sbrsCl);
		model.addAttribute("main",main);
		model.addAttribute("floor",floor);
		model.addAttribute("size",size);
		model.addAttribute("safe",safe);
		model.addAttribute("main_jsp","../camp/detail.jsp");
		return "main/main";
	}
	@GetMapping("camp/reserve.do")
	public String camp_reserve(Model model) {
		model.addAttribute("main_jsp","../camp/reserve.jsp");
		return "main/main";
	}
}
