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
	@Insert("INSERT INTO review(rno,id,no,type,nickname,sex,msg,group_id) "
			+ "VALUES((SELECT NVL(MAX(rno)+1,1) FROM review),#{id},#{no},#{type},#{nickname},#{sex},#{msg},(SELECT NVL(MAX(rno)+1,1) FROM review))")
	public void commonsReviewInsert(ReviewVO vo);
	@Update("UPDATE SET review SET msg=#{msg} WHERE rno=#{rno}")
	public void commonsReviewUpdate(ReviewVO vo);
	@Delete({"<script>"
			+ "DELETE FROM busanReply "
			+ "WHERE "
			+ "<if test=\"group_step==0\">"
			+ "group_id=#{group_id}"
			+ "</if>"
			+ "<if test=\"group_step!=0\">"
			+ "no=#{no}"
			+ "</if>"
			+ "</script>"
		})
	public void commonsReviewDelete(Map map);
	// 대댓글
	@Select("SELECT group_id,group_step FROM review WHERE rno=#{rno}")
	public ReviewVO commonsReviewParentInfoData(int no);
	@Update("UPDATE review SET group_step=group_step+1 WHERE group_id=#{group_id} AND group_step>#{group_step}")
	public void commonsReviewGroupStepIncrement(ReviewVO vo);
	@Insert("INSERT INTO review(rno,id,no,type,nickname,msg,group_id,group_step) "
			+ "VALUES((SELECT NVL(MAX(rno)+1,1) FROM review),#{id},#{no},#{type},#{nickname},#{msg},(SELECT NVL(MAX(rno)+1,1) FROM review),1)")
	public void commonsReviewReplyInsert(ReviewVO vo);
}
