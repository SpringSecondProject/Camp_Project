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
	      <img :src="vo.poster" class="img-responsive center-block crop-height-300">
	      <h2 class="text-primary" style="margin-top:20px;">${vo.title }</h2>
	      <p class="text-muted">${vo.content }</p>
	    </div>
	  </div>
	
	  <!-- 아이콘 3개 -->
	  <div class="row text-center" style="margin-bottom: 20px;">
	    <div class="col-sm-4">
	      <img src="../images/icon/recipe/a1.png" class="img-responsive center-block" style="height:50px;">
	      <p class="text-muted">${vo.cook_portion }}</p>
	    </div>
	    <div class="col-sm-4">
	      <img src="../images/icon/recipe/a2.png" class="img-responsive center-block" style="height:50px;">
	      <p class="text-muted">${vo.cook_time }}</p>
	    </div>
	    <div class="col-sm-4">
	      <img src="../images/icon/recipe/a3.png" class="img-responsive center-block" style="height:50px;">
	      <p class="text-muted">${vo.cook_level }}</p>
	    </div>
	  </div>
	
	  <!-- 재료 -->
	  <div class="panel panel-default">
	    <div class="panel-heading"><h4 class="panel-title">[ 재료 ]</h4></div>
	    <div class="panel-body">
	      <ul class="list-unstyled" style="column-count: 2;">
	        <li v-for="d in materials" class="text-muted">
	        	<span class="glyphicon glyphicon-leaf"></span> {{ d }}
	        </li>
	      </ul>
	    </div>
	  </div>
	
	  <!-- 조리 순서 -->
	  <div class="panel panel-default">
	    <div class="panel-heading"><h4 class="panel-title">[ 조리 순서 ]</h4></div>
	    <div class="panel-body">
	      <div v-for="(m, index) in mlist" class="row" style="margin-bottom:15px;">
	        <div class="col-sm-8">
	          <strong>{{ index + 1 }}.</strong> {{ m }}
	        </div>
	        <div class="col-sm-4 text-right">
	          <img :src="ilist[index]" class="img-thumbnail crop-height-150">
	        </div>
	      </div>
	    </div>
	  </div>
	
	  <!-- 작성자 정보 -->
	  <div class="panel panel-default">
	    <div class="panel-heading"><h4 class="panel-title">[ 레시피 작성자 ]</h4></div>
	    <div class="panel-body">
	      <div class="media">
	        <div class="media-left">
	          <img :src="vo.chef_poster" class="img-circle media-object" style="width:80px; height:80px;">
	        </div>
	        <div class="media-body">
	          <h5 class="media-heading">${vo.chef }}</h5>
	          <p class="text-muted"><small>${vo.chef_comment }}</small></p>
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
	          <ol>
	              <!-- Single review Area -->
	              <li class="single_comment_area" v-for="rvo in reply_list">
	                  <div class="comment-wrapper d-flex" v-if="rvo.group_step===0">
	                      <!-- Comment Meta -->
	                      <div class="comment-author">
	                          <img :src="rvo.sex==='남자'?'../img/man.png':'../img/woman.png'" alt="">
	                      </div>
	                      <!-- Comment Content -->
	                      <div class="comment-content">
	                          <span class="comment-date text-muted">{{rvo.dbday}}</span>
	                          <h5>{{rvo.username}}</h5>
	                          <p>{{rvo.msg}}</p>
	                          <button v-if="sessionId===rvo.userid" class="btn-xs btn-danger update" style="margin-left: 2px" :id="'u'+rvo.rno" @click="replyUpdateForm(rvo.rno)">Update</button>
	                          <button v-if="sessionId===rvo.userid" class="btn-xs btn-info" style="margin-left: 2px" @click="replyDelete(rvo.rno)">Delete</button>
	                          <button v-if="sessionId!==''" class="btn-xs btn-success insert" style="margin-left: 2px" :id="'i'+rvo.rno" @click="replyReplyInsertForm(rvo.rno)">Reply</button>
	                          <%-- 수정창 --%>
	                          <table class="table ups" style="display:none" :id="'up'+rvo.rno">
				                  <tr>
				                   <td>
				                    <textarea rows="4" cols="45" style="float: left" :id="'umsg'+rvo.rno">{{rvo.msg}}</textarea>
				                    <input type="button" value="수정"
				                     style="float: left;background-color: blue;color:white;width: 80px;height: 94px"
				                      @click="replyUpdate(rvo.rno)"
				                     >
				                   </td>
				                  </tr>
			                  </table>
	                          <%-- 대댓글창 --%>
	                          <table class="table ins" style="display:none" :id="'in'+rvo.rno">
				                  <tr>
				                   <td>
				                    <textarea rows="4" cols="45" style="float: left" :id="'imsg'+rvo.rno"></textarea>
				                    <input type="button" value="댓글"
				                     style="float: left;background-color: blue;color:white;width: 80px;height: 94px"
				                      @click="replyReplyInsert(rvo.rno)"
				                     >
				                   </td>
				                  </tr>
			                  </table>
	                      </div>
	                  </div>
	                  <ol class="children" v-if="rvo.group_step>0">
	                      <li class="single_comment_area">
	                          <div class="comment-wrapper d-flex">
	                              <!-- Comment Meta -->
	                              <div class="comment-author">
	                            <img :src="rvo.sex==='남자'?'../img/man.png':'../img/woman.png'" alt="">
	                        </div>
	                        <!-- Comment Content -->
	                        <div class="comment-content">
	                            <span class="comment-date text-muted">{{rvo.dbday}}</span>
	                            <h5>{{rvo.username}}</h5>
	                            <p>{{rvo.msg}}</p>
	                            <button v-if="sessionId===rvo.userid" class="btn-xs btn-danger update" style="margin-left: 2px" :id="'u'+rvo.rno" @click="replyUpdateForm(rvo.rno)">Update</button>
	                                  <button v-if="sessionId===rvo.userid" class="btn-xs btn-info" style="margin-left: 2px" @click="replyDelete(rvo.rno)">Delete</button>
	                            <table class="table ups" style="display:none" :id="'up'+rvo.rno">
	                    <tr>
	                     <td>
	                      <textarea rows="4" cols="45" style="float: left" :id="'umsg'+rvo.rno">{{rvo.msg}}</textarea>
	                      <input type="button" value="수정"
	                       style="float: left;background-color: blue;color:white;width: 80px;height: 94px"
	                        @click="replyUpdate(rvo.rno)"
	                       >
	                     </td>
	                    </tr>
	                   </table>
	                        </div>
	                          </div>
	                      </li>
	                  </ol>
	              </li>
	              
	          </ol>
	      </div>
	      <!-- Leave A Comment -->
	      
	       <div class="leave-comment-area section_padding_50 clearfix" v-if="sessionId!==''">
	          <div class="comment-form">
	              <table class="table">
	               <tr>
	                <td>
				    <div style="display: flex; align-items: stretch; gap: 1px;">
				      <textarea rows="4" cols="70" ref="msg" v-model="msg"
				        style="resize: none; flex: 1;">
				      </textarea>
				      <input type="button" value="댓글 쓰기"
				        @click="replyInsert()"
				        style="background-color: blue; color: white; width: 85px; height: 63px;">
				    </div>
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
  let listApp=Vue.createApp({
  	data(){
  		return {
			no:parseInt('${vo.no}'),
			vo:{},
			mlist:[],
			ilist:[],
			materials:[]			
  		}
  	},
  	mounted(){
  		this.dataRecv()
  	},
  	methods:{
		dataRecv() {
		  axios.get('../recipe/recipe_detail_vue.do',{
			params:{
				no:this.no
			}
		  }).then(res=>{
			console.log(res)
			this.vo=res.data.vo
			this.mlist=res.data.mlist
			this.ilist=res.data.ilist
			this.materials=res.data.materials;
		  }).catch(err=>{
     		console.log(err.response);
		  })
		}
  	}
  }).mount("#listApp")
  
  let replyApp=Vue.createApp({
 	 data(){
 		 return {
 			 reply_list:[],
 			 cno:parseInt(${no}),
 			 type:2,
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
 		 this.commentRecv()
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
 					no:this.cno,
 					type:this.type
 				}
 			}).then(res=>{
 				console.log(res.data)
  				 // res.data=Map {list=[],curpage:1....}
 				updateReplyData(res.data)
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
 					no:this.cno,
 					type:this.type,
 					msg:msg
 				}
 			}).then(res=>{
 				console.log(res.data)
  				 // res.data=Map {list=[],curpage:1....}
 				updateReplyData(res.data)
  				 $('#imsg'+rno).val("")
  				 // textarea
  				 $('#in'+rno).hide()
  				 // table
  				 $('#i'+rno).text("Reply")
  				 // Button
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
 					no:this.cno,
 					type:this.type,
 					msg:msg
 				}
 			}).then(res=>{
 				console.log(res.data)
  				 // res.data=Map {list=[],curpage:1....}
 				updateReplyData(res.data)
  				 $('#umsg'+rno).val("")
  				 // textarea
  				 $('#up'+rno).hide()
  				 // table
  				 $('#u'+rno).text("Update")
  				 // Button
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
 					no:this.cno,
 					type:this.type,
 					msg:this.msg
 				}
 			}).then(res=>{
 				console.log(res.data)
 				updateReplyData(res.data)
  				this.msg=''
 			}).catch(err=>{
 				console.log(err.response)
 			})
 		 },
 		 commentRecv(){
			axios.get("../review/list_vue.do",{
				params:{
					page:this.curpage,
					no:this.cno,
					type:this.type
				}
			}).then(res=>{
				console.log(res.data)
				// res.data=Map {list=[],curpage:1....}
				updateReplyData(res.data)
				 
			}).catch(error=>{
				console.log(error.response)
			})
 		 }
 	 }
  }).mount("#replyApp")
  </script>
</body>
</html>