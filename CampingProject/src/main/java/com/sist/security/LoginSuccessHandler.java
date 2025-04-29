package com.sist.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.RememberMeServices;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.service.*;
import com.sist.vo.*;
public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	@Autowired
	private MemberService service;
	
	// 로그인 성공
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		MemberVO vo=service.memberInfoData(authentication.getName());
		HttpSession session=request.getSession();
		session.setAttribute("userid", vo.getId());
		session.setAttribute("username", vo.getNickname()==null?vo.getName():vo.getNickname());
		session.setAttribute("sex", vo.getSex());
		
		response.sendRedirect("../main/main.do");
	}
	
	
}
