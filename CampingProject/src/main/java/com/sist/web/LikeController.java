package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.sist.service.*;

@Controller
public class LikeController {
	@Autowired
	private LikeService lService;
	
	
	@GetMapping("like/likeList.do")
	public String likeList(Model model, HttpSession session) {
		String id=(String)session.getAttribute("userid");
		
		Map map=new HashMap();
		map.put("id", id);
		map.put("type", 0);
		
		List<CampVO> likeList=lService.MyCampLikeList(map);
		//System.out.println(likeList+"캠프리스트 정보");
		//System.out.println(likeList);
		model.addAttribute("likeList", likeList);
	    model.addAttribute("path", "like");
	    model.addAttribute("page", "../mypage/pages/like.jsp");
	    model.addAttribute("main_jsp", "../mypage/main.jsp");
		return "main/main";
	}
	
	//아이템 좋아요 임시
	@GetMapping("like/itemList.do")
	public String itemLikeList(Model model, HttpSession session) {
	    String id = (String) session.getAttribute("userid");
	    Map map = Map.of("id", id, "type", 1);
	    List<ItemVO> likeList = lService.MyItemLikeList(map);
	    //System.out.println(likeList+"이이템리스트 정보");
	    model.addAttribute("likeList", likeList);
	    model.addAttribute("path", "like");
	    model.addAttribute("page", "../mypage/pages/like_item.jsp");
	    model.addAttribute("main_jsp", "../mypage/main.jsp");
	    return "main/main";
	}

	//레시피 좋아요 임시
	@GetMapping("like/recipeList.do")
	public String recipeLikeList(Model model, HttpSession session) {
	    String id = (String) session.getAttribute("userid");
	    Map map = Map.of("id", id, "type", 2);
	    List<RecipeVO> likeList = lService.MyRecipeLikeList(map);
	    //System.out.println(likeList+"레시피리스트 정보");
	    model.addAttribute("likeList", likeList);
	    model.addAttribute("path", "like");
	    model.addAttribute("page", "../mypage/pages/like_recipe.jsp");
	    model.addAttribute("main_jsp", "../mypage/main.jsp");
	    return "main/main";
	}
	
}
