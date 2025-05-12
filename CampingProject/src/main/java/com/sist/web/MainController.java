package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.*;
import com.sist.manager.*;
import com.sist.vo.*;
@Controller
public class MainController {
	@Autowired
	private YoutubeManager ym;
	@GetMapping("main/main.do")
	public String main(Model model) {
		//List<VideoVO> vList=ym.videoListData("캠핑");
		//model.addAttribute("vList",vList);
		model.addAttribute("main_jsp","../main/home.jsp");
		return "main/main";
	}
}
