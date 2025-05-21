package com.sist.web;

import com.sist.service.CampCarRentService;
import com.sist.service.CampCarService;
import com.sist.vo.CampCarRentVO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class CampCarRentRestController {

  @Autowired
  private CampCarRentService service;

  @Autowired
  private CampCarService carService;

  @ResponseBody
  @PostMapping("campcar/savePaymentData.do")
  public String savePaymentData(@RequestBody Map<String, Map<String, Object>> request,
      HttpSession session) {
    try {
      Map<String, Object> payment = request.get("payment");
      session.setAttribute("payment", payment); // payment 객체 전체를 세션에 저장
      return "success";
    } catch (Exception e) {
      e.printStackTrace();
      return "error";
    }
  }

  @ResponseBody
  @GetMapping("campcar/clearSession.do")
  public String clearSession(HttpSession session) {
    try {
      Map payment = (Map) session.getAttribute("payment");
      if (payment == null) {
        return "No payment data";
      }
      CampCarRentVO vo = new CampCarRentVO();
      vo.setPid(payment.get("pid").toString());
      vo.setCid(Integer.parseInt(payment.get("cid").toString()));
      vo.setStartdate(payment.get("startDate").toString());
      vo.setEnddate(payment.get("endDate").toString());
      vo.setPrice(Integer.parseInt(payment.get("finalPrice").toString()));
      vo.setPoster(payment.get("poster").toString());
      vo.setName(payment.get("name").toString());
      vo.setCapacity(Integer.parseInt(payment.get("capacity").toString()));

      System.out.println(vo);
      service.campcarrentInsert(vo);

      session.removeAttribute("payment");

      return "success";
    } catch (Exception e) {
      e.printStackTrace();
      return "error";
    }
  }

  @GetMapping("mypage/campcarrent_vue.do")
  public Map mypage_campcarrent(int page, String id) {
    int rowSize = 20;
    List<CampCarRentVO> list =
        service.campcarrentListData((page * rowSize) - (rowSize - 1), page * rowSize, id);
    int totalpage = service.campcarrentTotalPage(id);

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
