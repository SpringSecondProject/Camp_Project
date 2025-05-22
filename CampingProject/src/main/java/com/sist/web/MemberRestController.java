package com.sist.web;

import com.sist.service.MemberService;
import com.sist.vo.MemberVO;

import java.util.HashMap;
import java.util.LinkedHashMap;
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

  @GetMapping("mypage/account_vue.do")
  public Map mypage_account(@Param("id") String id) {
    MemberVO vo = service.memberInfoData(id);

    Map map = new LinkedHashMap();
    map.put("name", vo.getName());
    map.put("nickname", vo.getNickname());
    map.put("email", vo.getEmail());
    map.put("phone", vo.getPhone());
    map.put("addr", vo.getPost() + "\n " + vo.getAddr1() + " " + vo.getAddr2());

    return map;
  }

  @GetMapping("mypage/profile_vue.do")
  public Map mypage_profile(@Param("id") String id) {
    MemberVO vo = service.memberInfoData(id);

    Map map = new LinkedHashMap();
    map.put("ID", vo.getId());
    map.put("이름", vo.getName());
    map.put("이메일", vo.getEmail());
    map.put("닉네임", vo.getNickname());
    map.put("연락처", vo.getPhone());
    map.put("주소", vo.getPost() + "\n " + vo.getAddr1() + " " + vo.getAddr2());

    return map;
  }

  @GetMapping("mypage/profile_update_vue.do")
  public void mypage_profile_update(MemberVO vo) {
    service.memberInfoUpdate(vo);
  }

  @GetMapping("mypage/profile_delete_vue.do")
  public void mypage_profile_delete(String id) {
    try {
      service.memberInfoDelete(id);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }
	@GetMapping("mypage/buy_list_vue.do")
	public Map mypage_buy_list(int page) {
		Map map=new HashMap();
		System.out.println(page);
		return map;
	}
}
