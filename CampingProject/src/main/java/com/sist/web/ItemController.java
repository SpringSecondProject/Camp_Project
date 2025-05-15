package com.sist.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.service.*;
import com.sist.vo.*;


@Controller
public class ItemController {
	
	@Autowired
	private ItemService service;
	
	@GetMapping("item/list.do")
	public String item_list(Model model, HttpServletRequest request) {
	    List<ItemVO> recentList = new ArrayList<>();
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (int i = cookies.length - 1; i >= 0; i--) {
	            Cookie c = cookies[i];
	            if (c.getName().startsWith("spring_camp_")) {
	                try {
	                    int ino = Integer.parseInt(c.getValue());
	                    ItemVO vo = service.ItemCookie(ino);
	                    recentList.add(vo);
	                } catch (Exception e) {}
	            }
	        }
	    }
	    model.addAttribute("recentList", recentList);
	    model.addAttribute("main_jsp", "../item/list.jsp");
	    return "main/main";
	}

	
	@GetMapping("item/detail.do")
	public String itemDetail(int ino, HttpServletRequest request, HttpServletResponse response, Model model) {
	    // 쿠키 저장
	    Cookie cookie = new Cookie("spring_camp_" + ino, String.valueOf(ino));
	    cookie.setPath("/");
	    cookie.setMaxAge(60 * 60 * 24); // 하루
	    response.addCookie(cookie);
	    
	    // 조회수 증가
	    service.HitIncrement(ino);
	    
	    // 상세 정보 조회
	    ItemVO vo = service.itemDetailData(ino);
	    model.addAttribute("vo", vo);

	    // 최근 본 상품 리스트 추가
	    List<ItemVO> recentList = new ArrayList<>();
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (int i = cookies.length - 1; i >= 0; i--) {
	            Cookie c = cookies[i];
	            if (c.getName().startsWith("spring_camp_")) {
	                try {
	                    int cookieIno = Integer.parseInt(c.getValue());
	                    ItemVO recentVo = service.ItemCookie(cookieIno);
	                    recentList.add(recentVo);
	                } catch (Exception e) {}
	            }
	        }
	    }
	    model.addAttribute("recentList", recentList);

	    model.addAttribute("main_jsp", "../item/detail.jsp");
	    return "main/main";
	}
	@GetMapping("item/find.do")
	public String item_find(Model model) {
		model.addAttribute("main_jsp","../item/find.jsp");
		return "main/main";
	}
	@GetMapping("item/item_cart.do")
	public String item_cart(String id, Model model) {
		List<CartVO> cartItem = service.CartListData(id); 
	    model.addAttribute("cartItem", cartItem);
		model.addAttribute("main_jsp","../item/item_cart.jsp");
		return "main/main";
	}	
}
