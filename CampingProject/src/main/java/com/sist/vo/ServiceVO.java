package com.sist.vo;

import java.util.Date;
import lombok.Data;

/*
    ID      NUMBER          not null     constraint SERVICE_PK     primary key,
    PID     VARCHAR2(50)    not null,
    TYPE    NUMBER,
    TITLE   VARCHAR2(100),
    CONTENT CLOB            not null,
    "DATE"  DATE            not null,     default SYSDATE
    OK      NUMBER
 */
@Data
public class ServiceVO {

  private int id, type, ok, target;
  private String pid, title, content;
  private Date regdate;
}
