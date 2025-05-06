<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
<link href="../css/chef_list.css" rel="stylesheet">
<style>
  .category-menu { background: #f8f9fa; padding: 15px; }
  .category-menu h6 { margin-top: 10px; }
  .recipe-card img { width: 100%; height: 200px; object-fit: cover; }
  .recipe-card { margin-bottom: 30px; }
  .recipe-meta { font-size: 0.9rem; color: #666; }
  .h-100 { height: 100%!important }
  .card-body{-ms-flex:1 1 auto;flex:1 1 auto;padding:1.25rem}
  .card-img-top{ width:100%; border-top-left-radius: calc(.25rem - 1px); border-top-right-radius: calc(.25rem - 1px) }
  .card-title{margin-bottom:.75rem}
  .card-text:last-child{margin-bottom:0}
  .text-truncate{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
  .text-muted{color:#868e96!important}
</style>
</head>
<body>
    <!-- ****** Archive Area Start ****** -->
    <section class="archive-area section_padding_80" id="listApp">
		<div class="container mt-4">
		  <div class="row">
		    <div class="col-md-3 mb-4" v-for="vo in list" :key="vo.no">
		      <div class="card h-100">
		        <a :href="'../recipe/detail.do?no=' + vo.no">
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
    <script>
    listApp=Vue.createApp({
    	data(){
    		return {
    			chef:'${param.chef}',
    			list:[],
    			curpage:1,
    			totalpage:0,
    			startPage:0,
    			endPage:0,
    			rowSize:0
    		}
    	},
    	mounted(){
    		this.dataRecv()
    	},
    	methods:{
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
    			axios.get('../chef/chef_recipe_vue.do',{
    				params:{
    					page:this.curpage,
    					chef:this.chef
    				}
    			}).then(res=>{
    				console.log(res.data)
    				this.list=res.data.list
    				this.curpage=res.data.curpage
    				this.totalpage=res.data.totalpage
    				this.startPage=res.data.startPage
    				this.endPage=res.data.endPage
    				this.rowSize=res.data.rowSize
    			}).catch(err=>{
    				console.log(err.response)
    			})	
    		}
    	}
    }).mount("#listApp")
    </script>
</body>
</html>