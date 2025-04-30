package com.sist.service;
import java.util.*;
import com.sist.vo.*;
public interface ItemService {
	
	public List<ItemVO> itemListData(int start,int end);
	public int itemTotalPage();
	public ItemVO itemDetailData(int ino);
}
