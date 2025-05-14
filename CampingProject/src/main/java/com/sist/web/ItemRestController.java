package com.sist.web;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		int rowSize=20;
		   List<ItemVO> list=
			 service.itemListData((page*rowSize)-(rowSize-1), page*rowSize);
		   int totalpage=service.itemTotalPage();
		   
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
	@GetMapping("item/detail_vue.do")
	public ItemVO item_detail(int ino)
	{
	   ItemVO vo=service.itemDetailData(ino);
	   return vo;
	}
	@GetMapping("item/list_by_category_vue.do")
	public Map item_list_by_category(int page, String category)throws UnsupportedEncodingException{
		category=URLDecoder.decode(category, "UTF-8");
	    int rowSize=20;
	    List<ItemVO> list=service.itemListByCategory((page*rowSize)-(rowSize-1),page*rowSize,category);
	    int totalpage=service.itemTotalPageByCategory(category);

	    final int BLOCK=10;
	    int startPage=((page-1)/BLOCK*BLOCK)+1;
	    int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;

	    if(endPage>totalpage)
	        endPage=totalpage;

	    Map<String, Object> map=new HashMap<>();
	    map.put("list", list);
	    map.put("curpage", page);
	    map.put("totalpage", totalpage);
	    map.put("startPage", startPage);
	    map.put("endPage", endPage);

	    return map;
	}
	
	@GetMapping("item/list_by_price_vue.do")
	public Map<String, Object> item_list_by_price(
	        @RequestParam(defaultValue = "1") int page,
	        @RequestParam(required = false) Integer min,
	        @RequestParam(required = false) Integer max) {

	    int rowSize=20;
	    int start=(page*rowSize)-(rowSize - 1);
	    int end=page*rowSize;

	    List<ItemVO> list=service.itemListByPrice(start, end, min, max);
	    int totalpage=service.itemPriceTotalPage(min, max);

	    final int BLOCK=10;
	    int startPage=((page-1)/BLOCK)*BLOCK+1;
	    int endPage=startPage+BLOCK-1;
	    if (endPage>totalpage)
	        endPage=totalpage;

	    Map<String, Object> map=new HashMap<>();
	    map.put("list", list);
	    map.put("curpage", page);
	    map.put("totalpage", totalpage);
	    map.put("startPage", startPage);
	    map.put("endPage", endPage);

	    return map;
	}

	@GetMapping("item/find_vue.do")
	public Map item_find(int page, String fd, String ss) throws UnsupportedEncodingException {
	    ss=URLDecoder.decode(ss, "UTF-8");

	    List<String> allowFields = Arrays.asList("name","brand","type");
	    if (!allowFields.contains(fd)) {
	        fd="name"; // 기본 필드 설정
	    }

	    int rowSize=20;
	    int start=(page*rowSize)-(rowSize-1);
	    int end=page*rowSize;

	    List<ItemVO> list=service.itemFindList(start, end, fd, ss);
	    int totalpage=service.itemFindTotalPage(fd, ss);

	    final int BLOCK=10;
	    int startPage=((page-1)/BLOCK*BLOCK)+1;
	    int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	    if (endPage>totalpage)
	        endPage=totalpage;

	    Map<String,Object> map=new HashMap<>();
	    map.put("list", list);
	    map.put("curpage", page);
	    map.put("totalpage", totalpage);
	    map.put("startPage", startPage);
	    map.put("endPage", endPage);

	    return map;
	}
	@PostMapping("item/cart_insert.do")
	public String cart_insert(int ino,int account,
			HttpSession session)
	{
		String result="";
		String id=(String)session.getAttribute("userid");
		CartVO vo=new CartVO();
		vo.setAccount(account);
		vo.setId(id);
		vo.setIno(ino);
		try
		{
			service.CartInsert(vo);
		  	result="yes";
		} catch(Exception ex) {
			result=ex.getMessage();  
	  	}
		return result;
	}
}
