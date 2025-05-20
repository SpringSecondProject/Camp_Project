package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.sist.service.*;
@RestController
public class CommonsRestController {
	@Autowired
	private CommonsService service;
	
	public Map reviewListData(int page,int no,int type) {
		Map map=new HashMap();
		int rowSize=10;
		map.put("start", (page*rowSize)-(rowSize-1));
		map.put("end", (page*rowSize));
		map.put("no", no);
		map.put("type", type);
		List<ReviewVO> list=service.commonsReviewList(map);
		int count=service.commonsReviewCount(map);
		int totalpage=(int)(Math.ceil(count/10.0));
		
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage) endPage=totalpage;
		
		// 값 읽기 => JSON으로 전송 MAP
		map=new HashMap();
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		return map;
	}
	@GetMapping("commons/review_list.do")
	public Map review_list(int page,int no, int type) {
		return reviewListData(page, no, type);
	}
	@PostMapping("commons/review_insert.do")
	public Map review_insert(ReviewVO vo,HttpSession session) {
		String id=(String)session.getAttribute("userid");
		String nickname=(String)session.getAttribute("username");
		String sex=(String)session.getAttribute("sex");
		vo.setId(id);
		vo.setNickname(nickname);
		vo.setSex(sex);
		service.commonsReviewInsert(vo);
		return reviewListData(1, vo.getNo(), vo.getType());
	}
	@PostMapping("commons/review_update.do")
	public Map review_update(ReviewVO vo) {
		service.commonsReviewUpdate(vo);
		return reviewListData(1, vo.getNo(), vo.getType());
	}
	@GetMapping("commons/review_delete.do")
	public Map review_delete(ReviewVO vo) {
		service.commonsReviewDelete(vo);
		return reviewListData(1, vo.getNo(), vo.getType());
	}
}
