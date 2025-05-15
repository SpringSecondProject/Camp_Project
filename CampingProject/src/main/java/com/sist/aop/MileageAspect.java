package com.sist.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.sist.service.*;
import com.sist.vo.*;

@Aspect
@Component
public class MileageAspect {
	@Autowired
	private MileageService service;
	
	@After("execution(* com.sist.security.LoginSuccessHandler.*(..))"
		+ " || execution(* com.sist.web.MainController.*(..))"
		+ " || execution(* com.sist.web.CampRestController.camp_reserve(..))"
		)
	public void MileageUpdate(JoinPoint jp) {
		HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("userid");
		if(id!=null) {
			int point = service.getMileage(id);
			session.setAttribute("point", point);
		}
	}
}
