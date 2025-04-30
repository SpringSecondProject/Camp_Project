package com.sist.web;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.vo.*;
import com.sist.service.*;
@RestController
public class ItemRestController {
	@Autowired
	private ItemService service;
	
	@GetMapping("item/list_vue.do")
	public Map item_list(int page)
	{
		int rowSize=12;
		   List<ItemVO> list=
			 service.itemListData((page*rowSize)-(rowSize-1), page*rowSize);
		   int totalpage=service.itemTotalPage();
		   
		   final int BLOCK=10;
		   int startPage=((page-1)/BLOCK*BLOCK)+1;
		   int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   // Vue·Î Àü¼Û 
		   Map map=new HashMap();
		   map.put("list", list);
		   map.put("curpage", page);
		   map.put("totalpage", totalpage);
		   map.put("startPage", startPage);
		   map.put("endPage", endPage);
		   
		   return map;
	}
	@GetMapping("item/detail_vue.do")
	public ItemVO item_detail(int ino)
	{
	   ItemVO vo=service.itemDetailData(ino);
	   return vo;
	}
}
