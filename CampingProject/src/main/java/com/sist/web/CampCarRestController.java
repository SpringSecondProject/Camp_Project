package com.sist.web;

import com.sist.service.CampCarService;
import com.sist.vo.CampCarVO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class CampCarRestController {

  @Autowired
  private CampCarService service;

  @GetMapping("campcar/list_vue.do")
  public Map campcar_list_vue(int page) {
    int rowSize = 20;
    List<CampCarVO> list =
        service.campcarListData((page * rowSize) - (rowSize - 1), page * rowSize);
    int totalpage = service.campcarTotalPage();

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

}
