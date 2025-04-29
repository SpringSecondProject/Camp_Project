package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
public interface ItemMapper {
	@Select("SELECT ino,poster,type,name,price,discount,rcount,num "
			+"FROM (SELECT ino,poster,type,name,price,discount,rcount,rownum as num "
			+"FROM (SELECT ino,poster,type,name,price,discount,rcount "
			+"FROM Item)) "
			+"WHERE num BETWEEN {start} AND {end}")
	public List<ItemVO> itemListData(Map map);
}
