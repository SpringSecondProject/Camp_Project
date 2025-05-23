package com.sist.service;

import com.sist.vo.ServiceVO;
import java.util.List;


public interface ServiceService {

  public List<ServiceVO> serviceListData(int start, int end);

  public int serviceTotalPage();

  public ServiceVO serviceDetailQuestion(int id);

  public ServiceVO serviceDetailAnswer(int id);

  public void serviceWriteQuestion(ServiceVO vo);

  public void serviceWriteAnswer(ServiceVO vo);

  public void serviceUpdateOk(int id);

  public List<ServiceVO> serviceSearchData(int start, int end, String query);

  public int serviceSearchTotalPage(String query);

}
