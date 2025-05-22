<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	height: 200px;             /* 원하는 높이로 조절 */
  	object-fit: cover;         /* 이미지가 잘리더라도 꽉 채움 */
  	border-top-left-radius: calc(.25rem - 1px); 
  	border-top-right-radius: calc(.25rem - 1px) 
  }
  .no-padding {
    padding-left: 5px !important;
    padding-right: 5px !important;
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

    <!-- 검색 메뉴 -->
    <div class="row mb-4">
      <div class="col-md-3">
        <div class="form-group">
          <label for="typeSelect">분류</label>
          <select v-model="type" id="typeSelect" class="form-control">
            <c:forEach var="entry" items="${findtype}">
              <option value="${entry.key}">${entry.value}</option>
            </c:forEach>
          </select>
        </div>
      </div>
      <div class="col-md-9">
        <div class="form-group">
          <label for="searchInput">검색어</label>
          <input v-model="fd" id="searchInput" type="text" class="form-control" placeholder="검색어를 입력하세요" />
        </div>
      </div>
    </div>

    <!-- 검색 결과 요약 -->
    <div class="row mb-3">
      <div class="col-md-12 text-primary">
        <h4>
          총 <span class="text-success">{{ count }}</span>개의 맛있는 레시피가 있습니다.
        </h4>
      </div>
    </div>

    <!-- 레시피 카드 목록 -->
    <div class="row">
      <div class="col-md-3 mb-4 no-padding" v-for="vo in list" :key="vo.no">
        <div class="thumbnail">
          <a :href="'../recipe/recipe_detail.do?no=' + vo.no">
            <img :src="vo.poster" alt="레시피 이미지" style="width:100%; height:180px; object-fit:cover;">
          </a>
          <div class="caption">
            <h5 class="text-truncate">{{ vo.title }}</h5>
            <p class="text-muted" style="font-size: 13px;">by {{ vo.chef }}</p>
          </div>
        </div>
      </div>
    </div>

    <!-- 페이지네이션 -->
    <div class="row">
      <div class="col-md-12 text-center">
        <ul class="pagination">
          <li v-if="startPage > 1">
            <a href="#" @click.prevent="prev()">&laquo;</a>
          </li>
          <li v-for="i in pageRange(startPage, endPage)"
              :class="{ 'active': i === curpage }">
            <a href="#" @click.prevent="changePage(i)">{{ i }}</a>
          </li>
          <li v-if="endPage < totalpage">
            <a href="#" @click.prevent="next()">&raquo;</a>
          </li>
        </ul>
      </div>
    </div>

  </div>
</section>
	<script src="../js/category.js"></script>
    <script>
    let listApp=Vue.createApp({
	  data() {
	    return {
			list:[],
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0,
			count:0,
			findtype:[],
			fd:'',
			ss:'',
			defaultType:''
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
