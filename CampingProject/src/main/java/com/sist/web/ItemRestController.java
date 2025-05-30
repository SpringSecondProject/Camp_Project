package com.sist.web;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sist.vo.*;
import com.sist.service.*;
import com.sist.commons.*;
@RestController
public class ItemRestController {
	@Autowired
	private ItemService service;
	
	@GetMapping("item/list_vue.do")
	public Map item_list(int page)
	{
		int rowSize=15;
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
	    int rowSize=15;
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
	
	@GetMapping("item/list_by_brand_vue.do")
	public Map item_list_by_brand(int page, String brand)throws UnsupportedEncodingException{
		brand=URLDecoder.decode(brand, "UTF-8");
	    int rowSize=15;
	    List<ItemVO> list=service.itemListByBrand((page*rowSize)-(rowSize-1),page*rowSize,brand);
	    int totalpage=service.itemTotalPageByBrand(brand);

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

	    int rowSize=15;
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

	    int rowSize=15;
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
	@PostMapping("item/cart_insert2.do")
	public String cart_insert2(int ino,int account,HttpSession session)	{
		String result="";
		String id=(String)session.getAttribute("userid");
		CartVO vo=new CartVO();
		vo.setAccount(account);
		vo.setId(id);
		vo.setIno(ino);
		try
		{
			service.CartInsert2(vo);
			result="yes";
		} catch(Exception ex) {
			result=ex.getMessage();  
		}
		return result;
	}
    @GetMapping("item/get_cart_items.do")
    public List<CartVO> getCartItems(@RequestParam("id") String id) {
        return service.CartListData(id);
    }
	@PostMapping("item/cart_delete.do")
	public String cart_delete(int ino)
	{
		service.CartDelete(ino);
		return "delete";
	}
	@PostMapping("item/cart_reset.do")
	public String cart_reset(String id)
	{
		service.CartReset(id);
		return "reset";
	}
	@PostMapping("item/item_modify.do")
	public void itemAccountModify(CartVO vo) {
	    service.itemAccountModify(vo);
	}
	@GetMapping("item/new_cno.do")
	public int new_cno(HttpSession session) {
		String id=(String)session.getAttribute("userid");
		return service.cartFindNewCno(id);
	}
	@PostMapping("item/cart_buy.do")
	public String item_cart_buy(BuyVO vo,HttpSession session) {
		String result="";
		String id=(String)session.getAttribute("userid");
		vo.setId(id);
		try {
			service.buyInsert(vo);
			result="yes";
		} catch (Exception e) {
			result="no";
			e.printStackTrace();
		}
		return result;
	}
	@GetMapping("mypage/buy_list_vue.do")
	public Map mypage_buy_list(int page,HttpSession session) {
		String id=(String)session.getAttribute("userid");
		int rowSize=10;
		Map map=ListUtil.setListRange(page, rowSize);
		map.put("id", id);
		List<BuyVO> list=service.myBuyListData(map);
		int count=service.myBuycount(id);
		int totalpage=(int)(Math.ceil(count/(rowSize/1.0)));
		
		map=new HashMap();
		final int BLOCK=10;
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map=ListUtil.setPageRange(map, BLOCK);
		map.put("count", count);
		return map;
	}
}
