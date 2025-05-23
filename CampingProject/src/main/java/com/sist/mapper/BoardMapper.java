package com.sist.mapper;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.sist.vo.*;
public interface BoardMapper {

    // 공지사항 목록 조회
	@Select("SELECT BNO,NICKNAME,SUBJECT,REGDATE,HIT,NUM "
			+"FROM (SELECT BNO,NICKNAME,SUBJECT,TO_CHAR(REGDATE,'YYYY-MM-DD') AS regdate,HIT,ROWNUM AS NUM "
			+"FROM (SELECT BNO,NICKNAME,SUBJECT,REGDATE,HIT "
			+"FROM BOARD WHERE TYPE=3 ORDER BY BNO DESC))"
			+ "WHERE NUM BETWEEN #{start} AND #{end}")
	public List<BoardVO> getNoticeList(@Param("start")int start,@Param("end")int end);
	
	@Select("SELECT CEIL(COUNT(*) / 12.0) FROM BOARD")
	public int BOARDTotalPage();

    // 공지사항 상세 조회
    @Select("SELECT * FROM BOARD WHERE BNO = #{bno}")
    public BoardVO getNoticeDetail(int bno);

    // 공지사항 등록
    @Insert("INSERT INTO BOARD (BNO, ID, NICKNAME, SUBJECT, CONTENT, REGDATE, TYPE, HIT, LCOUNT, FCOUNT, RCOUNT) "
    	   +"VALUES (BOARD_SEQ.NEXTVAL, #{id}, #{nickname}, #{subject}, #{content}, SYSDATE, 3, 0, 0, 0, 0)")
    public void insertNotice(BoardVO vo);

    // 공지사항 수정
    @Update("UPDATE BOARD SET SUBJECT = #{subject}, CONTENT = #{content} WHERE BNO = #{bno}")
    public void updateNotice(BoardVO vo);

    // 공지사항 삭제
    @Delete("DELETE FROM BOARD WHERE BNO = #{bno}")
    public void deleteNotice(int bno);
    
    // 조회수 증가
    @Update("UPDATE BOARD SET "
  		  	+"hit=hit+1 "
  		  	+"WHERE BNO=#{bno}")
    public void hitIncrement(int bno);
    
    @Select("SELECT bno,subject,nickname,regdate,hit,num "
    		+ "FROM (SELECT bno,subject,nickname,regdate,hit,rownum as num "
    		+ "FROM (SELECT bno,subject,nickname,regdate,hit FROM board WHERE type=3 ORDER BY bno desc)) "
    		+ "WHERE num < 6")
    public List<BoardVO> mainNoticeList();
}
