package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.service.*;
import com.sist.vo.*;
@RestController
public class MemberRestController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@GetMapping("member/id_check_vue.do")
	public String member_id_check(String id) {
		String result="";
		try {
			int check=service.memberIdCheck(id);
			if(check==0) {
				result="yes";
			}
		} catch (Exception e) {
			result=e.getMessage();
		}
		return result;
	}
	@PostMapping("member/signup_insert_vue.do")
	public String member_signup_insert(MemberVO vo) {
		String result="";
		try {
			String enPwd=encoder.encode(vo.getPwd());
			vo.setPwd(enPwd);
			service.memberInsert(vo);
			result="yes";
		} catch (Exception e) {
			result=e.getMessage();
		}
		return result;
	}
}
