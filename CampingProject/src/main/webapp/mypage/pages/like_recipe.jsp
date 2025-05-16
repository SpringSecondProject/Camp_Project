<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>

<style>
.addr {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	display: block;
}
</style>
</head>
<body class="config">
	<div class="shop-p__tool-style">
		<div class="tool-style__group u-s-m-b-8">
			<form>
				<div class="tool-style__form-wrap">
					<div class="u-s-m-b-8">
						<select class="select-box select-box--transparent-b-2"
							onchange="location.href=this.value">
							<option value="/web/like/likeList.do" ${page eq '../mypage/pages/like.jsp' ? 'selected' : ''}>캠핑장</option>
							<option value="/web/like/itemList.do" ${page eq '../mypage/pages/like_item.jsp' ? 'selected' : ''}>쇼핑몰</option>
							<option value="/web/like/recipeList.do" ${page eq '../mypage/pages/like_recipe.jsp' ? 'selected' : ''}>레시피</option>
							<option>커뮤니티</option>
						</select>
					</div>

				</div>
			</form>
			<img class="preloader__img" src="images/preloader.png" alt="">
		</div>
	</div>

	<!--====== Main App ======-->
	<div id="app">
		<!--====== App Content ======-->
		<div class="app-content">
			<!--====== Section 1 ======-->
			<div class="u-s-p-y-10">
				<div class="container">
					<div class="blog-m">
						<div class="row blog-m-init">
							<c:forEach var="recipe" items="${likeList}">
								<div class="blog-m__element">
									<div class="bp-mini">
										<div class="bp-mini__thumbnail text-center">
											<img src="${recipe.poster}"
												style="width: 100%; height: 180px;" />
										</div>
										<div class="bp-mini__content">
											<span class="bp-mini__h1"><a href="#">${recipe.title}</a></span>
											<div class="blog-t-w">
												<a class="gl-tag btn--e-transparent-hover-brand-b-2"
													href="#">레시피 보기</a> <a
													class="gl-tag btn--e-transparent-hover-brand-b-2" href="#">삭제하기</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<nav class="post-center-wrap u-s-p-y-60">

						<!--====== Pagination ======-->
						<ul class="blog-pg">
							<li class="blog-pg--active"><a href="blog-masonry.html">1</a></li>
							<li><a href="blog-masonry.html">2</a></li>
							<li><a href="blog-masonry.html">3</a></li>
							<li><a href="blog-masonry.html">4</a></li>
							<li><a class="fas fa-angle-right" href="blog-masonry.html"></a></li>
						</ul>
						<!--====== End - Pagination ======-->
					</nav>
				</div>
			</div>
			<!--====== End - Section 1 ======-->
		</div>
		<!--====== End - App Content ======-->
	</div>
</body>

