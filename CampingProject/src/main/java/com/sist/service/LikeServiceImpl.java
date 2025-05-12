package com.sist.service;

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
	
	
}
