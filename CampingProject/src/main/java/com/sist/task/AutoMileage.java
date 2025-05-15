package com.sist.task;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.*;
import com.sist.service.*;
import com.sist.vo.*;

@Component
public class AutoMileage {
	@Autowired
	private MileageService mService;
	@Autowired
	private CampService cService;
	// 5분마다 남은기간 7일 이하 예약 => 확정 변경
	@Scheduled(fixedRate = 5*60*1000)
	public void reserveConfirmed() {
		List<ReserveVO> list=mService.reserveConfirmedList();
		for(ReserveVO vo:list) {
			cService.reserveConfirmedState(vo.getRno());
		}
	}
}
