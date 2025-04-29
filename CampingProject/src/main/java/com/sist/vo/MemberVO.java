package com.sist.vo;
/*
ID	VARCHAR2(20 BYTE)
PWD	VARCHAR2(200 BYTE)
NAME	VARCHAR2(52 BYTE)
NICKNAME	VARCHAR2(200 BYTE)
SEX	VARCHAR2(20 BYTE)
BIRTHDAY	DATE
EMAIL	VARCHAR2(100 BYTE)
PHONE	VARCHAR2(13 BYTE)
POST	VARCHAR2(10 BYTE)
ADDR1	VARCHAR2(200 BYTE)
ADDR2	VARCHAR2(200 BYTE)
BIRTH	VARCHAR2(100 BYTE)
CONTENT	CLOB
 */
import lombok.Data;
import java.util.*;
@Data
public class MemberVO {
	private String id,pwd,name,nickname,sex,email,phone,post,addr1,addr2,birth,content,dbday;
	private Date birthday;
}
