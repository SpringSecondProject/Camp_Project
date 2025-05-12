package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ItemController {
	@GetMapping("item/list.do")
	public String main(Model model) {
		model.addAttribute("main_jsp","../item/list.jsp");
		return "main/main";
	}
	@GetMapping("item/detail.do")
	public String item_detail(Model model) {
		model.addAttribute("main_jsp","../item/detail.jsp");
		return "main/main";
	}
	@GetMapping("item/find.do")
	public String item_find(Model model) {
		model.addAttribute("main_jsp","../item/find.jsp");
		return "main/main";
	}
}
