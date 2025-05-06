<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
  .col-1-20 { width: 5%; float: left; }
  .col-19-20 { width: 95%; float: left; }
  .row {
	  display: flex;
	  align-items: center; /* 수직 정렬 */
  }
  label {
	  display: inline-flex;
	  align-items: center;
	  vertical-align: middle;
	  line-height: 1.5;
  }
</style>
</head>
<body>
    <section class="archive-area section_padding_80" id="listApp">
	<div class="container">
	  
	  <!-- 카테고리 메뉴 -->
	  <div class="category-menu mb-1">
          <div id="category-container">
            <div v-for="(items, title, idx) in categories" :key="idx" 
            	class="row align-items-center mb-2" :class="{'mt-3':title==='테마별'}">
              <div class="col-1-20 font-weight-bold text-success">{{ title }}</div>
              <div class="col-19-20 cate-list d-flex flex-wrap align-items-center">
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
	  <div class="mb-4">
    	<h5>총 <span class="text-success">888,777</span>개의 맛있는 레시피가 있습니다.</h5>
  	  </div>
  	  
	  <!-- 레시피 카드 목록 -->
	  <div class="row">
	    <!-- 레시피 카드 1 -->
	    <div class="col-md-3">
	      <div class="card recipe-card">
	        <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="마늘버터 파스타">
	        <div class="card-body">
	          <h6 class="card-title">마늘 버터 파스타 만들기</h6>
	          <p class="recipe-meta">쿠킹연수★ | 조회수 76</p>
	        </div>
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
	      selectedCodes: {}
	    };
      },
      methods: {
        onSearch() {
          // selectedCodes를 기반으로 fetch 등으로 검색 요청
          console.log("검색할 코드들:", this.selectedCodes);
          // 예시:
          // fetch(`/search?cat1=101&cat2=202`) 식으로 처리 가능
        }
      }		
	}).mount("#listApp")
	</script>	

</body>
</html>
