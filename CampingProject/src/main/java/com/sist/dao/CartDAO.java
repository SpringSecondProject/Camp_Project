package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class CartDAO {
	@Autowired
	private ItemMapper mapper;
	
	public void CartInsert(CartVO vo)
	{
		mapper.CartInsert(vo);
	}
	public int CartInoCount(CartVO vo)
	{
		return mapper.CartInoCount(vo);
	}
	public void itemAccountUpdate(CartVO vo)
	{
		mapper.itemAccountUpdate(vo);
	}
	public List<CartVO> CartListData(String id)
	{
		return mapper.CartListData(id);
	}
	public void CartDelete(int ino)
	{
		mapper.CartDelete(ino);
	}
}
