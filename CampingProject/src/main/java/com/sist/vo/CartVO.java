package com.sist.vo;

import java.util.*;
import lombok.Data;

@Data
public class CartVO {
	private int cno,ino,account,status,bno;
	private String id;
	private Date regdate;
    private String dbday;
	private ItemVO ivo=new ItemVO();

    public int getIno() { return ino; }
    public String getId() { return id; }
    public int getAccount() { return account; }
    public ItemVO getIvo() { return ivo; }
}
