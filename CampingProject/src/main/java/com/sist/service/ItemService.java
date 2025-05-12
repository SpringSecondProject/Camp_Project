package com.sist.service;
import java.util.*;

<<<<<<< HEAD
=======
import org.apache.ibatis.annotations.Param;

>>>>>>> branch 'main' of https://github.com/SpringSecondProject/Camp_Project.git
import com.sist.vo.*;
public interface ItemService {
	
	public List<ItemVO> itemListData(int start,int end);
	public int itemTotalPage();
	public ItemVO itemDetailData(int ino);
	public List<ItemVO> itemListByCategory(int start,int end,String category);
	public int itemTotalPageByCategory(String category);
	public List<ItemVO> itemListByPrice(int start,int end,Integer min,Integer max);
	public int itemPriceTotalPage(Integer min,Integer max);
	public List<ItemVO> itemFindList(int start,int end,String fd,String ss);
	public int itemFindTotalPage(@Param("fd") String fd,@Param("ss") String ss);
}
