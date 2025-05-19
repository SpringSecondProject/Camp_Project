package com.sist.service;

import com.sist.vo.CampCarVO;
import java.util.List;

public interface CampCarService {

  public List<CampCarVO> campcarListData(int start, int end);

  public int campcarTotalPage();

  public CampCarVO campcarDetailData(int id);

}
