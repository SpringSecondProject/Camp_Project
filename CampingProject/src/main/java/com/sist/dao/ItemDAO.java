package com.sist.dao;
import java.util.*;

import org.apache.ibatis.annotations.Param;
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
	
	public List<ItemVO> itemListByCategory(int start,int end,String category)
	{
		return mapper.itemListByCategory(start, end, category);
	}

	public int itemTotalPageByCategory(String category)
	{
		return mapper.itemTotalPageByCategory(category);
	}
	
	public List<ItemVO> itemListByBrand(int start,int end,String brand)
	{
		return mapper.itemListByBrand(start, end, brand);
	}
	
	public int itemTotalPageByBrand(String brand)
	{
		return mapper.itemTotalPageByBrand(brand);
	}
	
	public List<ItemVO> itemListByPrice(int start,int end,Integer min,Integer max)
	{
		return mapper.itemListByPrice(start, end, min, max);
	}
	
	public int itemPriceTotalPage(Integer min,Integer max)
	{
		return mapper.itemPriceTotalPage(min, max);
	}
	
	public List<ItemVO> itemFindList(int start,int end,String fd,String ss)
	{
		return mapper.itemFindList(start, end, fd, ss);
	}
	
	public int itemFindTotalPage(@Param("fd") String fd,@Param("ss") String ss)
	{
		return mapper.itemFindTotalPage(fd, ss);
	}
	
	public ItemVO ItemCookie(int ino)
	{
		return mapper.ItemCookie(ino);
	}
	
	public void HitIncrement(int ino)
	{
		mapper.HitIncrement(ino);
	}
	
	public List<ItemVO> itemList()
	{
		return mapper.itemList();
	}
	public int cartFindNewCno(String id) {
		return mapper.cartFindNewCno(id);
	}
	public void buyInsert(BuyVO vo) {
		mapper.buyInsert(vo);
	}
	public int buyFindNewBno(String id) {
		return mapper.buyFindNewBno(id);
	}
	public void cartUpdateByBuy(CartVO vo) {
		mapper.cartUpdateByBuy(vo);
	}
	public List<BuyVO> myBuyListData(Map map){
		return mapper.myBuyListData(map);
	}
	public int myBuycount(String id) {
		return mapper.myBuycount(id);
	}

}
