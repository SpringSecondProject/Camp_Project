package com.sist.dao;

import com.sist.mapper.ServiceMapper;
import com.sist.vo.ServiceVO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ServiceDAO {

  @Autowired
  private ServiceMapper mapper;

  public List<ServiceVO> serviceListData(int start, int end) {
    return mapper.serviceListData(start, end);
  }

  public int serviceTotalPage() {
    return mapper.serviceTotalPage();
  }

  public ServiceVO serviceDetailQuestion(int id) {
    return mapper.serviceDetailQuestion(id);
  }

  public ServiceVO serviceDetailAnswer(int id) {
    return mapper.serviceDetailAnswer(id);
  }

  public void serviceWriteQuestion(ServiceVO vo) {
    mapper.serviceWriteQuestion(vo);
  }

  public void serviceWriteAnswer(ServiceVO vo) {
    mapper.serviceWriteAnswer(vo);
  }

  public void serviceUpdateOk(int id) {
    mapper.serviceUpdateOk(id);
  }

}
