package com.sist.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.LikeMapper;
import com.sist.vo.*;

@Repository
public class LikeDAO {
	@Autowired
	private LikeMapper mapper;
	
    public void insertLike(Map map) {
    	mapper.insertLike(map);
    }
    public int countLike(Map map) {
    	return mapper.countLike(map);
    }
    //최초 좋아요한거
    public List<Integer> likedCampList(String id, int type){
    	return mapper.likedCampList(id, type);
    }
    
    //좋아요 삭제
    public void deleteLike(Map map) {
    	mapper.deleteLike(map);
    }
    
    //마이페이지 캠핑
    public List<CampVO> MyCampLikeList(Map map){
    	return mapper.MyCampLikeList(map);
    }
    public int countMyCampLikes(Map map) {
    	return mapper.countMyCampLikes(map);
    }
    
    //아이템 임시
	public List<ItemVO> MyItemLikeList(Map map){
		return mapper.MyItemLikeList(map);
	} 
	public int countMyItemLikes(Map map) {
		return mapper.countMyItemLikes(map);
	}
	//레시피 임시
	public List<RecipeVO> MyRecipeLikeList(Map map){
		return mapper.MyRecipeLikeList(map);
	}
    
}
