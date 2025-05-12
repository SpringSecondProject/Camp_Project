package com.sist.service;
import java.util.*;
import com.sist.vo.*;
public interface CampService {
	public String campGetTitle(int cno);
	public CampVO campDetailData(int cno);
	public List<SiteVO> siteListData(int cno);
	public List<Integer> reserveListData(ReserveVO vo);
}
