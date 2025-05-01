package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.*;
import java.util.*;
import com.sist.vo.*;
@Controller
public class CamplistController {
	@Autowired
	private CamplistService service;
	
	@GetMapping("camp/list.do")
	public String camp_list(Model model) {
		model.addAttribute("main_jsp","../camp/list.jsp");
		return "main/main";
	}
	
}
