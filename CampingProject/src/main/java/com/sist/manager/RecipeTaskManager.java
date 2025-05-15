package com.sist.manager;

import org.jsoup.Jsoup;
import org.jsoup.nodes.*;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.sist.service.*;
import com.sist.vo.*;
@Component
public class RecipeTaskManager {
	@Autowired
	private RecipeService service;
	
	@Scheduled(initialDelay = 0, fixedRate = 60*60*1000)
	public void recipeSchedul()
	{
		try {
			Document doc=Jsoup.connect("https://www.10000recipe.com/index.html").get();
			Elements eUrl=doc.select("#CarrouselBox4 li.common_sp_list_li a");
			Elements ePoster=doc.select("#CarrouselBox4 li.common_sp_list_li div.common_sp_thumb img");
			Elements eTitle=doc.select("#CarrouselBox4 li.common_sp_list_li div.line2");
			for(int i=0;i<eUrl.size();i++)
			{
				String url=eUrl.get(i).attr("href");
				String poster=ePoster.get(i).attr("src");
				String title=eTitle.get(i).text();
				if(service.findRecentRecipe(title)==0)
				{
					System.out.println("["+url+"]-["+poster+"]-["+title+"]");
					RecentRecipeVO vo=new RecentRecipeVO();
					vo.setUrl(url);
					vo.setPoster(poster);
					vo.setTitle(title);
					int no=service.findRecipeDetail(title);
					if(no>0) {
						vo.setNo(no);
					}
					else
					{
						vo.setRvo(scrapRecipeDetail(url));
					}
					service.insertRecentData(vo);
				}
			}
		} catch (Exception e) {
			StackTraceElement[] stack = Thread.currentThread().getStackTrace();
			StackTraceElement current = stack[2];
			System.out.println("오류 클래스: " + current.getClassName());
			System.out.println("오류 메서드: " + current.getMethodName());
		    System.out.println("오류 라인: " + current.getLineNumber());
			System.out.println(e.getMessage());
		}
	}
	
	public RecipeVO scrapRecipeDetail(String url) {
		RecipeVO vo=new RecipeVO();
		try {
			Document doc=Jsoup.connect("https://www.10000recipe.com"+url).get();
    		Element poster=doc.selectFirst("div.centeredcrop img");// doc.select("").get(0)
    		
    		Element title=doc.selectFirst("div.view2_summary h3");
    		Element chef=doc.selectFirst("div.profile_cont p.cont_name");
    		Element chef_poster=doc.selectFirst("div.profile_pic img");
    		Element chef_comment=doc.selectFirst("div.profile_cont p.cont_intro");
    		Element content=doc.selectFirst("div.view2_summary_in");
    		Elements foodmake=doc.select("div.view_step_cont");
    		Elements foodimg=doc.select("div[id*=stepimg] img[src*=/recipe/]");
    		Element cook_portion=doc.selectFirst("span.view2_summary_info1");
    		Element cook_time=doc.selectFirst("span.view2_summary_info2");
    		Element cook_level=doc.selectFirst("span.view2_summary_info3");
    		Elements materials=doc.select("div.ready_ingre3 li");
    		/*
    		 *  <img src="https://recipe1.ezmember.co.kr/cache/recipe/2020/08/28/fdbb88682cc022c7b4a8347038d7b8b81.jpg">
    		 */
    		String food="";
    		for(int i=0;i<foodmake.size();i++)
    		{
    			food+=(i+1)+"."+foodmake.get(i).text()+"^"+foodimg.get(i).attr("src")+"\n";
    		}
    		//System.out.println(food);
    		vo.setPoster(poster.attr("src"));
    		vo.setChef(chef.text());
    		vo.setChef_poster(chef_poster.attr("src"));
    		vo.setChef_comment(chef_comment.text());
    		vo.setContent(content.text());
    		vo.setFoodmake(food);
    		vo.setTitle(title.text());
    		vo.setCook_portion(cook_portion.text());
    		vo.setCook_time(cook_time.text());
    		vo.setCook_level(cook_level.text());
    		
    		String ss="";
    		for(int i=0;i<materials.size();i++)
    		{
    			ss+=materials.get(i).text()+",";
    		}
    		ss=ss.substring(0,ss.lastIndexOf(","));
    		vo.setMaterials(ss);
//    		System.out.println("재료:"+ss.replace("구매", ""));
//    		System.out.println("제목:"+vo.getTitle());
//    		System.out.println("쉐프:"+vo.getChef());
//    		System.out.println("내용:"+vo.getContent());
//    		System.out.println("조리법:"+vo.getFoodmake());
//    		System.out.println("정보1:"+vo.getCook_portion());
//    		System.out.println("정보2:"+vo.getCook_time());
//    		System.out.println("정보3:"+vo.getCook_level());
		} catch (Exception e) {
			StackTraceElement[] stack = Thread.currentThread().getStackTrace();
			StackTraceElement current = stack[2];
			System.out.println("오류 클래스: " + current.getClassName());
			System.out.println("오류 메서드: " + current.getMethodName());
		    System.out.println("오류 라인: " + current.getLineNumber());
			System.out.println(e.getMessage());
		}
		return vo;
	}

	public static void main(String[] args) {
		RecipeTaskManager manager=new RecipeTaskManager();
		manager.recipeSchedul();
	}
}
