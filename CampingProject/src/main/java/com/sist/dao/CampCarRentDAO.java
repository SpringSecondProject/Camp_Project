package com.sist.dao;

import com.sist.mapper.CampCarRentMapper;
import com.sist.vo.CampCarRentVO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CampCarRentDAO {

  @Autowired
  private CampCarRentMapper mapper;

  public List<CampCarRentVO> campcarrentListData(int start, int end, String id) {
    return mapper.campcarrentListData(start, end, id);
  }

  public int campcarrentTotalPage(String id) {
    return mapper.campcarrentTotalPage(id);
  }

  public void campcarrentInsert(CampCarRentVO vo) {
    mapper.campcarrentInsert(vo);
  }

}
