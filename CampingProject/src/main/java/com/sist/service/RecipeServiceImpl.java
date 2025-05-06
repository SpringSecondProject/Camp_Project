package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.vo.*;
import com.sist.dao.*;
@Service
public class RecipeServiceImpl implements RecipeService {
	@Autowired
	private RecipeDAO rDao;
	@Autowired
	private ChefDAO cDao;
	
	@Override
	public List<ChefVO> chefListData(Map map) {
		// TODO Auto-generated method stub
		return cDao.chefListData(map);
	}

	@Override
	public int chefTotalPage(int rowSize) {
		// TODO Auto-generated method stub
		return cDao.chefTotalPage(rowSize);
	}

	@Override
	public List<RecipeVO> chefsRecipeListData(Map map) {
		// TODO Auto-generated method stub
		return rDao.chefsRecipeListData(map);
	}

	@Override
	public int chefsRecipeTotalPage(Map map) {
		// TODO Auto-generated method stub
		return rDao.chefsRecipeTotalPage(map);
	}

}
