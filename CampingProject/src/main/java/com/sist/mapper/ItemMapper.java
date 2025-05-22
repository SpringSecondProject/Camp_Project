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
	
	
	@Select("SELECT ino,poster,type,brand,name,price,discount,rcount,hit,num "
	        + "FROM (SELECT ino,poster,type,brand,name,price,discount,rcount,hit,rownum as num "
	        + "FROM Item WHERE brand=#{brand}) "
	        + "WHERE num BETWEEN #{start} AND #{end}")
	public List<ItemVO> itemListByBrand(@Param("start") int start,
	                                        @Param("end") int end,
	                                        @Param("brand") String brand);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM item WHERE brand=#{brand}")
	public int itemTotalPageByBrand(String brand);
	
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
	
	@Insert("INSERT INTO Cartlist(cno,ino,id,account) "
			  +"VALUES(cl_cno_seq.nextval,#{ino},#{id},#{account})")
	public void CartInsert(CartVO vo);
	
	@Select("SELECT COUNT(*) FROM Cartlist "
		   +"WHERE ino=#{ino} AND id=#{id} ANd status=0")
	public int CartInoCount(CartVO vo);
	   
	@Update("UPDATE Cartlist SET "
		   +"account=account+#{account} "
		   +"WHERE ino=#{ino} "
		   +"AND id=#{id}")
	public void itemAccountUpdate(CartVO vo);
 
    public List<CartVO> CartListData(String id);
	
	@Delete("DELETE FROM Cartlist "
				  +"WHERE ino=#{ino} ANd status=0")
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
	
	@Delete("DELETE FROM Cartlist "
			  +"WHERE id=#{id}")
	public void CartReset(String id);
	
	@Update("UPDATE Cartlist SET "
			+"account = #{account} "
			+ "WHERE cno = #{cno} "
			+ "AND id = #{id}")
	void itemAccountModify(CartVO vo);
	//상세페이지 바로구매 - 가장 최근 생성된 장바구니 찾기
	@Select("SELECT cno FROM (SELECT cno FROM cartlist WHERE id=#{id} AND status=0 ORDER BY cno DESC) WHERE rownum=1")
	public int cartFindNewCno(String id);
	
	//장바구니 구매 - 결제 테이블 추가
	@Insert("INSERT INTO buy_history(bno,id,regdate,total_price) "
			+ "VALUES((SELECT NVL(MAX(bno)+1,1) FROM buy_history),#{id},SYSDATE,#{total_price})")
	public void buyInsert(BuyVO vo);
	//장바구니 구매 - 가장 최근 생성된 결제 테이블 찾기
	@Select("SELECT bno FROM (SELECT bno FROM buy_history WHERE id=#{id} ORDER BY bno DESC) WHERE rownum=1")
	public int buyFindNewBno(String id);
	//장바구니 구매 - 장바구니 업데이트
	@Update("UPDATE cartlist set status=1,bno=#{bno} WHERE id=#{id} AND status=0 AND cno=#{cno}")
	public void cartUpdateByBuy(CartVO vo);
	
	
	//구매내역 조회
	public List<BuyVO> myBuyListData(Map map);
	@Select("SELECT COUNT(*) FROM BUY_HISTORY WHERE id=#{id}")
	public int myBuycount(String id);
}
