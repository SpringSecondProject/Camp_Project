<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
<link href="../css/chef_list.css" rel="stylesheet">
</head>
<body>
    <!-- ****** Archive Area Start ****** -->
    <section class="archive-area section_padding_80" id="listApp">
        <div class="container">
            <div class="row">
				<div class="d-flex align-items-center mb-3">
				    <div class="btn-group">
				        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" >
				            <i class="fas fa-bars"></i> {{ selectedText }}
				        </button>
				        <ul class="dropdown-menu">
				            <li><a class="dropdown-item" href="#" @click="selectItem('소식받기순위', 'fcount')">소식받기순위</a></li>
				            <li><a class="dropdown-item" href="#" @click="selectItem('조회순위', 'wcount')">조회순위</a></li>
				            <li><a class="dropdown-item" href="#" @click="selectItem('스크랩순위', 'scount')">스크랩순위</a></li>
				            <li><a class="dropdown-item" href="#" @click="selectItem('레시피순위', 'rcount')">레시피순위</a></li>
				        </ul>
				    </div>
			    </div>
			</div>
            <div class="row">
                <!-- Single Post -->
				<div class="chef_list_in">
				  <div class="list_lump" v-for="(vo, index) in list" :key="vo.no">
				    
				    <!-- 랭킹 부분 -->
				    <div class="list_ranking">
				      <h2>{{ (curpage-1)*rowSize + index+1 }}</h2>
				    </div>
				    
				    <!-- 셰프 이미지 -->
				    <div class="list_mem">
				      <a :href="'../recipe/chefs_recipe.do?chef=' + vo.chef" class="mem_pic">
				        <img :src="vo.poster" alt="셰프 이미지">
				      </a>
				    </div>
				    
				    <!-- 셰프 정보 -->
				    <div class="list_cont">
				      <div class="chef_name_box">
				        <a :href="'../recipe/chefs_recipe.do?chef=' + vo.chef" class="chef_name">{{ vo.chef }}</a>
				        <button type="button" class="btn btn-default btn-sm follow_btn">
				          <span class="glyphicon glyphicon-plus"></span> 소식받기
				        </button>
				      </div>
				
				      <!-- 아이콘 + 숫자 부분 -->
				      <div class="chef_count_box">
				        <span><i class="fas fa-utensils"></i> {{ vo.rcount.toLocaleString() }}</span>
				        <span><i class="fas fa-paperclip"></i> {{ vo.scount.toLocaleString() }}</span>
				        <span><i class="fas fa-eye"></i> {{ vo.wcount.toLocaleString() }}</span>
				        <span><i class="fas fa-user"></i> {{ vo.fcount.toLocaleString() }}</span>
				      </div>
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
    			list:[],
    			curpage:1,
    			totalpage:0,
    			startPage:0,
    			endPage:0,
    			rowSize:0,
                selectedText:'소식받기순위',  // 기본 선택된 텍스트
                selectedValue:'fcount'  // 기본 선택된 값      			
    		}
    	},
    	mounted(){
    		this.dataRecv()
    	},
    	methods:{
            selectItem(text, value) {
                this.selectedText = text;  // 드롭다운에서 선택된 텍스트
                this.selectedValue = value;  // 드롭다운에서 선택된 값
                console.log('선택된 값:', this.selectedValue);  // 콘솔에 선택된 값 출력
                this.curpage=1
                this.dataRecv()
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
    			axios.get('../chef/list_vue.do',{
    				params:{
    					page:this.curpage,
    					fd:this.selectedValue
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