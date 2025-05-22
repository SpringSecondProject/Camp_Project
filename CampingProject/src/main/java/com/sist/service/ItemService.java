package com.sist.service;
import java.util.*;

import org.apache.ibatis.annotations.Param;

import com.sist.vo.*;
public interface ItemService {
	
	public List<ItemVO> itemListData(int start,int end);
	public int itemTotalPage();
	public ItemVO itemDetailData(int ino);
	public List<ItemVO> itemListByCategory(int start,int end,String category);
	public int itemTotalPageByCategory(String category);
	public List<ItemVO> itemListByBrand(int start,int end,String brand);
	public int itemTotalPageByBrand(String brand);
	public List<ItemVO> itemListByPrice(int start,int end,Integer min,Integer max);
	public int itemPriceTotalPage(Integer min,Integer max);
	public List<ItemVO> itemFindList(int start,int end,String fd,String ss);
	public int itemFindTotalPage(@Param("fd") String fd,@Param("ss") String ss);
	public void CartInsert(CartVO vo);
	public List<CartVO> CartListData(String id);
	public void CartDelete(int ino);
	public ItemVO ItemCookie(int ino);
	public void HitIncrement(int ino);
	public List<ItemVO> itemList();
	public void CartReset(String id);
	public void itemAccountModify(CartVO vo);
	public int cartFindNewCno(String id);
	public void buyInsert(BuyVO vo);
	public List<BuyVO> myBuyListData(Map map);
	public int myBuycount(String id);

}
