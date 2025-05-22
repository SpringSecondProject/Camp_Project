<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/recipe.css" rel="stylesheet">
<style type="text/css">
.crop-height-300 {
  width: 100%;
  height: 300px;             /* 원하는 높이로 조절 */
  object-fit: cover;         /* 이미지가 잘리더라도 꽉 채움 */
  display: block;
  margin: 0 auto;
}
.crop-height-150 {
  width: 100%;
  height: 150px;             /* 원하는 높이로 조절 */
  object-fit: cover;         /* 이미지가 잘리더라도 꽉 채움 */
  display: block;
  margin: 0 auto;
}
</style>
</head>
<body>
  <section class="archive-area section_padding_80" id="listApp">
	<div class="container" id="listApp" style="font-size:12px; line-height:1.6; font-family:'맑은 고딕','Malgun Gothic',sans-serif;">
	
	  <!-- 이미지와 제목 -->
	  <div class="panel panel-default">
	    <div class="panel-body text-center">
	      <img src="${vo.poster }" class="img-responsive center-block crop-height-300">
	      <h2 class="text-primary" style="margin-top:20px;">${vo.title }</h2>
	      <p class="text-muted">${vo.content }</p>
	    </div>
	  </div>
	
	  <!-- 아이콘 3개 -->
	  <div class="row text-center" style="margin-bottom: 20px;">
	    <div class="col-sm-4">
	      <img src="../images/icon/recipe/a1.png" class="img-responsive center-block" style="height:50px;">
	      <p class="text-muted">${vo.cook_portion }</p>
	    </div>
	    <div class="col-sm-4">
	      <img src="../images/icon/recipe/a2.png" class="img-responsive center-block" style="height:50px;">
	      <p class="text-muted">${vo.cook_time }</p>
	    </div>
	    <div class="col-sm-4">
	      <img src="../images/icon/recipe/a3.png" class="img-responsive center-block" style="height:50px;">
	      <p class="text-muted">${vo.cook_level }</p>
	    </div>
	  </div>
	
	  <!-- 재료 -->
	  <div class="panel panel-default">
	    <div class="panel-heading"><h4 class="panel-title">[ 재료 ]</h4></div>
	    <div class="panel-body">
	      <ul class="list-unstyled" style="column-count: 2;">
	       <c:forEach var="d" items="${materials }">
	        <li class="text-muted">
	        	<span class="glyphicon glyphicon-leaf"></span> ${d }
	        </li>
	       </c:forEach>
	      </ul>
	    </div>
	  </div>
	
	  <!-- 조리 순서 -->
	  <div class="panel panel-default">
	    <div class="panel-heading"><h4 class="panel-title">[ 조리 순서 ]</h4></div>
	    <div class="panel-body">
         <c:forEach var="m" items="${mlist }" varStatus="s">
	      <div class="row" style="margin-bottom:15px;">
	        <div class="col-sm-8">
<!-- 	        
	          <strong>${s.index+1 }.</strong>
-->	        
	           ${m }
 	        </div>
	        <div class="col-sm-4 text-right">
	          <img src="${ilist[s.index] }" class="img-thumbnail crop-height-150">
	        </div>
	      </div>
	     </c:forEach> 
	    </div>
	  </div>
	
	  <!-- 작성자 정보 -->
	  <div class="panel panel-default">
	    <div class="panel-heading"><h4 class="panel-title">[ 레시피 작성자 ]</h4></div>
	    <div class="panel-body">
	      <div class="media">
	        <div class="media-left">
	          <img src="${vo.chef_poster }" class="img-circle media-object" style="width:80px; height:80px;">
	        </div>
	        <div class="media-body">
	          <h5 class="media-heading">${vo.chef }</h5>
	          <p class="text-muted"><small>${vo.chef_comment }</small></p>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
    <%--  댓글 위치 --%>
    <div style="height: 10px"></div>
	<div class="container" id="replyApp" style="font-size:12px; line-height:1.6; font-family:'맑은 고딕','Malgun Gothic',sans-serif;">
	  <div class="panel panel-default">
	    <div class="panel-heading"><h4 class="panel-title">[ 댓글 / review ]</h4></div>
	    <div class="panel-body">
	      <%-- 댓글 : Vue --%>
	      <!-- review Area Start -->
			<div class="comment_area section_padding_50 clearfix">
			  <ul style="list-style: none;">
			    <!-- 댓글 -->
			    <li class="single_comment_area" v-for="rvo in reply_list">
			      <!-- 원댓글 -->
			      <div class="media comment-wrapper" v-if="rvo.group_step === 0">
			        <div class="media-left">
			          <img :src="rvo.sex === '남자' ? '../images/man.png' : '../images/woman.png'"
			               class="media-object img-circle"
			               style="width:50px; height:50px;" alt="">
			        </div>
			        <div class="media-body">
			          <h5 class="media-heading">
			            {{ rvo.nickname }}
			            <small class="text-muted" style="margin-left: 10px;">{{ rvo.rgday }}</small>
			          </h5>
			          <p>{{ rvo.msg }}</p>
			
			          <!-- 버튼 -->
			          <div class="btn-group btn-group-xs" role="group" style="margin-bottom:10px;">
			            <button v-if="sessionId === rvo.id"
			                    class="btn btn-danger update" style="margin-right: 5px; min-width: 50px;"
			                    :id="'u' + rvo.rno"
			                    @click="replyUpdateForm(rvo.rno)">Update</button>
			            <button v-if="sessionId === rvo.id" style="margin-right: 5px; min-width: 50px;"
			                    class="btn btn-info"
			                    @click="replyDelete(rvo.rno)">Delete</button>
			            <button v-if="sessionId !== ''"
			                    class="btn btn-success insert" style="margin-right: 5px; min-width: 50px;"
			                    :id="'i' + rvo.rno"
			                    @click="replyReplyInsertForm(rvo.rno)">Reply</button>
			          </div>
			
			          <!-- 수정창 -->
			          <div class="table-responsive ups" style="display:none;" :id="'up' + rvo.rno">
			            <table class="table">
			              <tr>
			                <td>
			                  <textarea rows="4" cols="45" class="form-control" :id="'umsg' + rvo.rno">{{ rvo.msg }}</textarea>
			                </td>
			                <td style="width:90px;">
			                  <input type="button" value="수정"
			                         class="btn btn-primary btn-block"
			                         style="height:94px;"
			                         @click="replyUpdate(rvo.rno)">
			                </td>
			              </tr>
			            </table>
			          </div>
			
			          <!-- 대댓글창 -->
			          <div class="table-responsive ins" style="display:none;" :id="'in' + rvo.rno">
			            <table class="table">
			              <tr>
			                <td>
			                  <textarea rows="4" cols="45" class="form-control" :id="'imsg' + rvo.rno"></textarea>
			                </td>
			                <td style="width:90px;">
			                  <input type="button" value="댓글"
			                         class="btn btn-primary btn-block"
			                         style="height:94px;"
			                         @click="replyReplyInsert(rvo.rno)">
			                </td>
			              </tr>
			            </table>
			          </div>
			        </div>
			      </div>
			
			      <!-- 대댓글 -->
			      <ul class="children" v-if="rvo.group_step > 0" style="list-style: none;">
			        <li class="single_comment_area">
			          <div class="media comment-wrapper">
			            <div class="media-left">
			              <img :src="rvo.sex === '남자' ? '../images/man.png' : '../images/woman.png'"
			                   class="media-object img-circle"
			                   style="width:40px; height:40px;" alt="">
			            </div>
			            <div class="media-body">
			              <h5 class="media-heading">
			                {{ rvo.nickname }}
			                <small class="text-muted" style="margin-left: 10px;">{{ rvo.rgday }}</small>
			              </h5>
			              <p>{{ rvo.msg }}</p>
			
			              <div class="btn-group btn-group-xs" role="group">
			                <button v-if="sessionId === rvo.id"
			                        class="btn btn-danger update" style="margin-right: 5px; min-width: 50px;"
			                        :id="'u' + rvo.rno"
			                        @click="replyUpdateForm(rvo.rno)">Update</button>
			                <button v-if="sessionId === rvo.id"
			                        class="btn btn-info" style="margin-right: 5px; min-width: 50px;"
			                        @click="replyDelete(rvo.rno)">Delete</button>
			              </div>
			
			              <!-- 수정창 (대댓글용) -->
			              <div class="table-responsive ups" style="display:none;" :id="'up' + rvo.rno">
			                <table class="table">
			                  <tr>
			                    <td>
			                      <textarea rows="4" cols="45" class="form-control" :id="'umsg' + rvo.rno">{{ rvo.msg }}</textarea>
			                    </td>
			                    <td style="width:90px;">
			                      <input type="button" value="수정"
			                             class="btn btn-primary btn-block"
			                             style="height:94px;"
			                             @click="replyUpdate(rvo.rno)">
			                    </td>
			                  </tr>
			                </table>
			              </div>
			            </div>
			          </div>
			        </li>
			      </ul>
			    </li>
			  </ul>
			</div>
	      <!-- Leave A Comment -->
	      
	       <div class="leave-comment-area section_padding_50 clearfix" v-if="sessionId!==''">
	          <div class="comment-form">
	            <table class="table">
                  <tr>
                    <td>
                      <textarea rows="4" cols="45" class="form-control" ref="msg" v-model="msg"></textarea>
                    </td>
                    <td style="width:90px;">
                      <input type="button" value="리뷰 쓰기"
                             class="btn btn-primary btn-block"
                             style="height:94px;"
                             @click="replyInsert()">
                    </td>
                  </tr>	              
                </table>
	          </div>
	       </div>
	    </div>
	  </div>
	</div>
  </section>
  <script>
  let replyApp=Vue.createApp({
 	 data(){
 		 return {
 			 reply_list:[],
 			 no:parseInt('${vo.no}'),
 			 type:parseInt('${type}'),
 			 curpage:1,
 			 sessionId:'${sessionId}',
 			 totalpage:0,
 			 startPage:0,
 			 endPage:0,
 			 msg:'',
 			 upReply:false,
 			 inReply:false
 		 }
 	 },
 	 mounted(){
 		 this.reviewRecv()
 	 },
 	 methods:{
 		 updateReplyData(resData) {
	 		 this.reply_list = resData.list
	 		 this.curpage = resData.curpage
	 		 this.totalpage = resData.totalpage
	 		 this.startPage = resData.startPage
	 		 this.endPage = resData.endPage
 		 },
 		 replyDelete(rno){
   			axios.get('../review/delete_vue.do',{
 				params:{
 					rno:rno,
 					no:this.no,
 					type:this.type
 				}
 			}).then(res=>{
 				console.log(res.data)
 				this.updateReplyData(res.data)
 			}).catch(err=>{
 				console.log(err.response)
 			})
 			 
 		 },
 		 replyReplyInsert(rno){
 			let msg=$('#imsg'+rno).val()
 			if(msg.trim()==="")
 			{
	 			$('#imsg'+rno).focus()
	 			return
 			}	 
   			axios.post('../review/reply_insert_vue.do',null,{
 				params:{
 					pno:rno,
 					no:this.no,
 					type:this.type,
 					msg:msg
 				}
 			}).then(res=>{
 				console.log(res.data)
 				this.updateReplyData(res.data)
  				 $('#imsg'+rno).val("")
  				 $('#in'+rno).hide()
  				 $('#i'+rno).text("Reply")
 			}).catch(err=>{
 				console.log(err.response)
 			})
 		 },
 		 replyReplyInsertForm(rno){
  			$('.ins').hide()
 			$('.insert').text("Reply")
 			$('.ups').hide()
 			$('.update').text("Update")
 			if(this.inReply===false)
 			{
 				this.inReply=true
 				$('#in'+rno).show()
 				$('#i'+rno).text("Cancel")
 			}
 			else
 			{
 				this.inReply=false
 				$('#in'+rno).hide()
 				$('#i'+rno).text("Reply")
 			}	
  		 },
 		 replyUpdate(rno){
 			let msg=$('#umsg'+rno).val()
 			if(msg.trim()==="")
 			{
				$('#umsg'+rno).focus() 
				return
 			} 
  			axios.post('../review/update_vue.do',null,{
 				params:{
 					rno:rno,
 					no:this.no,
 					type:this.type,
 					msg:msg
 				}
 			}).then(res=>{
 				console.log(res.data)
 				this.updateReplyData(res.data)
  				 $('#umsg'+rno).val("")
  				 $('#up'+rno).hide()
  				 $('#u'+rno).text("Update")
 			}).catch(err=>{
 				console.log(err.response)
 			})
 		 },
 		 replyUpdateForm(rno){
 			$('.ins').hide()
 			$('.insert').text("Reply")
 			$('.ups').hide()
 			$('.update').text("Update")
 			if(this.upReply===false)
 			{
 				this.upReply=true
 				$('#up'+rno).show()
 				$('#u'+rno).text("Cancel")
 			}
 			else
 			{
 				this.upReply=false
 				$('#up'+rno).hide()
 				$('#u'+rno).text("Update")
 			}	
 		 },
 		 replyInsert(){
 			if(this.msg==='')
 			{
 				this.$refs.msg.focus()
 				return
 			}	
 			axios.post('../review/insert_vue.do',null,{
 				params:{
 					no:this.no,
 					type:this.type,
 					msg:this.msg
 				}
 			}).then(res=>{
 				console.log(res.data)
 				this.updateReplyData(res.data)
  				this.msg=''
 			}).catch(err=>{
 				console.log(err.response)
 			})
 		 },
 		 reviewRecv(){
			axios.get("../review/list_vue.do",{
				params:{
					page:this.curpage,
					no:this.no,
					type:this.type
				}
			}).then(res=>{
				console.log(res.data)
				this.updateReplyData(res.data)
			}).catch(err=>{
				console.log(err.response)
			})	
		 }
 	 }
  }).mount("#replyApp")
  </script>
</body>
</html>