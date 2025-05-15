package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
public interface ItemMapper {
	@Select("SELECT ino,poster,type,brand,name,price,discount,rcount,hit,num "
			+"FROM (SELECT ino,poster,type,brand,name,price,discount,rcount,hit,rownum as num "
			+"FROM (SELECT ino,poster,type,brand,name,price,discount,rcount,hit "
			+"FROM Item)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<ItemVO> itemListData(
			   @Param("start") int start,
			   @Param("end") int end);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM item")
	public int itemTotalPage();
	
	@Select("SELECT * FROM item "
			  +"WHERE ino=#{ino}")
	public ItemVO itemDetailData(int ino);
	
	@Select("SELECT ino,poster,type,brand,name,price,discount,rcount,hit,num "
	        + "FROM (SELECT ino,poster,type,brand,name,price,discount,rcount,hit,rownum as num "
	        + "FROM Item WHERE type=#{category}) "
	        + "WHERE num BETWEEN #{start} AND #{end}")
	public List<ItemVO> itemListByCategory(@Param("start") int start,
	                                        @Param("end") int end,
	                                        @Param("category") String category);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM item")
	public int itemTotalPageByCategory(String category);
	
	@Select("<script>"
	        + "SELECT ino,poster,type,brand,name,price,discount,rcount,hit,num "
	        + "FROM (SELECT ino,poster,type,brand,name,price,discount,rcount,hit,rownum as num "
	        + "FROM (SELECT * FROM item "
	        + "<where>"
	        + "<if test='min != null'>TO_NUMBER(REPLACE(price, ',', '')) &gt;= #{min}</if>"
	        + "<if test='min != null and max != null'> AND </if>"
	        + "<if test='max != null'>TO_NUMBER(REPLACE(price, ',', '')) &lt;= #{max}</if>"
	        + "</where>"
	        + ")) "
	        + "WHERE num BETWEEN #{start} AND #{end}"
	        + "</script>")
	public List<ItemVO> itemListByPrice(@Param("start") int start, @Param("end") int end,
	                                    @Param("min") Integer min, @Param("max") Integer max);
	
	@Select("<script>"
	        + "SELECT CEIL(COUNT(*)/20.0) FROM item "
	        + "<where>"
	        + "price IS NOT NULL "
	        + "AND REGEXP_LIKE(price, '^[0-9,]+$') "
	        + "<if test='min!=null'>AND TO_NUMBER(REPLACE(price, ',', ''))&gt;=#{min}</if> "
	        + "<if test='min!=null and max != null'>AND</if> "
	        + "<if test='max!=null'>TO_NUMBER(REPLACE(price, ',', ''))&lt;=#{max}</if> "
	        + "</where>"
	        + "</script>")
	public int itemPriceTotalPage(@Param("min") Integer min, @Param("max") Integer max);
	
	@Select("SELECT ino,poster,type,brand,name,price,discount,rcount,hit,num "
            +"FROM (SELECT ino,poster,type,brand,name,price,discount,rcount,hit,rownum as num "
            +"FROM (SELECT /*+ INDEX_ASC(item item_ino_pk)*/ino,poster,type,brand,name,price,discount,rcount,hit "
            +"FROM item WHERE ${fd} LIKE '%'||#{ss}||'%')) "
            +"WHERE num BETWEEN #{start} AND #{end}")
	public List<ItemVO> itemFindList(@Param("start") int start,
			   @Param("end") int end,@Param("fd") String fd,@Param("ss") String ss);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) "
			+"FROM item "
			+"WHERE ${fd} LIKE '%'||#{ss}||'%' ")
	public int itemFindTotalPage(@Param("fd") String fd,@Param("ss") String ss);
	
	@Insert("INSERT INTO Cartlist(cno,ino,userid,account) "
			  +"VALUES(bc_cno_seq.nextval,#{ino},#{userid},#{account})")
	public void CartInsert(CartVO vo);
	
	@Select("SELECT COUNT(*) FROM Cartlist "
		   +"WHERE ino=#{ino} AND id=#{id}")
	public int CartInoCount(CartVO vo);
	   
	@Update("UPDATE Cartlist SET "
		   +"account=account+#{account} "
		   +"WHERE ino=#{ino} "
		   +"AND id=#{id}")
	public void itemAccountUpdate(CartVO vo);
 
	@Results({
	   @Result(property = "ivo.name",column = "item_name"),
	   @Result(property = "ivo.poster",column = "item_poster"),
	   @Result(property = "ivo.price",column = "item_price"),
	   @Result(property = "ivo.discount",column = "item_discount"),
	   @Result(property = "ivo.type",column = "item_type")
	})
	
	@Select("SELECT cl.cno, cl.ino, cl.account, cl.status, cl.bno, "
		       + "TO_CHAR(cl.regdate, 'YYYY-MM-DD') AS dbday, "
		       + "it.name AS item_name, it.poster AS item_poster, it.price AS item_price, it.type AS item_type, it.discount AS item_discount "
		       + "FROM Cartlist cl "
		       + "INNER JOIN item it ON cl.ino = it.ino "
		       + "WHERE cl.id = #{id} AND cl.status = 0 "
		       + "ORDER BY cl.cno DESC")
	public List<CartVO> CartListData(String id);	
	
	@Delete("DELETE FROM Cartlist "
				  +"WHERE ino=#{ino}")
	public void CartDelete(int ino);
	
	@Select("SELECT ino,name,poster,hit "
			+"FROM item "
			+"WHERE ino=#{ino}")
	public ItemVO ItemCookie(int ino);
	
	@Update("UPDATE item SET hit=hit+1 "
			+ "WHERE ino=#{ino}")
	public void HitIncrement(int ino);
	
	
	@Select("SELECT ino,poster,type,brand,name,price,discount,hit "
			 + "FROM (SELECT * FROM item ORDER BY hit DESC) "
		     + "WHERE ROWNUM<=12")
	public List<ItemVO> itemList();
}
