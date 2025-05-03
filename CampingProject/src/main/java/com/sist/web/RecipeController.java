package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class RecipeController {
	@GetMapping("recipe/recipe_group.do")
	public String chef_list(String page,String[] gds,Model model)
	{
		if(page==null)
			page="1";
		model.addAttribute("page",Integer.parseInt(page));
		model.addAttribute("gds",gds);
		model.addAttribute("main_jsp","../recipe/recipe_group.jsp");
		return "main/main";
	}

	@GetMapping("recipe/chef_list.do")
	public String chef_list(String page,String fd,Model model)
	{
		if(page==null)
			page="1";
		if(fd==null)
			fd="fcount";
		model.addAttribute("page",Integer.parseInt(page));
		model.addAttribute("fd",fd);
		model.addAttribute("main_jsp","../recipe/chef_list.jsp");
		return "main/main";
	}
	
	@GetMapping("recipe/chefs_recipe.do")
	public String chefs_recipe(String chef,Model model)
	{
		model.addAttribute("page","1");
		model.addAttribute("chef",chef);
		model.addAttribute("main_jsp","../recipe/chefs_recipe.jsp");
		return "main/main";
	}

}
