package com.sist.dao;

import com.sist.mapper.CampCarMapper;
import com.sist.vo.CampCarVO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CampCarDAO {

  @Autowired
  private CampCarMapper mapper;

  public List<CampCarVO> campcarListData(int start, int end) {
    return mapper.campcarListData(start, end);
  }

  public int campcarTotalPage() {
    return mapper.campcarTotalPage();
  }

  public CampCarVO campcarDetailData(int id) {
    return mapper.campcarDetailData(id);
  }

}
