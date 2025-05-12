package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ServiceController {

  @GetMapping("service/list.do")
  public String service_list(Model model) {
    model.addAttribute("main_jsp", "../service/list.jsp");

    return "main/main";
  }

  @GetMapping("service/write.do")
  public String service_write(Model model) {
    model.addAttribute("main_jsp", "../service/write.jsp");

    return "main/main";
  }

  @GetMapping("service/detail.do")
  public String service_detail(Model model) {
    System.out.println(model);

    model.addAttribute("main_jsp", "../service/detail.jsp?id=");
    return "main/main";
  }
}
