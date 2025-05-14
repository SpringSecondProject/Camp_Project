package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Results;

import com.sist.vo.*;
public interface ItemMapper {
	@Select("SELECT ino,poster,type,brand,name,price,discount,rcount,num "
			+"FROM (SELECT ino,poster,type,brand,name,price,discount,rcount,rownum as num "
			+"FROM (SELECT ino,poster,type,brand,name,price,discount,rcount "
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
	
	@Select("SELECT ino,poster,type,brand,name,price,discount,rcount,num "
	        + "FROM (SELECT ino,poster,type,brand,name,price,discount,rcount,rownum as num "
	        + "FROM Item WHERE type=#{category}) "
	        + "WHERE num BETWEEN #{start} AND #{end}")
	public List<ItemVO> itemListByCategory(@Param("start") int start,
	                                        @Param("end") int end,
	                                        @Param("category") String category);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM item")
	public int itemTotalPageByCategory(String category);
	
	@Select("<script>"
	        + "SELECT ino,poster,type,brand,name,price,discount,rcount,num "
	        + "FROM (SELECT ino,poster,type,brand,name,price,discount,rcount,rownum as num "
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
	
	@Select("SELECT ino,poster,type,brand,name,price,discount,rcount,num "
            +"FROM (SELECT ino,poster,type,brand,name,price,discount,rcount,rownum as num "
            +"FROM (SELECT /*+ INDEX_ASC(item item_ino_pk)*/ino,poster,type,brand,name,price,discount,rcount "
            +"FROM item WHERE ${fd} LIKE '%'||#{ss}||'%')) "
            +"WHERE num BETWEEN #{start} AND #{end}")
	public List<ItemVO> itemFindList(@Param("start") int start,
			   @Param("end") int end,@Param("fd") String fd,@Param("ss") String ss);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) "
			+"FROM item "
			+"WHERE ${fd} LIKE '%'||#{ss}||'%' ")
	public int itemFindTotalPage(@Param("fd") String fd,@Param("ss") String ss);
	
	@Insert("INSERT INTO Cartlist(cno,ino,id,account) "
			  +"VALUES(cl_cno_seq.nextval,#{ino},#{id},#{account})")
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
	   @Result(property = "ivo.item_name",column = "item_name"),
	   @Result(property = "ivo.item_poster",column = "item_poster"),
	   @Result(property = "ivo.item_price",column = "item_price"),
	   @Result(property = "ivo.item_type",column = "item_type")
	})
	
	@Select("SELECT cno,ino,account,total,status,bno,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,"
		  +"item_name,item_poster,item_price,item_type "
		  +"FROM Cartlist cl "		  
		  +"INNER JOIN item it ON cl.ino = it.ino "
		  +"WHERE cl.id = #{id} AND cl.status = 0 "
		  +"ORDER BY cno DESC")
	public List<CartVO> CartListData(String id);

	@Select("SELECT cno, ino, account, total, status, bno, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, "
	        + "item_name, item_poster, item_price,item_type "
	        + "FROM Cartlist cl "
	        + "INNER JOIN item it ON cl.ino = it.ino "
	        + "WHERE cl.cno = #{cno} AND cl.id = #{id} AND cl.status = 0")
	public CartVO getCartItemByCno(@Param("cno") int cno, @Param("id") String id);
	
	@Delete("DELETE FROM Cartlist WHERE ino=#{ino} AND id=#{id}")
	public void CartDelete(int ino);
}
