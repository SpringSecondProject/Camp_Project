package com.sist.vo;

import java.util.Date;
import lombok.Data;

@Data
public class CampCarRentVO {

  private int id, cid, capacity, people, price, state;
  private String pid, options;
  private Date regdate, startdate, enddate;

}
