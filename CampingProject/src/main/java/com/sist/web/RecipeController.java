package com.sist.web;

import java.util.*;
import javax.servlet.http.*;

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
	
	public List<RecipeVO> recipeCookieData(Cookie[] cookies)
	{
		List<RecipeVO> clist= new ArrayList<RecipeVO>();
		Arrays.sort(cookies, Comparator.comparing(Cookie::getName));
		for(Cookie c:cookies)
		{
			if(c.getName().startsWith("recipe_"))
			{
				RecipeVO vo=service.recipeDetailData(Integer.parseInt(c.getValue()));
				clist.add(vo);
			}
		}
		return clist;
		
	}
	
	@GetMapping("recipe/recipe_group.do")
	public String chef_list(String page,String[] gds,Model model,HttpServletRequest request)
	{
		if(page==null)
			page=RecipeConfig.PAGE_DEFAULT;
		model.addAttribute("page",Integer.parseInt(page));
		model.addAttribute("gds",gds);

		Cookie[] cookies=request.getCookies();
		List<RecipeVO> recentList=new ArrayList<RecipeVO>();
		if(cookies!=null)
		{
			recentList=recipeCookieData(cookies);
		}	
		model.addAttribute("recentList",recentList);
		//System.out.println("recentList:"+recentList);
		
		model.addAttribute("recipe_jsp","../recipe/recipe_group.jsp");
		model.addAttribute("main_jsp","../recipe/recipe_main.jsp");
		return "main/main";
	}

	@GetMapping("recipe/recipe_detail.do")
	public String recipe_detail(String no,Model model,HttpSession session,
								HttpServletRequest request,HttpServletResponse response)
	{
		if(no==null)
		{
			no=RecipeConfig.RECIPE_DEFAULT; 
		}
		else
		{
			final int COOKIESIZE=RecipeConfig.COOKIE_SIZE;
			Cookie newCookie=new Cookie("recipe_1",no);
			newCookie.setPath("/");
			newCookie.setMaxAge(60*60*30); // 유효기간 1달
			response.addCookie(newCookie);
			
			Cookie[] cookies=request.getCookies();
			if(cookies!=null)
			{
				boolean existSame=false;
				Arrays.sort(cookies, Comparator.comparing(Cookie::getName));
				for(Cookie c:cookies)
				{
					String name=c.getName();
					if(name.startsWith("recipe_"))
					{
						int idx=Integer.parseInt(name.substring(name.length()-1));
						if(c.getValue().equals(no))
						{
							existSame=true;
						}
						else if(existSame)
						{
							Cookie oldCookie=new Cookie("recipe_"+idx,c.getValue());
							oldCookie.setPath("/");
							oldCookie.setMaxAge(60*60*30); // 유효기간 1달
							response.addCookie(oldCookie);
						}
						else if(idx<RecipeConfig.COOKIE_SIZE)
						{
							Cookie oldCookie=new Cookie("recipe_"+(idx+1),c.getValue());
							oldCookie.setPath("/");
							oldCookie.setMaxAge(60*60*30); // 유효기간 1달
							response.addCookie(oldCookie);
						}
						c.setMaxAge(0);
						response.addCookie(c);

					}
				}
			}
		}
		
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
	public String chefs_recipe(String chef,Model model,HttpServletRequest request)
	{
		model.addAttribute("page",RecipeConfig.PAGE_DEFAULT);
		model.addAttribute("chef",chef);
		Cookie[] cookies=request.getCookies();
		List<RecipeVO> recentList=new ArrayList<RecipeVO>();
		if(cookies!=null)
		{
			recentList=recipeCookieData(cookies);
		}	
		model.addAttribute("recentList",recentList);
		
		model.addAttribute("recipe_jsp","../recipe/chefs_recipe.jsp");
		model.addAttribute("main_jsp","../recipe/recipe_main.jsp");
		return "main/main";
	}
}
