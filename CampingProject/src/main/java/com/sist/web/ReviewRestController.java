package com.sist.web;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.vo.*;
import com.sist.service.*;
@RestController
public class ReviewRestController {
	@Autowired
	private ReviewService service;
	
	public Map commonsListData(int page,int no,int type)
	{
		Map map=new HashMap();
		//데이터베이스 연동
		int rowSize=10;
		map.put("start", (page*rowSize)-(rowSize-1));
		map.put("end", (page*rowSize));
		map.put("no", no);
		map.put("type", type);
		List<ReviewVO> list=service.reviewListData(map);
		int totalpage=service.reviewTotalPage(no, type);
		
		final int BLOCK=5;
		int startPage=(page-1)/BLOCK*BLOCK+1;
		int endPage=(page-1)/BLOCK*BLOCK+BLOCK;
		if(endPage > totalpage)
			endPage=totalpage;
		
		map=new HashMap();
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("no", no);
		map.put("type", type);
		// 값 읽기 => JSON으로 전송 Map
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
		System.out.println("댓글 쓰기 시작");
		String id=(String)session.getAttribute("userid");
		String username=(String)session.getAttribute("username");
		String sex=(String)session.getAttribute("sex");
		System.out.println("id:"+id);
		System.out.println("username:"+username);
		System.out.println("sex:"+sex);
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
		service.reviewUpdate(vo.getMsg(), vo.getNo());
		return commonsListData(1, vo.getNo(), vo.getType());
	}
	// 삭제
	@GetMapping("review/delete_vue.do")
	public Map review_delete(ReviewVO vo)
	{
		service.reviewDelete(vo.getNo());
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
