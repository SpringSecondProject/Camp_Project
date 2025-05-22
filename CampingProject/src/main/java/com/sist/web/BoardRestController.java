package com.sist.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sist.vo.*;
import com.sist.service.*;
@RestController
public class BoardRestController {
	@Autowired
	private BoardService service;
	
	@GetMapping("admin/list_vue.do")
	public Map board_list(int page)
	{
		int rowSize=10;
		   List<BoardVO> list=
			 service.getNoticeList((page*rowSize)-(rowSize-1), page*rowSize);
		   int totalpage=service.BOARDTotalPage();
		   
		   final int BLOCK=10;
		   int startPage=((page-1)/BLOCK*BLOCK)+1;
		   int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   // Vue로 전송 
		   Map map=new HashMap();
		   map.put("list", list);
		   map.put("curpage", page);
		   map.put("totalpage", totalpage);
		   map.put("startPage", startPage);
		   map.put("endPage", endPage);
		   
		   return map;
	}
	
	@GetMapping("board/list_vue.do")
	public Map board_list2(int page)
	{
		int rowSize=10;
		   List<BoardVO> list=
			 service.getNoticeList((page*rowSize)-(rowSize-1), page*rowSize);
		   int totalpage=service.BOARDTotalPage();
		   
		   final int BLOCK=10;
		   int startPage=((page-1)/BLOCK*BLOCK)+1;
		   int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   // Vue로 전송 
		   Map map=new HashMap();
		   map.put("list", list);
		   map.put("curpage", page);
		   map.put("totalpage", totalpage);
		   map.put("startPage", startPage);
		   map.put("endPage", endPage);
		   
		   return map;
	}
}