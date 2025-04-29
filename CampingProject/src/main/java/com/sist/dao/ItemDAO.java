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
	
	public List<ItemVO> itemListData(Map map)
	{
		return mapper.itemListData(map);
	}
}
