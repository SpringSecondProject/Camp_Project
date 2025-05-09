package com.sist.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.LikeMapper;

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
}
