package com.sist.web;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.vo.*;
import com.sist.commons.ListUtil;
import com.sist.commons.RecipeConfig;
import com.sist.service.*;
@RestController
public class ReviewRestController {
	@Autowired
	private ReviewService service;
	
	public Map commonsListData(int page,int no,int type)
	{
		final int ROWSIZE=RecipeConfig.RECIPE_SIZE;
		final int BLOCK=RecipeConfig.REVIEW_BLOCK;

		Map map=ListUtil.setListRange(page, ROWSIZE);
		map.put("no", no);
		map.put("type", type);
		map.put("rowSize", ROWSIZE);
		
		List<ReviewVO> list=service.reviewListData(map);
		int totalpage=service.reviewTotalPage(map);
		
		map=new HashMap();
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map=ListUtil.setPageRange(map, BLOCK);
		map.put("no", no);
		map.put("type", type);

		return map;
	}
	
	// 목록
	@GetMapping("review/list_vue.do")
	public Map review_list(int page,int no,int type)
	{
		return commonsListData(page, no, type);
	}
	// 추가
	@PostMapping("review/insert_vue.do")
	public Map review_insert(ReviewVO vo,HttpSession session)
	{
		String id=(String)session.getAttribute("userid");
		String username=(String)session.getAttribute("username");
		String sex=(String)session.getAttribute("sex");
		vo.setId(id);
		vo.setNickname(username);
		vo.setSex(sex);
		service.reviewInsert(vo);
		
		return commonsListData(1, vo.getNo(), vo.getType());
	}
	// 수정
	@PostMapping("review/update_vue.do")
	public Map review_update(ReviewVO vo)
	{
		service.reviewUpdate(vo.getMsg(), vo.getRno());
		return commonsListData(1, vo.getNo(), vo.getType());
	}
	// 삭제
	@GetMapping("review/delete_vue.do")
	public Map review_delete(ReviewVO vo)
	{
		service.reviewDelete(vo.getRno());
		return commonsListData(1, vo.getNo(), vo.getType());
	}
	// 대댓글
	@PostMapping("review/reply_insert_vue.do")
	public Map review_reply_insert(int pno,ReviewVO vo,HttpSession session)
	{
		String id=(String)session.getAttribute("userid");
		String username=(String)session.getAttribute("username");
		String sex=(String)session.getAttribute("sex");
		vo.setId(id);
		vo.setNickname(username);
		vo.setSex(sex);
		service.reviewReplyReplyInsert(pno, vo);
		return commonsListData(1, vo.getNo(), vo.getType());
	}
	
}
