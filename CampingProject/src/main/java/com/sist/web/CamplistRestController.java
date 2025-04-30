package com.sist.web;

import java.util.*;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.mapper.CamplistMapper;
import com.sist.service.CamplistService;
import com.sist.vo.*;

@RestController
public class CamplistRestController {

	@Autowired
	private CamplistService service;

	@GetMapping("camp/list_vue.do")
	public Map camp_list(int page, int rowSize) {

		int start = (page - 1) * rowSize + 1;
		int end = page * rowSize;

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		
		List<CampVO> list=service.campListData(map);
		int total=service.campTotalPage();
		System.out.println(rowSize);
		int totalpage = (int) Math.ceil(total / (double) rowSize);
		
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		map=new HashMap();
		map.put("list", list);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		
		return map;
	}
}
