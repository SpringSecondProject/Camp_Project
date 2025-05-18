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
	
	@GetMapping("main/recipe_vue.do")
	public Map main_recipe_vue()
	{
		final int TOPSIZE=RecipeConfig.TOP_SIZE;
		List<RecentRecipeVO> list=service.selectRecentData(TOPSIZE);
		Map map=new HashMap();
		map.put("list", list);
		
		return map;
	}
	
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

	@GetMapping("recipe/recipe_list_vue.do")
	public Map recipe_list_vue(int page)
	{
		final int ROWSIZE=RecipeConfig.RECIPE_SIZE;
		final int BLOCK=RecipeConfig.BLOCK_SIZE;

		Map map=ListUtil.setListRange(page, ROWSIZE);
		List<RecipeVO> list=service.recipeListData(map);
		int count=service.recipeTotalCount(map);
		int totalpage=(int)Math.ceil(count/(double)ROWSIZE);
		
		map=new HashMap();
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		ListUtil.setPageRange(map, BLOCK);
		map.put("count", count);
		
		return map;
	}
	@GetMapping("recipe/recipe_detail_vue.do")
	public Map recipe_detail_vue(int no)
	{
		Map map=new HashMap();
		RecipeVO vo=service.recipeDetailData(no);
		String[] materials=vo.getMaterials().split(RecipeConfig.MATERIAL_SEPERATOR);
		String[] steps=vo.getFoodmake().split(RecipeConfig.STEP_SEPERATOR);
		String[] mlist=new String[steps.length];
		String[] ilist=new String[steps.length];
		for(int i=0;i<steps.length;i++)
		{
			StringTokenizer st=new StringTokenizer(steps[i], RecipeConfig.IMAGE_SEPERATOR);
			mlist[i]=st.nextToken();
			ilist[i]=st.nextToken();
		}
		map.put("vo", vo);
		map.put("materials", materials);
		map.put("mlist", mlist);
		map.put("ilist", ilist);
		return map;
	}
}
