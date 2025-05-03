<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/category.js"></script>
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
	  <div class="category-menu mb-4">
		  <div id="category-container"></div>		
		  
		  <div class="text-center text-success mt-3" style="cursor:pointer;">
		    <strong>카테고리 닫기 ↑</strong>
		  </div>
	  </div>
	  <div class="mb-4">
    	<h5>총 <span class="text-success">245,816</span>개의 맛있는 레시피가 있습니다.</h5>
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
	<script>
	  const container = document.getElementById("category-container");
		
	  Object.entries(categories).forEach(([title, items], idx) => {
	    const divRow = document.createElement("div");
	    divRow.classList.add("row","align-items-center","mb-2");
	    if(title==="테마별")
	    	divRow.classList.add("mt-3");
	
	    const divKind = document.createElement("div");
	    divKind.innerText = title;
	    divKind.classList.add("col-1-20","font-weight-bold","text-success");
	    divRow.appendChild(divKind);
	
	    const divItems = document.createElement("div");
	    divItems.classList.add("col-19-20","cate-list","d-flex","flex-wrap","align-items-center");
	    
	    items.forEach(item => {
	    	  const label = document.createElement("label");
	    	  label.classList.add("d-inline-block","mr-3");	    
	    	  const checkbox = document.createElement("input");
	    	  
			    checkbox.type = "checkbox";
			    checkbox.value = item.code;
			    checkbox.name = `cat${idx}`;
			    checkbox.addEventListener("change", () => {
			      goSearchRecipe(`cat${idx}`, item.code);  // 필요 시 동작 조절
	    		});
	
		    label.appendChild(checkbox);
		    label.append(" " + item.name);
		    divItems.appendChild(label);
		});
	
	    divRow.appendChild(divItems);
	    container.appendChild(divRow);
	  });
	
	</script>	

</body>
</html>