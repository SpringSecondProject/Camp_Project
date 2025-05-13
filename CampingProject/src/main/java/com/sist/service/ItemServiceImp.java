package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.*;
import com.sist.vo.*;

@Service
public class ItemServiceImp implements ItemService{

	@Autowired
	private ItemDAO idao;

	@Autowired
	private CartDAO cdao;

	@Override
	public List<ItemVO> itemListData(int start,int end) {
		// TODO Auto-generated method stub
		return idao.itemListData(start, end);
	}
	@Override
	public int itemTotalPage() {
		// TODO Auto-generated method stub
		return idao.itemTotalPage();
	}
	@Override
	public ItemVO itemDetailData(int ino) {
		// TODO Auto-generated method stub
		return idao.itemDetailData(ino);
	}
	@Override
	public List<ItemVO> itemListByCategory(int start, int end, String category) {
		// TODO Auto-generated method stub
		return idao.itemListByCategory(start, end, category);
	}
	@Override
	public int itemTotalPageByCategory(String category) {
		// TODO Auto-generated method stub
		return idao.itemTotalPageByCategory(category);
	}
	@Override
	public List<ItemVO> itemListByPrice(int start, int end, Integer min, Integer max) {
		// TODO Auto-generated method stub
		return idao.itemListByPrice(start, end, min, max);
	}
	@Override
	public int itemPriceTotalPage(Integer min, Integer max) {
		// TODO Auto-generated method stub
		return idao.itemPriceTotalPage(min, max);
	}
	@Override
	public List<ItemVO> itemFindList(int start, int end, String fd, String ss) {
		// TODO Auto-generated method stub
		return idao.itemFindList(start, end, fd, ss);
	}
	@Override
	public int itemFindTotalPage(String fd, String ss) {
		// TODO Auto-generated method stub
		return idao.itemFindTotalPage(fd, ss);
	}
	@Override
	public void CartInsert(CartVO vo) {
		// TODO Auto-generated method stub		
		int count=cdao.CartInoCount(vo);
		if(count==0)
		{
			cdao.CartInsert(vo);
		}
		else
		{
			cdao.itemAccountUpdate(vo);
		}
	}
	@Override
	public List<CartVO> CartListData(String id) {
		// TODO Auto-generated method stub
		return cdao.CartListData(id);
	}
	@Override
	public void CartDelete(int ino) {
		// TODO Auto-generated method stub
		cdao.CartDelete(ino);
	}	
}
