package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CampController {
	@GetMapping("camp/list.do")
	public String camp_list(Model model) {
		model.addAttribute("main_jsp","../camp/list.jsp");
		return "main/main";
	}
	@GetMapping("camp/detail.do")
	public String camp_detail(Model model) {
		model.addAttribute("main_jsp","../camp/detail.jsp");
		return "main/main";
	}
}
