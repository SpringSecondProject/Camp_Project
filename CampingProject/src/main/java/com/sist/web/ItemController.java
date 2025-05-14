package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.service.*;
import com.sist.vo.*;

@Controller
public class ItemController {
	
	@Autowired
	private ItemService service;
	
	@GetMapping("item/list.do")
	public String main(Model model) {
		model.addAttribute("main_jsp","../item/list.jsp");
		return "main/main";
	}
	@GetMapping("item/detail.do")
	public String item_detail(int ino, Model model) {
		ItemVO vo=service.itemDetailData(ino);
	   	model.addAttribute("vo", vo);
	   	model.addAttribute("main_jsp","../item/detail.jsp");
		return "main/main";
	}
	@GetMapping("item/find.do")
	public String item_find(Model model) {
		model.addAttribute("main_jsp","../item/find.jsp");
		return "main/main";
	}
	@GetMapping("item/item_cart.do")
	public String item_cart(@RequestParam("cno") int cno,String id, Model model) {
	    CartVO cartItem = service.getCartItemByCno(cno, id); 
	    model.addAttribute("cartItem", cartItem);
		model.addAttribute("main_jsp","../item/item_cart.jsp");
		return "main/main";
	}	
}
