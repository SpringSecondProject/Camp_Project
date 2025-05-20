<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
	<div class="rev-f1__review">
		<div hidden id="id-div" data-userid="${sessionScope.userid==null?'':sessionScope.userid }"></div>
        <div class="review-o u-s-m-b-15" v-for="rvo in list" :id="'m'+rvo.rno">
            <div class="review-o__info u-s-m-b-8" :style="rvo.group_step!=0?'margin-left: 50px;':''">
	        	<div class="comment-author">
	                <img :src="rvo.sex==='남자'?'../images/man.png':'../images/woman.png'" style="width: 30px;height: 30px;">
	            </div>
                <span class="review-o__name">{{rvo.nickname}}</span>
                <span class="review-o__date">{{rvo.rgday}}</span>
	            <pre class="review-o__text" style="border: none;">{{rvo.msg}}</pre>
	           	<a v-if="sessionId!='' && rvo.group_step==0" class="btn-sm btn-primary btn-r" :id="'btn-r'+rvo.rno" @click="rReply(rvo.rno)">댓글</a>
	            <a v-if="sessionId==rvo.id" class="btn-sm btn-info btn-u" :id="'btn-u'+rvo.rno" @click="rUpdate(rvo.rno)">수정</a>
	   	        <a v-if="sessionId==rvo.id" class="btn-sm btn-danger" @click="rDelete(rvo.rno)">삭제</a>
            </div>
   	        <div class="u-s-m-b-30 reply-div" :id="'r'+rvo.rno" v-show="false">
			    <form class="pd-tab__rev-f2">
			        <div class="rev-f2__group">
			            <div class="u-s-m-b-15">
			                <label class="gl-label" for="reviewer-text">댓글 쓰기</label>
			                <textarea rows="10" cols="100" style="float: left;" ref="rmsg" v-model="rmsg"></textarea>
			                <input type="button" class="btn-sm btn-primary" value="등록"
			                    style="float: left;color: white;width: 80px;height: 121px" @click="rReplyInsert(rvo.rno)">
			            </div>
			        </div>
			    </form>
			</div>
   	        <div class="u-s-m-b-30 update-div" :id="'u'+rvo.rno" v-show="false">
			    <form class="pd-tab__rev-f2">
			        <div class="rev-f2__group">
			            <div class="u-s-m-b-15">
			                <label class="gl-label" for="reviewer-text">댓글 수정</label>
			                <textarea rows="10" cols="100" style="float: left;" ref="umsg" v-model="umsg"></textarea>
			                <input type="button" class="btn-sm btn-primary" value="수정"
			                    style="float: left;color: white;width: 80px;height: 121px" @click="uReplyUpdate(rvo.rno)">
			            </div>
			        </div>
			    </form>
			</div>
        </div>
        <div class="text-center" v-if="list.length!=0">
			<page-card></page-card>
		</div>
    </div>
    <c:if test="${sessionScope.userid!=null }">
	    <div class="u-s-m-b-30">
		    <form class="pd-tab__rev-f2">
		        <div class="rev-f2__group">
		            <div class="u-s-m-b-15">
		                <label class="gl-label" for="reviewer-text">댓글 쓰기</label>
		                <textarea rows="10" cols="100" style="float: left;" ref="msg" v-model="msg"></textarea>
		                <input type="button" class="btn-sm btn-primary" value="등록"
		                    style="float: left;color: white;width: 80px;height: 121px" @click="replyInsert()">
		            </div>
		        </div>
		    </form>
		</div>
    </c:if>
</body>
</html>