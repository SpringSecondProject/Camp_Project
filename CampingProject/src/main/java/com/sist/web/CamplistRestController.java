package com.sist.web;

import java.util.*;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.mapper.CamplistMapper;
import com.sist.service.CamplistService;
import com.sist.vo.*;

@RestController
public class CamplistRestController {

	@Autowired
	private CamplistService service;

	@GetMapping("camp/list_vue.do")
	public Map camp_list(int page, int rowSize, @RequestParam(required = false) String locations) {

		int start = (page - 1) * rowSize + 1;
		int end = page * rowSize;

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
	    List<CampVO> list;
	    int total;
	    
	    //지역별 필터 선택했을때랑 안했을때 구분 
	    if (locations != null && !locations.isEmpty()) {
	        List<String> locList = Arrays.asList(locations.split(","));
	        map.put("locations", locList);
	        list = service.campFilter(map);
	        total = service.campFilterTotalPage(map);
	    } else {
	        list = service.campListData(map);
	        total = service.campTotalPage();
	    }
	    	
	    // 페이지 카운트 전체 넘겨서 여기서 계산.
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
	@GetMapping("camp/location_count_vue.do")
	public List<CampVO> locationCount() {
		List<CampVO> list=service.campLocationCount();
		
	    // 우선순위 정의
	    List<String> priority = Arrays.asList("서울특별시", "경기도", "충청도", "경상도", "전라도", "강원도", "제주도");

	    // 정렬
	    list.sort(Comparator.comparingInt(o -> priority.indexOf(o.getName())));
	    return list;
	}
	
}
