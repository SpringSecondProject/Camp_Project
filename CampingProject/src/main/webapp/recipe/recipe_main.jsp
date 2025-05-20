<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 방문한 상품</title>
<style>
  .col-7 {
    width: 10px;
    height: 10px;
    object-fit: contain;
    border: 1px solid #eee;
    margin-bottom: 10px;
  }
</style>
</head>
<body>
    <!--====== App Content ======-->
    <div class="app-content">

        <!--====== Section 1 ======-->
        <div class="u-s-p-y-90">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-md-12">
				    <!-- ****** Categories Area Start ****** -->
					<jsp:include page="${recipe_jsp }"></jsp:include>

					</div>

				    <!-- ****** Aside Area Start ****** -->
                    <div class="col-lg-3 col-md-12">
                        <div class="shop-w-master">
                            <h1 class="shop-w-master__heading u-s-m-b-30"><i class="fas fa-filter u-s-m-r-8"></i>

                                <span>FILTERS</span></h1>
                            <div class="shop-w-master__sidebar sidebar--bg-snow">
	                        </div>
                            
						<jsp:include page="recipe_cookie.jsp" />
                        </div>
					</div>
                                                
				</div>
			</div>
		</div>
	</div>
</body>
</html>