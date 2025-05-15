package com.sist.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sist.dao.*;
import com.sist.vo.*;
@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	private LikeDAO Ldao;
	
	@Override
	public void insertLike(Map map) {
		// TODO Auto-generated method stub
		Ldao.insertLike(map);
	}

	@Override
	public int countLike(Map map) {
		// TODO Auto-generated method stub
		return Ldao.countLike(map);
	}

	@Override
	public List<Integer> likedCampList(String id, int type) {
		// TODO Auto-generated method stub
		return Ldao.likedCampList(id, type);
	}
	
	// 마이페이지에 좋아요한 캠핑장 리스트 
	@Override
	public List<CampVO> MyCampLikeList(Map map) {
		// TODO Auto-generated method stub
		return Ldao.MyCampLikeList(map);
	}

	@Override
	public List<ItemVO> MyItemLikeList(Map map) {
		// TODO Auto-generated method stub
		return Ldao.MyItemLikeList(map);
	}

	@Override
	public List<RecipeVO> MyRecipeLikeList(Map map) {
		// TODO Auto-generated method stub
		return Ldao.MyRecipeLikeList(map);
	}
	
	
}
