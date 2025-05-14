<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	      <h2 class="text-primary" style="margin-top:20px;">{{ vo.title }}</h2>
	      <p class="text-muted">{{ vo.content }}</p>
	    </div>
	  </div>
	
	  <!-- 아이콘 3개 -->
	  <div class="row text-center" style="margin-bottom: 20px;">
	    <div class="col-sm-4">
	      <img src="../images/icon/recipe/a1.png" class="img-responsive center-block" style="height:50px;">
	      <p class="text-muted">{{ vo.cook_portion }}</p>
	    </div>
	    <div class="col-sm-4">
	      <img src="../images/icon/recipe/a2.png" class="img-responsive center-block" style="height:50px;">
	      <p class="text-muted">{{ vo.cook_time }}</p>
	    </div>
	    <div class="col-sm-4">
	      <img src="../images/icon/recipe/a3.png" class="img-responsive center-block" style="height:50px;">
	      <p class="text-muted">{{ vo.cook_level }}</p>
	    </div>
	  </div>
	
	  <!-- 재료 -->
	  <div class="panel panel-default">
	    <div class="panel-heading"><h4 class="panel-title">[ 재료 ]</h4></div>
	    <div class="panel-body">
	      <ul class="list-unstyled" style="column-count: 2;">
	        <li v-for="d in materials" class="text-muted"><span class="glyphicon glyphicon-leaf"></span> {{ d }}</li>
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
	          <h5 class="media-heading">{{ vo.chef }}</h5>
	          <p class="text-muted"><small>{{ vo.chef_comment }}</small></p>
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
			no:${no},
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
  </script>
  
</body>
</html>