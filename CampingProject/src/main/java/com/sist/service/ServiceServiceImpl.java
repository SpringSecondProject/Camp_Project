package com.sist.service;

import com.sist.dao.ServiceDAO;
import com.sist.vo.ServiceVO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceServiceImpl implements ServiceService {

  @Autowired
  private ServiceDAO dao;

  @Override
  public List<ServiceVO> serviceListData(int start, int end) {
    return dao.serviceListData(start, end);
  }

  @Override
  public int serviceTotalPage() {
    return dao.serviceTotalPage();
  }

  @Override
  public ServiceVO serviceDetailQuestion(int id) {
    return dao.serviceDetailQuestion(id);
  }

  @Override
  public ServiceVO serviceDetailAnswer(String id) {
    return dao.serviceDetailAnswer(id);
  }

  @Override
  public void serviceWriteQuestion(ServiceVO vo) {
    dao.serviceWriteQuestion(vo);
  }

  @Override
  public void serviceWriteAnswer(ServiceVO vo) {
    dao.serviceWriteAnswer(vo);
  }

  @Override
  public void serviceUpdateOk(int id) {
    dao.serviceUpdateOk(id);
  }

}