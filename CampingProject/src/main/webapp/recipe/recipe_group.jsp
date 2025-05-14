<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 분류</title>
<!-- 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 -->
<link href="../css/recipe.css" rel="stylesheet">
<style type="text/css">
  .col-title { width: 6%; float: left; }
  .col-items { width: 94%; float: left; }
  .mb-2 {
  	margin-bottom: 2px;
  }
  .mt-4 {
  	margin-top: 6px;
  }
  .mr-3 {
  	margin-right: 10px;
  }
  .pl-3 {
  	padding-left: 10px;
  }
  .h-100 { height: 100%!important }
  .card-body{-ms-flex:1 1 auto;flex:1 1 auto;padding:1.25rem}
  .card-img-top{ 
  	width:100%; 
	height: 250px;             /* 원하는 높이로 조절 */
  	object-fit: cover;         /* 이미지가 잘리더라도 꽉 채움 */
  	border-top-left-radius: calc(.25rem - 1px); 
  	border-top-right-radius: calc(.25rem - 1px) 
  }
  .card-title{margin-bottom:.75rem}
  .card-text:last-child{margin-bottom:0}
  .text-truncate{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
  .text-muted{color:#868e96!important}  
</style>
</head>
<body>  
    <section class="archive-area section_padding_80" id="listApp">
	<div class="container mt-4">
	  
	  <!-- 카테고리 메뉴 -->
	  <div class="category-menu mb-1" style="font-size: 14px;">
          <div id="category-container" class="pl-3">
            <div v-for="(items, title, idx) in categories" :key="idx" 
            	class="row align-items-center mb-2" :class="{'mt-4':title==='테마별'}">
              <div class="col-title font-weight-bold text-success">{{ title }}</div>
              <div class="col-items cate-list d-flex flex-wrap align-items-center">
                <label v-for="item in items" :key="item.code" class="d-inline-block mr-3">
                  <input type="checkbox" :value="item.code" :name="'cat'+idx" 
                  		@change="handleCheckboxChange(idx,item.code)" />
                  {{ item.name }}
                </label>
              </div>
            </div>
          </div>	
		  
		  <div class="text-center text-success mt-3" style="cursor:pointer;">
		    <strong>카테고리 닫기 ↑</strong>
		  </div>
	  </div>
	  <div class="mt-4 mb-4 text-primary">
    	<h4>총 <span class="text-success">{{count}}</span>개의 맛있는 레시피가 있습니다.</h5>
  	  </div>
  	  
	  <!-- 레시피 카드 목록 -->
	  <div class="row">
	    <div class="col-md-3 mb-4" v-for="vo in list" :key="vo.no">
	      <div class="card h-100">
	        <a :href="'../recipe/recipe_detail.do?no=' + vo.no">
	          <img :src="vo.poster" class="card-img-top" alt="레시피 이미지">
	        </a>
	        <div class="card-body p-2">
	          <h6 class="card-title text-truncate">{{ vo.title }}</h6>
	          <p class="card-text text-muted mb-0" style="font-size: 13px;">by {{ vo.chef }}</p>
	        </div>
	      </div>
	    </div>
	    
        <div class="col-12">
             <div class="pagination-area d-sm-flex mt-15">
			<nav class="text-center">
			<ul class="pagination">
				<li class="page-item" v-if="startPage>1">
					<a href="#" @click="prev()">&laquo;</a>
				</li>
				<li  v-for="i in pageRange(startPage,endPage)" :class="i==curpage?'page-item active':'page-item'">
					<a href="#" @click="changePage(i)">{{i}}</a>
				</li>
				<li class="page-item" v-if="endPage<totalpage">
					<a href="#" @click="next()">&raquo;</a>
				</li>
			</ul>
			</nav>
             </div>
           </div>
        </div>

	</div>
	</section>
	<script src="../js/category.js"></script>
    <script>
    let listApp=Vue.createApp({
	  data() {
	    return {
	      categories: categories,
	      selectedCodes: {},
			list:[],
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0,
			count:0
	    };
      },
  	  mounted(){
  		this.dataRecv()
  	  },
      methods: {
        onSearch() {
          // selectedCodes를 기반으로 fetch 등으로 검색 요청
          console.log("검색할 코드들:", this.selectedCodes);
          // 예시:
          // fetch(`/search?cat1=101&cat2=202`) 식으로 처리 가능
        },
		pageRange(start,end){
			let range=end-start
			let arr=[]
			for(let i=0;i<=range;i++)
			{
				arr[i]=start+i
			}
			return arr
		},
		prev(){
			this.curpage=this.startPage-1
			this.dataRecv()
		},
		next(){
			this.curpage=this.endPage+1
			//alert(this.curpage)
			this.dataRecv()
		},
		changePage(page){
			this.curpage=page
			this.dataRecv()
		},
		dataRecv()
		{
			axios.get('../recipe/recipe_list_vue.do',{
				params:{
					page:this.curpage,
				}
			}).then(res=>{
				console.log(res.data)
				this.list=res.data.list
				this.curpage=res.data.curpage
				this.totalpage=res.data.totalpage
				this.startPage=res.data.startPage
				this.endPage=res.data.endPage
				this.count=res.data.count
			}).catch(err=>{
				console.log(err.response)
			})	
		}
        
      }		
	}).mount("#listApp")
	</script>	

</body>
</html>
