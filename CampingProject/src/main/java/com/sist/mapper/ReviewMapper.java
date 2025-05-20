package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;
public interface ReviewMapper {
	// 목록
	@Select("SELECT rno,no,type,id,nickname,sex,msg,"
			+ "group_id,group_step,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as rgday,num "
			+ "FROM (SELECT rno,no,type,id,nickname,sex,msg,group_id,group_step,regdate,rownum as num "
			+ "FROM (SELECT rno,no,type,id,nickname,sex,msg,group_id,group_step,regdate "
			+ "FROM review WHERE no=#{no} AND type=#{type} "
			+ "ORDER BY group_id DESC, group_step ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<ReviewVO> reviewListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/#{rowSize}) FROM review "
			+ "WHERE no=#{no} AND type=#{type}")
	public int reviewTotalPage(Map map);
	// 글쓰기
	@Insert("INSERT INTO review(rno,no,type,id,nickname,sex,msg,group_id) "
			+ "VALUES((SELECT NVL(MAX(rno)+1,1) FROM review),"
			+ "#{no},#{type},#{id},#{nickname},#{sex},#{msg},"
			+ "(SELECT NVL(MAX(group_id)+1,1) FROM review))")
	public void reviewInsert(ReviewVO vo);
	// 수정
	@Update("UPDATE review SET "
			+ "msg=#{msg} "
			+ "WHERE rno=#{rno}")
	public void reviewUpdate(@Param("msg") String msg, @Param("rno") int rno);
	// 삭제 => group_id
	@Delete({"<script>"
			+ "DELETE FROM review "
			+ "WHERE "
			+ "<if test=\"group_step==0\">"
			+ "group_id=#{group_id}"
			+ "</if>"
			+ "<if test=\"group_step!=0\">"
			+ "rno=#{rno}"
			+ "</if>"
			+ "</script>"})
	public void reviewDelete(Map map);
	// 대댓글
	/*
	 *					group_id		group_step
	 * 	AAAAA				1				0
	 * 		= KKKKK			1				1
	 * 		= BBBBB			1				1+1
	 * 		= CCCCC			1				2+1
	 * 		= DDDDD			1				3+1
	 */
	@Select("SELECT group_id,group_step "
			+ "FROM review "
			+ "WHERE rno=#{rno}")
	public ReviewVO reviewParentInfoData(int rno);
	
	@Update("UPDATE review SET "
			+ "group_step=group_step+1 "
			+ "WHERE group_id=#{group_id} AND group_step>#{group_step}")
	public void reviewGroupStepIncrement(ReviewVO vo);
			
	@Insert("INSERT INTO review(rno,no,type,id,nickname,sex,msg,group_id,group_step) "
			+ "VALUES((SELECT NVL(MAX(rno)+1,1) FROM review),"
			+ "#{no},#{type},#{id},#{nickname},#{sex},#{msg},#{group_id},#{group_step})")
	public void reviewReplyReplyInsert(ReviewVO vo);
}
