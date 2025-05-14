package com.sist.service;

import java.util.*;

public interface LikeService {

	public void insertLike(Map map);

	public int countLike(Map map);
	 public List<Integer> likedCampList(String id, int type);
}
