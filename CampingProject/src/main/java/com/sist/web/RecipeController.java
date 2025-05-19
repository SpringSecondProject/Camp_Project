package com.sist.web;

import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.commons.*;
import com.sist.service.*;
import com.sist.vo.*;
@Controller
public class RecipeController {
	@Autowired
	private RecipeService service;
	
	@GetMapping("recipe/recipe_group.do")
	public String chef_list(String page,String[] gds,Model model)
	{
		if(page==null)
			page=RecipeConfig.PAGE_DEFAULT;
		model.addAttribute("page",Integer.parseInt(page));
		model.addAttribute("gds",gds);
		model.addAttribute("main_jsp","../recipe/recipe_group.jsp");
		return "main/main";
	}

	@GetMapping("recipe/recipe_detail.do")
	public String recipe_detail(String no,Model model,HttpSession session)
	{
		/*
		 * if(no==null) no="57"; String id=(String)session.getAttribute("userid");
		 * 
		 * model.addAttribute("no",no); model.addAttribute("sessionId", id);
		 * model.addAttribute("main_jsp","../recipe/recipe_detail.jsp"); return
		 * "main/main";
		 * 
		 */
		
		if(no==null) 
			no=RecipeConfig.RECIPE_DEFAULT; 
		String id=(String)session.getAttribute("userid");
		model.addAttribute("sessionId", id);
		model.addAttribute("type", RecipeConfig.REVIEW_TYPE);
		
		Map map=new HashMap();
		RecipeVO vo=service.recipeDetailData(Integer.parseInt(no));
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
		model.addAttribute("vo", vo);
		model.addAttribute("materials", materials);
		model.addAttribute("mlist", mlist);
		model.addAttribute("ilist", ilist);

		model.addAttribute("main_jsp","../recipe/recipe_detail.jsp"); 
		return "main/main";
	}

	@GetMapping("recipe/chef_list.do")
	public String chef_list(String page,String fd,Model model)
	{
		if(page==null)
			page=RecipeConfig.PAGE_DEFAULT;
		if(fd==null)
			fd=RecipeConfig.CHEF_FD_DEFAULT;
		model.addAttribute("page",Integer.parseInt(page));
		model.addAttribute("fd",fd);
		model.addAttribute("main_jsp","../recipe/chef_list.jsp");
		return "main/main";
	}
	
	@GetMapping("recipe/chefs_recipe.do")
	public String chefs_recipe(String chef,Model model)
	{
		model.addAttribute("page",RecipeConfig.PAGE_DEFAULT);
		model.addAttribute("chef",chef);
		model.addAttribute("main_jsp","../recipe/chefs_recipe.jsp");
		return "main/main";
	}
}
