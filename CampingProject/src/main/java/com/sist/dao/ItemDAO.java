package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class ItemDAO {
	@Autowired
	private ItemMapper mapper;
	
	public List<ItemVO> itemListData(int start,int end)
	{
		return mapper.itemListData(start, end);
	}
	
	public int itemTotalPage()
	{
		return mapper.itemTotalPage();
	}
	
	public ItemVO itemDetailData(int ino)
	{
		return mapper.itemDetailData(ino);
	}
}
