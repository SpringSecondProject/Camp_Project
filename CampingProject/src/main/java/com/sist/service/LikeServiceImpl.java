package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sist.dao.*;
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
	
	
}
