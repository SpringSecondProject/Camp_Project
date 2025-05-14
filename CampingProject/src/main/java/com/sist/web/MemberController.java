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

  @GetMapping("member/mypage.do")
  public String member_mypage(Model model) {
    model.addAttribute("path", "account");
    model.addAttribute("page", "../member/pages/account.jsp");
    model.addAttribute("main_jsp", "../member/mypage.jsp");
    return "main/main";
  }

  @GetMapping("member/profile.do")
  public String member_profile(Model model) {
    model.addAttribute("path", "profile");
    model.addAttribute("page", "../member/pages/profile.jsp");
    model.addAttribute("main_jsp", "../member/mypage.jsp");
    return "main/main";
  }

  @GetMapping("member/campreserve.do")
  public String member_campReserve(Model model) {
    model.addAttribute("path", "campreserve");
    model.addAttribute("page", "../member/pages/campReserve.jsp");
    model.addAttribute("main_jsp", "../member/mypage.jsp");
    return "main/main";
  }

  @GetMapping("member/cart.do")
  public String member_cart(Model model) {
    model.addAttribute("path", "cart");
    model.addAttribute("page", "../member/pages/cart.jsp");
    model.addAttribute("main_jsp", "../member/mypage.jsp");
    return "main/main";
  }

  @GetMapping("member/bookmark.do")
  public String member_bookmark(Model model) {
    model.addAttribute("path", "bookmark");
    model.addAttribute("page", "../member/pages/bookmark.jsp");
    model.addAttribute("main_jsp", "../member/mypage.jsp");
    return "main/main";
  }

  @GetMapping("member/like.do")
  public String member_like(Model model) {
    model.addAttribute("path", "like");
    model.addAttribute("page", "../member/pages/like.jsp");
    model.addAttribute("main_jsp", "../member/mypage.jsp");
    return "main/main";
  }

  @GetMapping("member/reply.do")
  public String member_reply(Model model) {
    model.addAttribute("path", "reply");
    model.addAttribute("page", "../member/pages/reply.jsp");
    model.addAttribute("main_jsp", "../member/mypage.jsp");
    return "main/main";
  }
}
