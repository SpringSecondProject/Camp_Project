package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.sist.service.*;

@Controller
public class LikeController {
	@Autowired
	private LikeService lService;

	@GetMapping("like/likeList.do")
	public String likeList(Model model, HttpSession session,
			@RequestParam(name = "page", defaultValue = "1") int page) {
		String id = (String) session.getAttribute("userid");

		int rowSize = 9;
		int start = (rowSize * page) - (rowSize - 1);
		int end = rowSize * page;

		Map map = new HashMap();
		map.put("id", id);
		map.put("type", 0);

		map.put("start", start);
		map.put("end", end);

		List<CampVO> likeList = lService.MyCampLikeList(map);
		int total = lService.countMyCampLikes(map); 

		int totalpage = (int) Math.ceil(total / (double) rowSize);
		int block = 5;
		int startPage = ((page - 1) / block) * block + 1;
		int endPage = startPage + block - 1;
		if (endPage > totalpage)
			endPage = totalpage;

		// System.out.println(likeList+"캠프리스트 정보");
		// System.out.println(likeList);
		model.addAttribute("likeList", likeList);

	    model.addAttribute("curpage", page);
	    model.addAttribute("totalpage", totalpage);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    
		model.addAttribute("path", "like");
		model.addAttribute("page", "../mypage/pages/like.jsp");
		model.addAttribute("main_jsp", "../mypage/main.jsp");
		return "main/main";
	}

	// 아이템 좋아요 임시
	@GetMapping("like/itemList.do")
	public String itemLikeList(Model model, HttpSession session,@RequestParam(name = "page", defaultValue = "1") int page) {
		String id = (String) session.getAttribute("userid");
		

		int rowSize = 9;
		int start = (rowSize * page) - (rowSize - 1);
		int end = rowSize * page;
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("type", 1);
		map.put("start", start);
		map.put("end", end);

		
		List<ItemVO> likeList = lService.MyItemLikeList(map);
		int total = lService.countMyItemLikes(map);

		int totalpage = (int) Math.ceil(total / (double) rowSize);
		int block = 5;
		int startPage = ((page - 1) / block) * block + 1;
		int endPage = startPage + block - 1;
		if (endPage > totalpage)
			endPage = totalpage;
		// System.out.println(likeList+"이이템리스트 정보");
		model.addAttribute("likeList", likeList);
		model.addAttribute("path", "like");
		
		model.addAttribute("curpage", page);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("page", "../mypage/pages/like_item.jsp");
		model.addAttribute("main_jsp", "../mypage/main.jsp");
		return "main/main";
	}



}
