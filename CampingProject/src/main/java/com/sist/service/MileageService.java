package com.sist.service;

import java.util.*;
import com.sist.vo.*;

public interface MileageService {
	public int getMileage(String id);
	/**
	 * MileageVO => id,no,type 추가
	 * no : 캠핑장 예약 / 쇼핑몰 결제
	 * type : 0:캠핑장, 1:쇼핑몰
	 */
	public String mileageAdd(MileageVO vo);
	/**
	 * MileageVO => id,no,type,point 추가
	 * no : 캠핑장 예약 / 쇼핑몰 결제
	 * type : 0:캠핑장, 1:쇼핑몰
	 * point : 사용 포인트
	 */
	public String mileageUse(MileageVO vo);
}
