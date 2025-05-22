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
						<select class="select-box select-box--transparent-b-2" onchange="location.href=this.value">
							<option value="/web/like/likeList.do" ${page eq '../mypage/pages/like.jsp' ? 'selected' : ''}>캠핑장</option>
							<option value="/web/like/itemList.do" ${page eq '../mypage/pages/like_item.jsp' ? 'selected' : ''}>쇼핑몰</option>
						</select>
					</div>

				</div>
			</form>
		</div>
	</div>

	<!--====== Main App ======-->
	<div id="ItemLikeApp">
		<!--====== App Content ======-->
		<div class="app-content">
			<!--====== Section 1 ======-->
			<div class="u-s-p-y-10">
				<div class="container">
					<div class="blog-m">
						<div class="row blog-m-init">
							<c:forEach var="item" items="${likeList}">
								<div class="blog-m__element">
									<div class="bp-mini">
										<div class="bp-mini__thumbnail text-center">
											<img src="https://www.ocamall.com${item.poster}" style="width: 100%; height: 180px;" />
										</div>
										<div class="bp-mini__content">
											<span class="bp-mini__h1 addr"><a href="../item/detail.do?ino=${item.ino}">${item.name}</a></span>
											<span class="bp-mini__stat-wrap">
												<span class="bp-mini__preposition addr">브랜드 : ${item.brand}</span>
												<span class="bp-mini__preposition addr">종류 : ${item.type}</span>
												<span class="bp-mini__preposition addr" style="color: #4285F4;">가격 : ${item.price}%</span>
											</span>
											<div class="blog-t-w">
												<a class="gl-tag btn--e-transparent-hover-brand-b-2" href="../item/detail.do?ino=${item.ino}">구매하기</a> 
												<a class="gl-tag btn--e-transparent-hover-brand-b-2" @click.prevent="deleteLike(${item.ino })">삭제하기</a>
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
						  <c:if test="${startPage > 1}">
						    <li>
						      <a class="fas fa-angle-left" href="likeList.do?page=${startPage - 1}"></a>
						    </li>
						  </c:if>
						
						  <c:forEach var="i" begin="${startPage}" end="${endPage}">
						    <li class="${i == curpage ? 'blog-pg--active' : ''}">
						      <a href="likeList.do?page=${i}">${i}</a>
						    </li>
						  </c:forEach>
						
						  <c:if test="${endPage < totalpage}">
						    <li>
						      <a class="fas fa-angle-right" href="likeList.do?page=${endPage + 1}"></a>
						    </li>
						  </c:if>
						</ul>
						<!--====== End - Pagination ======-->
					</nav>
				</div>
			</div>
			<!--====== End - Section 1 ======-->
		</div>
		<!--====== End - App Content ======-->
	</div>
	<script>
	let ItemLike=Vue.createApp({
		data(){
			return{
				
			}
		},
		methods:{
			deleteLike(ino){
				axios.post("../like/delete_vue.do",null,{
					params:{
						no:ino,
						type:1
					}
				}).then(res=>{
					location.reload();
				}).catch(error=>{
					console.log(error.response)
				})
			}			
		},
		mounted(){
			
		}	
	}).mount("#ItemLikeApp")
	</script>
</body>

