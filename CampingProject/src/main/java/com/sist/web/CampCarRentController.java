package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CampCarRentController {

  @GetMapping("campcar/payment.do")
  public String campcar_payment(Model model) {
    model.addAttribute("path", "payment");
    model.addAttribute("main_jsp", "../campcar/payment.jsp");
    return "main/main";
  }

}