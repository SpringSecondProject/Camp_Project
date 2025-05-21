package com.sist.service;


import com.sist.dao.CampCarRentDAO;
import com.sist.vo.CampCarRentVO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CampCarRentServiceImpl implements CampCarRentService {

  @Autowired
  private CampCarRentDAO dao;


  @Override
  public List<CampCarRentVO> campcarrentListData(int start, int end, String id) {
    return dao.campcarrentListData(start, end, id);
  }

  @Override
  public int campcarrentTotalPage(String id) {
    return dao.campcarrentTotalPage(id);
  }

  @Override
  public void campcarrentInsert(CampCarRentVO vo) {
    dao.campcarrentInsert(vo);
  }

}
