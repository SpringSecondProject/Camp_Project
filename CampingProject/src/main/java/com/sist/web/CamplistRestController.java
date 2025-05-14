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
	public Map camp_list(int page, int rowSize, @RequestParam(required = false) String locations,
		    @RequestParam(required = false) Integer minPrice, @RequestParam(required = false) Integer maxPrice,
		    @RequestParam(required =false) String pet, @RequestParam(required = false) String types,
		    @RequestParam(required = false) String lctcl, @RequestParam(required = false) String keyword) {
		
		int start = (page - 1) * rowSize + 1;
		int end = page * rowSize;

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
	    List<CampVO> list;
	    int total;
	    
	    // 금액별 필터 구분
	    if (minPrice != null) {
	        map.put("minPrice", minPrice);
	    }

	    if (maxPrice != null) {
	        map.put("maxPrice", maxPrice);
	    }
	    // 애견동반 필더 구분
	    if (pet != null && !pet.isEmpty()) {
	    	map.put("pet", pet);
	    	//System.out.println(pet+"펫");
	    }
	    // 캠핑장 유형별 필터
	    if (types != null && !types.isEmpty()) {
	        List<String> typeList = Arrays.asList(types.split(","));
	        map.put("types", typeList);
	    }
	    // 환경 유형별 필터
	    if (lctcl != null && !lctcl.isEmpty()) {
	        List<String> lctclList = Arrays.asList(lctcl.split(","));
	        map.put("lctcl", lctclList);
	    }
	    // 지역별 필터
	    if(locations != null && !locations.isEmpty()) {
	        List<String> locList = Arrays.asList(locations.split(","));
	        map.put("locations", locList);
	    }
	    // 검색어 필터
	    if (keyword != null && !keyword.isEmpty()) {
	        map.put("keyword", keyword);
	    }
	    
	    boolean hasFilter = (locations != null && !locations.isEmpty())|| // 지역별 필터 있거나 
	    					(minPrice != null || maxPrice != null) ||   // 가격별 필터 하나라도 있으면	
	    					(pet != null && !pet.isEmpty()) || // 펫 필터
	    					(lctcl != null && !lctcl.isEmpty()) || // 환경 유형 필터
	    					(types != null && !types.isEmpty()) || // 캠핑장 종류 필터
	    					(keyword != null && !keyword.isEmpty()); // 캠핑장 검색 필터
	    
	    //필터 선택했을때랑 안했을때 구분 
	    if (hasFilter) { 
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

	    // 정렬 // 데이터가 이름이랑 갯수 들어가 있으니까. 
	    list.sort(Comparator.comparingInt(o -> priority.indexOf(o.getName())));
	    return list;
	}
	
	@GetMapping("camp/type_count_vue.do")
	public List<Map> campTypeCount() {
	    List<String> rawList = service.campIndutyList(); 
	    // [카라반,글램핑, 일반야영장, 일반야영장,자동차야영장, 일반야영장,
	    //System.out.println(rawList); 
	    Map countMap = new HashMap();
	    
	
	    String[] types = { "일반야영장", "자동차야영장", "카라반", "글램핑", "캠프닉" };
	    int[] counts = new int[types.length];
	    
	    for(String a:rawList) {
	    	if(a!=null) {
	    		String a1[]=a.split(","); // , 제외하고 배열로
	    		for(String a2:a1) {
	    			for(int i=0; i<types.length; i++) { // 같은타입이면 새로운 배열에 count++
	    				if(a2.equals(types[i])) {
	    					counts[i]++;
	    					break;
	    				}
	    			}
	    		}
	    	}
	    }
	    
	    List<Map> result=new ArrayList();
	    for(int i=0; i<types.length; i++) {
	    	Map map=new HashMap();
	    	map.put("induty", types[i]);
	    	map.put("cnt", counts[i]);
	    	result.add(map);
	    	
	    }
	    return result;
	}
	
	@GetMapping("camp/lctcl_count_vue.do")
	public List<Map> campLctclCount() {
	    List<String> list = service.campLctclList(); 
	    Map countMap = new HashMap();
	    
	
	    String[] types = { "산", "강", "호수", "계곡", "숲", "해변", "도심", "섬" };
	    int[] counts = new int[types.length];
	    
	    for(String a:list) {
	    	if(a!=null) {
	    		String a1[]=a.split(","); // , 제외하고 배열로
	    		for(String a2:a1) {
	    			for(int i=0; i<types.length; i++) { // 같은타입이면 새로운 배열에 count++
	    				if(a2.equals(types[i])) {
	    					counts[i]++;
	    					break;
	    				}
	    			}
	    		}
	    	}
	    }
	    List<Map> result=new ArrayList();
	    for(int i=0; i<types.length; i++) {
	    	Map map=new HashMap();
	    	map.put("lctcl", types[i]);
	    	map.put("cnt", counts[i]);
	    	result.add(map);
	    	
	    }
	    //System.out.println(result);
	    return result;
	}
	
}
