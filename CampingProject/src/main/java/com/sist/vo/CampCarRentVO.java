package com.sist.vo;

import java.util.Date;
import lombok.Data;

/*
    ID        NUMBER default "HR_3"."ISEQ$$_220640".nextval generated as identity
		constraint CAMPCARRENT_PK
			primary key,
    CID       NUMBER       not null,
    PID       VARCHAR2(50) not null,
    PRICE     NUMBER       not null,
    STARTDATE DATE,
    ENDDATE   DATE,
    REGDATE   DATE   default sysdate
 */

@Data
public class CampCarRentVO {

  private int id, cid, price;
  private String pid, startdate, enddate;
  private Date regdate;

}
