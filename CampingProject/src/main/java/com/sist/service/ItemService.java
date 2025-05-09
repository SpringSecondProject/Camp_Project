package com.sist.service;
import java.util.*;

import com.sist.vo.*;
public interface ItemService {
	
	public List<ItemVO> itemListData(int start,int end);
	public int itemTotalPage();
	public ItemVO itemDetailData(int ino);
	public List<ItemVO> itemListByCategory(int start,int end,String category);
	public int itemTotalPageByCategory(String category);
}
