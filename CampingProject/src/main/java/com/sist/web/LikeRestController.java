package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import com.sist.service.LikeService;

@RestController
public class LikeRestController {

	@Autowired
	private LikeService service;

	@RequestMapping("like/insert_vue.do")
	public Map insertLike(@RequestBody Map map, HttpSession session ,HttpServletResponse response) {
		Map result = new HashMap();

		// 로그인 여부 확인
		String id = (String) session.getAttribute("userid");
		
		if (id == null) {
		    result.put("msg", "NOLOGIN");
		    return result; 
		}
 
		// 세션에서 ID 주입
		map.put("id", id);

		// 중복 체크 후 insert
		int count = service.countLike(map);
		if (count == 0) {
			service.insertLike(map);
			result.put("msg", "좋아요 완료");
		} else {
			result.put("msg", "이미 좋아요 했습니다");
		}
 
		return result;
	}
	
	
	@GetMapping("like/list_vue.do")
	public List<Integer> campLikeList(@RequestParam("type") int type, HttpSession session) {
		
	    String id = (String) session.getAttribute("userid");
	    if (id == null) return Collections.emptyList();
	     
	    return service.likedCampList(id, type); //캠핑장 타입임.  0 : 캠핑장 1: 쇼핑몰 2 : 레시피 3 : 캠핑카 4 : 커뮤니티
	}
}
