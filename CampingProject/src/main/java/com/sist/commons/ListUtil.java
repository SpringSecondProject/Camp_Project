package com.sist.commons;
import java.util.*;
import org.springframework.stereotype.Component;

public class ListUtil {

	public static Map setListRange(int page,int rowSize)
	{
		Map map=new HashMap();
		int start=(page*rowSize)-(rowSize-1);
		int end=(page*rowSize);

		map.put("start", start);
		map.put("end", end);
		return map;		
	}
	
	public static Map setPageRange(Map map,int block)
	{
		int page=(int)map.get("curpage");
		int totalpage=(int)map.get("totalpage");
		
		int startPage=(page-1)/block*block+1;
		int endPage=(page-1)/block*block+block;
		if (endPage>totalpage)
			endPage=totalpage;
		map.put("startPage", startPage);
		map.put("endPage", endPage);

		return map;		
	}
}
