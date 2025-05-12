package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
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
}
