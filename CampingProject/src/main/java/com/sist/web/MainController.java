package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.sist.manager.*;
import com.sist.vo.*;
import com.sist.service.*;
@Controller
public class MainController {
	@Autowired
	private YoutubeManager ym;
	
	@Autowired
	private CamplistService service;
	
	@Autowired
	private ItemService iservice;
	
	@GetMapping("main/main.do")
	public String main(Model model) {
		//메인페이지 캠핑 관련 영상 => 사용시 YoutubeManager.youtubeJsonData API key값 입력후 주석 해제
		//List<VideoVO> vList=ym.videoListData("캠핑");
		//model.addAttribute("vList",vList);
	    List<CampVO> Clist = service.campMainList(); // 캠핑장 목록 가져오기
	    model.addAttribute("Clist", Clist);
	    
	    List<ItemVO> Ilist = iservice.itemList();
	    model.addAttribute("Ilist", Ilist);
	    
		model.addAttribute("main_jsp","../main/home.jsp");
		return "main/main";
	}
	
	
}
