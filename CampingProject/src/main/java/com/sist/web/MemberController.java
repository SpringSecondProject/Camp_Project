package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

  @GetMapping("member/signup.do")
  public String member_signup(Model model) {
    model.addAttribute("main_jsp", "../member/signup.jsp");
    return "main/main";
  }

  @RequestMapping("member/login.do")
  public String member_login(Model model) {
    model.addAttribute("main_jsp", "../member/login.jsp");
    return "main/main";
  }

  @GetMapping("mypage/main.do")
  public String mypage_main(Model model) {
    model.addAttribute("path", "account");
    model.addAttribute("page", "../mypage/pages/account.jsp");
    model.addAttribute("main_jsp", "../mypage/main.jsp");
    return "main/main";
  }

  @GetMapping("mypage/profile.do")
  public String mypage_profile(Model model) {
    model.addAttribute("path", "profile");
    model.addAttribute("page", "../mypage/pages/profile.jsp");
    model.addAttribute("main_jsp", "../mypage/main.jsp");
    return "main/main";
  }

  @GetMapping("mypage/mileage.do")
  public String mypage_mileage(Model model) {
    model.addAttribute("path", "mileage");
    model.addAttribute("page", "../mypage/pages/mileage.jsp");
    model.addAttribute("main_jsp", "../mypage/main.jsp");
    return "main/main";
  }

  @GetMapping("mypage/campreserve.do")
  public String mypage_campReserve(Model model) {
    model.addAttribute("path", "campreserve");
    model.addAttribute("page", "../mypage/pages/campReserve.jsp");
    model.addAttribute("main_jsp", "../mypage/main.jsp");
    return "main/main";
  }

  @GetMapping("mypage/cart.do")
  public String mypage_cart(Model model) {
    model.addAttribute("path", "cart");
    model.addAttribute("page", "../mypage/pages/cart.jsp");
    model.addAttribute("main_jsp", "../mypage/main.jsp");
    return "main/main";
  }

  @GetMapping("mypage/bookmark.do")
  public String mypage_bookmark(Model model) {
    model.addAttribute("path", "bookmark");
    model.addAttribute("page", "../mypage/pages/bookmark.jsp");
    model.addAttribute("main_jsp", "../mypage/main.jsp");
    return "main/main";
  }

  @GetMapping("mypage/like.do")
  public String mypage_like(Model model) {
    model.addAttribute("path", "like");
    model.addAttribute("page", "../mypage/pages/like.jsp");
    model.addAttribute("main_jsp", "../mypage/main.jsp");
    return "main/main";
  }

  @GetMapping("mypage/reply.do")
  public String mypage_reply(Model model) {
    model.addAttribute("path", "reply");
    model.addAttribute("page", "../mypage/pages/reply.jsp");
    model.addAttribute("main_jsp", "../mypage/main.jsp");
    return "main/main";
  }
}
