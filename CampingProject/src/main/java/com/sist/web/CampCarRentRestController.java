package com.sist.web;

import com.sist.service.CampCarRentService;
import com.sist.vo.CampCarRentVO;
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

      System.out.println(vo);
      service.campcarrentInsert(vo);

      session.removeAttribute("payment");

      return "success";
    } catch (Exception e) {
      e.printStackTrace();
      return "error";
    }
  }

}
