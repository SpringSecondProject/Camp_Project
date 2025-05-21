package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
public interface CommonsMapper {
	@Select("SELECT rno,id,no,type,nickname,sex,msg,rgday,mdday,group_id,group_step,num "
			+ "FROM (SELECT rno,id,no,type,nickname,sex,msg,rgday,mdday,group_id,group_step,rownum as num "
			+ "FROM (SELECT rno,id,no,type,nickname,sex,msg,"
			+ "TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as rgday,"
			+ "TO_CHAR(moddate,'YYYY-MM-DD HH24:MI:SS') as mdday,"
			+ "group_id,group_step "
			+ "FROM review WHERE type=#{type} AND no=#{no} "
			+ "ORDER BY group_id DESC,group_step ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<ReviewVO> commonsReviewList(Map map);
	@Select("SELECT COUNT(*) FROM review WHERE  type=#{type} AND no=#{no}")
	public int commonsReviewCount(Map map);
	@Insert("<script>"
			+ "INSERT INTO review(rno,id,no,type,nickname,sex,msg,group_step,group_id) "
			+ "VALUES((SELECT NVL(MAX(rno)+1,1) FROM review),#{id},#{no},#{type},#{nickname},#{sex},#{msg},#{group_step},"
			+ "<if test=\"group_step==0\">"
			+ "(SELECT NVL(MAX(rno)+1,1) FROM review))"
			+ "</if>"
			+ "<if test=\"group_step!=0\">"
			+ "#{group_id})"
			+ "</if>"
			+ "</script>")
	public void commonsReviewInsert(ReviewVO vo);
	@Update("UPDATE review SET msg=#{msg} WHERE rno=#{rno}")
	public void commonsReviewUpdate(ReviewVO vo);
	@Delete({"<script>"
			+ "DELETE FROM review "
			+ "WHERE "
			+ "<if test=\"group_step==0\">"
			+ "group_id=#{group_id}"
			+ "</if>"
			+ "<if test=\"group_step!=0\">"
			+ "rno=#{rno}"
			+ "</if>"
			+ "</script>"
		})
	public void commonsReviewDelete(ReviewVO vo);
	// 대댓글 순서 조절
	@Update("UPDATE review SET group_step=group_step+1 WHERE group_id=#{group_id} AND group_step>(#{group_step}-1)")
	public void commonsReviewGroupStepIncrement(ReviewVO vo);
	
	// 마이페이지 - 리뷰
	public List<ReviewVO> myReviewList(Map map);
	public int myReviewCount(Map map);
}
