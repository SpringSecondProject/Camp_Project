<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
	<div class="rev-f1__review">
        <div class="review-o u-s-m-b-15" v-for="rvo in list">
            <div class="review-o__info u-s-m-b-8">
	        	<div class="comment-author">
	                <img :src="rvo.sex==='남자'?'../images/man.png':'../images/woman.png'" style="width: 30px;height: 30px;">
	            </div>
                <span class="review-o__name">{{rvo.nickname}}</span>
                <span class="review-o__date">{{rvo.rgday}}</span>
            </div>
            <p class="review-o__text">{{rvo.msg}}</p>
        </div>
    </div>
    <c:if test="${sessionScope.userid!=null }">
	    <div class="u-s-m-b-30">
		    <form class="pd-tab__rev-f2">
		        <div class="rev-f2__group">
		            <div class="u-s-m-b-15">
		                <label class="gl-label" for="reviewer-text">리뷰 쓰기</label>
		                <textarea rows="10" cols="100" style="float: left;" ref="msg" v-model="msg"></textarea>
		                <input type="button" class="btn-sm btn-primary" value="댓글"
		                    style="float: left;color: white;width: 80px;height: 121px" @click="replyInsert()">
		            </div>
		        </div>
		    </form>
		</div>
    </c:if>
</body>
</html>