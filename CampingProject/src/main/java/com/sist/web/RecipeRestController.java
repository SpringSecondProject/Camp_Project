package com.sist.web;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sist.commons.*;
import com.sist.vo.*;
import com.sist.service.*;
@RestController
public class RecipeRestController {
	@Autowired
	private RecipeService service;
	
	@GetMapping("chef/list_vue.do")
	public Map chef_list_vue(int page, String fd)
	{
		final int ROWSIZE=RecipeConfig.CHEF_SIZE;
		final int BLOCK=RecipeConfig.BLOCK_SIZE;
		
		Map map=ListUtil.setListRange(page, ROWSIZE);
		map.put("fd", fd);
		List<ChefVO> list=service.chefListData(map);
		int totalpage=service.chefTotalPage(ROWSIZE);
		
		map=new HashMap();
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("rowSize", ROWSIZE);
		ListUtil.setPageRange(map, BLOCK);
		
		return map;
	}
	
	@GetMapping("chef/chef_recipe_vue.do")
	public Map chef_recipe_vue(int page,String chef)
	{
		final int ROWSIZE=RecipeConfig.RECIPE_SIZE;
		final int BLOCK=RecipeConfig.BLOCK_SIZE;

		Map map=ListUtil.setListRange(page, ROWSIZE);
		map.put("chef", chef);
		map.put("rowSize", ROWSIZE);
		List<RecipeVO> list=service.chefsRecipeListData(map);
		int totalpage=service.chefsRecipeTotalPage(map);
		
		map=new HashMap();
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("rowSize", ROWSIZE);
		ListUtil.setPageRange(map, BLOCK);
		
		return map;
	}
}
