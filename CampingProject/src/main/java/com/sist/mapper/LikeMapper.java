package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
import java.util.*;

public interface LikeMapper {
	
    @Insert("INSERT INTO CAMPLIKE (lno, id, no, type) "
    		+ "VALUES (camp_like_seq.nextval, #{id}, #{no}, #{type})")
    public void insertLike(Map map);

    @Select("SELECT COUNT(*) "
    		+ "FROM CAMPLIKE "
    		+ "WHERE id = #{id} AND no = #{no} AND type = #{type}")
    public int countLike(Map map); // 중복방지
    
    // 최초에 접속했을때 표시
    @Select("SELECT no FROM CAMPLIKE "
    		+ "WHERE id=#{id} AND type=#{type}")
    public List<Integer> likedCampList(@Param("id") String id, @Param("type") int type);
    
    
    
    // 이건 마이페이지 들어가는거라 따로 만들어야함 // 캠핑장 상품 레시피 따로
    // 마이페이지 좋아요한 캠핑장 리스트 출력 // CAMPLIKE에서 no를 받아서 cno검색
	@Select("SELECT c.cno, c.title, c.poster, c.induty, c.lctcl, c.price, c.animalcmgcl, c.addr "
			+ "FROM camp c "
			+ "JOIN CAMPLIKE l "
			+ "ON c.cno = l.no "
			+ "WHERE l.id = #{id} AND l.type = #{type}")
	public List<CampVO> MyCampLikeList(Map map);
	
	//아이템 임시
	@Select("SELECT i.ino, i.name, i.poster, i.brand, i.type, i.brand, i.price "
			+ "FROM Item i "
			+ "JOIN CAMPLIKE l "
			+ "ON i.ino = l.no "
			+ "WHERE l.id = #{id} AND l.type = #{type}")
	public List<ItemVO> MyItemLikeList(Map map);
	  
	//레시피 임시
	@Select("SELECT r.no, r.title, r.poster "
			+ "FROM recipeDetail r "
			+ "JOIN CAMPLIKE l "
			+ "ON r.no = l.no "
			+ "WHERE l.id = #{id} AND l.type = #{type}")
	public List<RecipeVO> MyRecipeLikeList(Map map);
	
}
