package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sist.vo.CampVO;


public interface CamplistService {
	public List<CampVO> campListData(Map map);
	public int campTotalPage();
}
