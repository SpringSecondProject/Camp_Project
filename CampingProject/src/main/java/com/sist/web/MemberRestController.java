package com.sist.web;

import com.sist.service.MemberService;
import com.sist.vo.MemberVO;
import java.util.HashMap;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberRestController {

  @Autowired
  private MemberService service;

  @Autowired
  private BCryptPasswordEncoder encoder;

  @GetMapping("member/id_check_vue.do")
  public String member_id_check(String id) {
    String result = "";
    try {
      int check = service.memberIdCheck(id);
      if (check == 0) {
        result = "yes";
      }
    } catch (Exception e) {
      result = e.getMessage();
    }
    return result;
  }

  @PostMapping("member/signup_insert_vue.do")
  public String member_signup_insert(MemberVO vo) {
    String result = "";
    try {
      String enPwd = encoder.encode(vo.getPwd());
      vo.setPwd(enPwd);
      service.memberInsert(vo);
      result = "yes";
    } catch (Exception e) {
      result = e.getMessage();
    }
    return result;
  }

  @GetMapping("member/account_vue.do")
  public Map member_account(@Param("id") String id) {
    MemberVO vo = service.memberInfoData(id);

    Map map = new HashMap();
    map.put("id", vo.getId());
    map.put("name", vo.getName());
    map.put("nickname", vo.getNickname());
    map.put("email", vo.getEmail());
    map.put("phone", vo.getPhone());
    map.put("post", vo.getPost());
    map.put("addr1", vo.getAddr1());
    map.put("addr2", vo.getAddr2());

    return map;
  }
}
