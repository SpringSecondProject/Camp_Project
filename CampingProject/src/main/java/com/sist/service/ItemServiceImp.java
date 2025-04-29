package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.ItemDAO;
import com.sist.vo.ItemVO;

@Service
public class ItemServiceImp implements ItemService{

	@Autowired
	private ItemDAO idao;
	@Override
	public List<ItemVO> itemListData(Map map) {
		// TODO Auto-generated method stub
		return idao.itemListData(map);
	}
	
}
