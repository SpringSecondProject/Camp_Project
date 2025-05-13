package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
import java.util.*;

public interface CamplistMapper {
	//camp_no_pk 시퀀스 생성
	
	@Select("SELECT cno,title,intro,poster,induty,lctcl,addr,price,animalcmgcl,num "
			+ "FROM (SELECT cno,title,intro,poster,induty,lctcl,addr,price,animalcmgcl,rownum as num "
			+ "FROM (SELECT /*+ INDEX_ASC(camp camp_cno_pk) */cno,title,intro,poster,induty,lctcl,addr,price,animalcmgcl "
			+ "FROM camp WHERE poster IS NOT NULL))"
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<CampVO> campListData(Map map);
	
	
	@Select("SELECT COUNT(*) FROM camp WHERE poster IS NOT NULL ")
	public int campTotalPage(); 
	
	/*
	 * 	<select id="campFilter" resultType="CampVO" parameterType="map">
    SELECT cno, title, intro, poster, induty, lctcl, addr,doNm, num
    FROM (
        SELECT cno, title, intro, poster, induty, lctcl, addr,doNm, rownum AS num
        FROM (
            SELECT + INDEX_ASC(camp camp_no_pk) 
                   cno, title, intro, poster, induty, lctcl, addr,doNm
            FROM camp
            WHERE poster IS NOT NULL AND intro IS NOT NULL
            <if test="locations != null and locations.size > 0">
                AND doNm IN
                <foreach item="loc" collection="locations" open="(" separator="," close=")">
                    #{loc}
                </foreach>
            </if>
        )
    )
    WHERE num BETWEEN #{start} AND #{end}
</select>
	 */
	public List<CampVO> campFilter(Map map); 
	/*
	 * 		<select id="campFilterTotalPage" resultType="int" parameterType="map">
		    SELECT COUNT(*) 
		    FROM camp
		    WHERE poster IS NOT NULL
            <if test="locations != null and locations.size > 0">
		        AND (
		            <foreach item="loc" collection="locations" separator="OR">
		                doNm LIKE '%' || #{loc} || '%'
		            </foreach>
		        )
		    </if>
		</select>
	 */
	public int campFilterTotalPage(Map map); 
	
	
	 
	@Select("SELECT doNm AS name, COUNT(*) AS cnt "
			+ "FROM camp "
			+ "WHERE poster IS NOT NULL GROUP BY doNm")
	public List<CampVO> campLocationCount();
	
	@Select("SELECT induty "
			+ "FROM camp "
			+ "WHERE poster IS NOT NULL")
	public List<String> campIndutyList();
	
	@Select("SELECT lctcl FROM camp WHERE poster IS NOT NULL")
	public List<String> campLctclList();
	
	// 조회수 증가 Aspect
	@Update("UPDATE camp SET hit = hit + 1 "
			+ "WHERE cno=#{cno}")
	public void HitIncrement(int cno);
	
	// 쿠키용 조회
	@Select("SELECT cno,title,poster "
			+ "FROM camp "
			+ "WHERE cno=#{cno}")
	public CampVO CampCookie(int cno); 
}
