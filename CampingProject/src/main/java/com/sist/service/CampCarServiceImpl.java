package com.sist.service;

import com.sist.dao.CampCarDAO;
import com.sist.vo.CampCarVO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CampCarServiceImpl implements CampCarService {

  @Autowired
  private CampCarDAO dao;

  public List<CampCarVO> campcarListData(int start, int end) {
    return dao.campcarListData(start, end);
  }

  public int campcarTotalPage() {
    return dao.campcarTotalPage();
  }

  public CampCarVO campcarDetailData(int id) {
    return dao.campcarDetailData(id);
  }

}
