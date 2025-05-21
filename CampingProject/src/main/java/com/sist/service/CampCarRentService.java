package com.sist.service;

import com.sist.vo.CampCarRentVO;
import java.util.List;

public interface CampCarRentService {

  public List<CampCarRentVO> campcarrentListData(int start, int end, String id);

  public int campcarrentTotalPage(String id);

  public void campcarrentInsert(CampCarRentVO vo);

}
