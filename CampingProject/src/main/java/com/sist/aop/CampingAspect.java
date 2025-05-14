package com.sist.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.sist.dao.*;

@Aspect
@Component
public class CampingAspect {
    @Autowired
    private CamplistDAO cDao;

    // 컨트롤로 실행전에 실행되는거임
//    @Before("execution(* com.sist.web.CampController.camp_detail(..))")
//    public void increaseHit(JoinPoint jp) {
//    	int cno = (int) jp.getArgs()[0];
//        cDao.HitIncrement(cno);
//        System.out.println("조회수 증가 완료 (AOP)");
//    }
}