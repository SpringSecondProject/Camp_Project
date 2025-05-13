package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.service.*;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.vo.*;
@Controller
public class CamplistController {
	@Autowired
	private CamplistService service;
	
			
	@GetMapping("camp/list.do")
	public String camp_list(Model model,HttpServletRequest request) {
		
		 List<CampVO> recentList = new ArrayList();
	        Cookie[] cookies = request.getCookies();
	        if (cookies != null) {
	            for (int i = cookies.length - 1; i >= 0; i--) {
	                Cookie c = cookies[i];
	                if (c.getName().startsWith("spring_camp_")) {
	                    try {
	                        int cno = Integer.parseInt(c.getValue());
	                        CampVO vo = service.CampCookie(cno);

	              	      //System.out.println(cno);
	                        recentList.add(vo);
	                    } catch (Exception e) {}
	                } 
	            }
	        }
	      //System.out.println(recentList);
	    model.addAttribute("recentList", recentList);
		model.addAttribute("main_jsp","../camp/list.jsp");
		return "main/main";
	}
	
	@GetMapping("camp/detail_before.do")
	public String campDetailBefore(int cno, HttpServletResponse response, RedirectAttributes ra) {
	    Cookie cookie = new Cookie("spring_camp_" + cno, String.valueOf(cno));
	    cookie.setPath("/");
	    cookie.setMaxAge(60 * 60 * 24); // 1일
	    response.addCookie(cookie);

	    ra.addAttribute("cno", cno);
	    return "redirect:/camp/detail.do";
	    
	}
	
	@GetMapping("like/list.do")
	public String like_list(Model model) {
		model.addAttribute("main_jsp","../like/like_list.jsp");
		return "main/main";
	}
	
	
	
}
