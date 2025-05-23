package com.sist.web;

import com.sist.service.MemberService;
import com.sist.service.ServiceService;
import com.sist.vo.MemberVO;
import com.sist.vo.ServiceVO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class ServiceRestController {

  @Autowired
  private ServiceService service;

  @Autowired
  private MemberService memberService;

  @GetMapping("service/list_vue.do")
  public Map service_list(int page) {
    int rowSize = 20;
    List<ServiceVO> list =
        service.serviceListData((page * rowSize) - (rowSize - 1), page * rowSize);
    int totalpage = service.serviceTotalPage();

    final int BLOCK = 10;
    int startPage = ((page - 1) / BLOCK * BLOCK) + 1;
    int endPage = ((page - 1) / BLOCK * BLOCK) + BLOCK;

    if (endPage > totalpage) {
      endPage = totalpage;
    }

    // Vue로 전송
    Map map = new HashMap();
    map.put("list", list);
    map.put("curpage", page);
    map.put("totalpage", totalpage);
    map.put("startPage", startPage);
    map.put("endPage", endPage);

    return map;
  }

  @GetMapping("service/detail_vue.do")
  public Map service_detail(String id) {
    ServiceVO qvo = service.serviceDetailQuestion(Integer.parseInt(id));
    MemberVO mvo = memberService.memberInfoData(qvo.getPid());

    Map map = new HashMap();
    map.put("qvo", qvo);
    map.put("userid", id);
    map.put("writer", mvo.getName());

    if (qvo.getOk() == 1) {
      ServiceVO avo = service.serviceDetailAnswer(qvo.getId());
      map.put("avo", avo);
    }

    return map;
  }

  @PostMapping("service/write_vue.do")
  public void service_write(@RequestBody ServiceVO vo) {
    service.serviceWriteQuestion(vo);
  }

  @PostMapping("service/answer_vue.do")
  public void service_answer(@RequestBody ServiceVO vo) {
    service.serviceUpdateOk(vo.getTarget());
    service.serviceWriteAnswer(vo);
  }

}
