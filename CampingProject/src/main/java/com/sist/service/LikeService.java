package com.sist.service;

import java.util.*;


import com.sist.vo.*;

public interface LikeService {

	public void insertLike(Map map);

	public int countLike(Map map);
	
	public List<Integer> likedCampList(String id, int type);
	
	//좋아요 삭제
	public void deleteLike(Map map);
	
	//마이페이지
	public List<CampVO> MyCampLikeList(Map map);
    //아이템 임시
	public List<ItemVO> MyItemLikeList(Map map);
	 
	//레시피 임시
	public List<RecipeVO> MyRecipeLikeList(Map map);
	

	
	
}
