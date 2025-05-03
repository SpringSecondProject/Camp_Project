package com.sist.dao;
import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;
import com.sist.commons.*;
@Repository
public class ChefDAO {
	@Autowired
	private ChefMapper mapper;
	
	public List<ChefVO> chefListData(Map map)
	{
		return mapper.chefListData(map);
	}
	
	public int chefTotalPage(int rowSize)
	{
		return mapper.chefTotalPage(rowSize);
	}
}
