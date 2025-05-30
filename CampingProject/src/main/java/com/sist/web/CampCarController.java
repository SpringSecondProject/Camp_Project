package com.sist.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class CampCarController {

  @GetMapping("campcar/list.do")
  public String campcar_list(Model model) {
    model.addAttribute("path", "main");
    model.addAttribute("main_jsp", "../campcar/list.jsp");
    return "main/main";
  }

  @GetMapping("campcar/detail.do")
  public String campcar_detail(Model model) {
    model.addAttribute("path", "detail");
    model.addAttribute("main_jsp", "../campcar/detail.jsp");
    return "main/main";
  }

}
