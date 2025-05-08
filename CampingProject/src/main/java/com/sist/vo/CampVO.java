package com.sist.vo;

import lombok.Data;

/*
CNO	NUMBER
TITLE	VARCHAR2(200 BYTE)
INTRO	VARCHAR2(2000 BYTE)
POSTER	VARCHAR2(1000 BYTE)
MANAGESTTUS	VARCHAR2(500 BYTE)
HVOFBGNDE	VARCHAR2(200 BYTE)
HVOFENDDLE	VARCHAR2(200 BYTE)
OPERPDCL	VARCHAR2(1000 BYTE)
INDUTY	VARCHAR2(1000 BYTE)
LCTCL	VARCHAR2(1000 BYTE)
ADDR	VARCHAR2(3000 BYTE)
DONM	VARCHAR2(300 BYTE)
GNRLSITECO	NUMBER
AUTOSITECO	NUMBER
GLAMPSITECO	NUMBER
CARAVSITECO	NUMBER
INDVDLCARAVSITECO	NUMBER
CARAVACMPNYAT	VARCHAR2(50 BYTE)
TRLERACMPNYAT	VARCHAR2(50 BYTE)
ANIMALCMGCL	VARCHAR2(1000 BYTE)
HIT	NUMBER
FCOUNT	NUMBER
LCOUNT	NUMBER
RCOUNT	NUMBER
MAPX	VARCHAR2(300 BYTE)
MAPY	VARCHAR2(300 BYTE)
 */
import java.util.*;
@Data
public class CampVO {
	private int cno,gnrlSiteCo,autoSiteCo,glampSiteCo,caravSiteCo,indvdlCaravSiteCo,hit,fCount,lCount,rCount;
	private String title,intro,poster,manageSttus,hovofBgnde,hvofEnddle,operPdCl,induty,lctCl,addr,doNm,caravAcmpnyAt,trlerAcmpnyAt,animalCmgCl,mapX,mapY;
	// 캠핑장 필터 
	private String name;
	private int cnt;
	// 가격 db에 추가
	private int price;
	// 운영일 db 추가
	private int operDeCl;
}
