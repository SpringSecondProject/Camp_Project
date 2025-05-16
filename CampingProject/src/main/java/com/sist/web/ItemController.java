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
	            if (c.getName().startsWith("spring_item_")) {
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
	    Cookie[] cookies = request.getCookies();

	    // 1. 중복 제거
	    if(cookies!=null)
	    {
	        for(Cookie c:cookies)
	        {
	            if(c.getName().equals("spring_item_"+ino))
	            {
	                c.setPath("/");
	                c.setMaxAge(0);
	                response.addCookie(c);
	            }
	        }
	    }
	    List<Cookie>itemCookies=new ArrayList<>();
	    if(cookies!=null)
	    {
	        for(Cookie c:cookies)
	        {
	            if(c.getName().startsWith("spring_item_") && !c.getName().equals("spring_item_"+ino))
	            {
	                itemCookies.add(c);
	            }
	        }
	    }
	    if (itemCookies.size()>=5)
	    {
	        itemCookies.sort((a,b)->a.getName().compareTo(b.getName()));
	        Cookie old=itemCookies.get(0);
	        old.setPath("/");
	        old.setMaxAge(0);
	        response.addCookie(old);
	    }
	    Cookie newCookie=new Cookie("spring_item_"+ino,String.valueOf(ino));
	    newCookie.setPath("/");
	    newCookie.setMaxAge(60*60*24); // 유효기간 1일
	    response.addCookie(newCookie);

	    // 조회수 증가
	    service.HitIncrement(ino);

	    // 상세 정보 조회
	    ItemVO vo=service.itemDetailData(ino);
	    model.addAttribute("vo", vo);

	    // 5. 최근 본 상품 리스트 만들기 (최대 5개 제한)
	    List<ItemVO> recentList=new ArrayList<>();
	    Cookie[] updatedCookies=request.getCookies();
	    if (updatedCookies!=null) {
	        int count=0;
	        for (int i=updatedCookies.length-1;i>=0&&count<5;i--) 
	        {
	            Cookie c=updatedCookies[i];
	            if (c.getName().startsWith("spring_item_"))
	            {
	                try {
	                    int cookieIno=Integer.parseInt(c.getValue());
	                    ItemVO recentVo=service.ItemCookie(cookieIno);
	                    recentList.add(recentVo);
	                    count++;
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
