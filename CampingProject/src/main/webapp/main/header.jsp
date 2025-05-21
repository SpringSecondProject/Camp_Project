<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
	<title></title>
	<script type="text/javascript">
      $(function () {
        $('#sample a').attr("target", "_blank")
      })
	</script>
</head>
<body>
<!--====== Main Header ======-->
<header id="headerApp" class="header--style-2">

	<!--====== Nav 1 ======-->
	<nav class="primary-nav-wrapper">
		<div class="container">

			<!--====== Primary Nav ======-->
			<div class="primary-nav">

				<!--====== Main Logo ======-->

				<a id="main-logo-wrap" class="main-logo"
				   href="../main/main.do">
					<img src="../assets/icons/main-logo.svg"
					     alt="" id="main-logo">
				</a>
				<!--====== End - Main Logo ======-->

				<!--====== Dropdown Main plugin ======-->
				<div class="menu-init" id="navigation">

					<button class="btn btn--icon toggle-button toggle-button--white fas fa-cogs"
					        type="button"></button>

					<!--====== Menu ======-->
					<div class="ah-lg-mode">

						<span class="ah-close">✕ Close</span>

						<!--====== List ======-->
						<ul class="ah-list ah-list--design1 ah-list--link-color-white">
							<c:if test="${sessionScope.userid!=null }">
								<li class="mileage-point" data-tooltip="tooltip" data-placement="left">
									<span style="color: white;font-size: 16px">마일리지 : ${sessionScope.point }</span>
								</li>
							</c:if>
							<li class="has-dropdown" data-tooltip="tooltip" data-placement="left">

								<a>
									<i class="far fa-user-circle"></i>
									<c:if test="${sessionScope.userid==null }">
										<span>로그인/회원가입</span>
									</c:if>
									<c:if test="${sessionScope.userid!=null }">
										<span>${sessionScope.username }님 환영합니다</span>
									</c:if>
								</a>

								<!--====== Dropdown ======-->

								<span class="../js-menu-toggle"></span>
								<ul style="width:120px">
									<c:if test="${sessionScope.userid==null }">
										<li>
											<a href="../member/signup.do"><i
													class="fas fa-user-plus u-s-m-r-6"></i>
												<span>회원가입</span>
											</a>
										</li>
										<li>
											<a href="../member/login.do"><i
													class="fas fa-lock u-s-m-r-6"></i>
												<span>로그인</span>
											</a>
										</li>
									</c:if>
									<c:if test="${sessionScope.userid!=null }">
										<li>
											<a href="#"><i class="fas fa-user-circle u-s-m-r-6"></i>
												<span>계정</span>
											</a>
										</li>
										<li>
											<a href="../member/logout.do"><i
													class="fas fa-lock-open u-s-m-r-6"></i>
												<span>로그아웃</span>
											</a>
										</li>
									</c:if>
								</ul>
								<!--====== End - Dropdown ======-->
							</li>
						</ul>
						<!--====== End - List ======-->
					</div>
					<!--====== End - Menu ======-->
				</div>
				<!--====== End - Dropdown Main plugin ======-->
			</div>
			<!--====== End - Primary Nav ======-->
		</div>
	</nav>
	<!--====== End - Nav 1 ======-->


	<!--====== Nav 2 ======-->
	<nav class="secondary-nav-wrapper">
		<div class="container">

			<!--====== Secondary Nav ======-->
			<div class="secondary-nav">

				<!--====== Dropdown Main plugin ======-->
				<div class="menu-init" id="navigation1">
				</div>
				<!--====== End - Dropdown Main plugin ======-->


				<!--====== Dropdown Main plugin ======-->
				<div class="menu-init" id="navigation2">

					<button class="btn btn--icon toggle-button toggle-button--white fas fa-cog"
					        type="button"></button>

					<!--====== Menu ======-->
					<div class="ah-lg-mode">

						<span class="ah-close">✕ Close</span>

						<!--====== List ======-->
						<ul class="ah-list ah-list--design2 ah-list--link-color-white">
							<li>
								<a href="../main/main.do">HOME</a>
							</li>
							<li>
								<a href="../camp/list.do">캠핑장</a>
							</li>
							<li>
								<a href="../campcar/list.do">캠핑카</a>
							</li>
							<li class="has-dropdown">
								<a>쇼핑몰<i class="fas fa-angle-down u-s-m-l-6"></i></a>
								<!--====== Dropdown ======-->
								<span class="js-menu-toggle"></span>
								<ul style="width:200px">
									<li>
										<a href="../item/list.do">상품 목록</a>
										<a href="../item/find.do">상품 검색</a>
									</li>
								</ul>
								<!--====== End - Dropdown ======-->
							</li>
							<li class="has-dropdown">
								<a>레시피<i class="fas fa-angle-down u-s-m-l-6"></i></a>
								<!--====== Dropdown ======-->
								<span class="js-menu-toggle"></span>
								<ul style="width:200px">
									<li>
										<a href="../recipe/recipe_group.do">레시피 분류</a>
									</li>
									<li>
										<a href="../recipe/chef_list.do">셰프 목록</a>
									</li>
								</ul>
								<!--====== End - Dropdown ======-->
							</li>
							<li class="has-dropdown">
								<a>고객센터<i class="fas fa-angle-down u-s-m-l-6"></i></a>
								<!--====== Dropdown ======-->
								<span class="js-menu-toggle"></span>
								<ul style="width:200px">
									<li>
										<a href="/web/service/list.do">QnA</a>
									</li>
									<li>
										<a href="/web/service/notice.do">공지사항</a>
									</li>
								</ul>
								<!--====== End - Dropdown ======-->
							</li>
							<sec:authorize access="hasRole('ROLE_USER')">
								<li class="has-dropdown">
									<a>마이페이지<i class="fas fa-angle-down u-s-m-l-6"></i></a>
									<!--====== Dropdown ======-->
									<span class="js-menu-toggle"></span>
									<ul style="width:200px">
										<li>
											<a href="../mypage/main.do">계정</a>
										</li>
										<li>
											<a href="../mypage/profile.do">프로필</a>
										</li>
										<li>
											<a href="../mypage/mileage.do">마일리지 조회</a>
										</li>
										<li>
											<a href="../mypage/campreserve.do">캠핑장 예약 관리</a>
										</li>
										<li>
											<a href="../mypage/cart.do">장바구니</a>
										</li>
										<li>
											<a href="../like/likeList.do">좋아요</a>
										</li>
										<li>
											<a href="../mypage/reply.do">댓글</a>
										</li>
									</ul>
									<!--====== End - Dropdown ======-->
								</li>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li>
									<a href="../admin/main.do">관리자페이지</a>
								</li>
							</sec:authorize>
						</ul>
						<!--====== End - List ======-->
					</div>
					<!--====== End - Menu ======-->
				</div>
				<!--====== End - Dropdown Main plugin ======-->


				<!--====== Dropdown Main plugin ======-->
				<div class="menu-init" id="navigation3">

					<button class="btn btn--icon toggle-button toggle-button--white fas fa-shopping-bag toggle-button-shop"
					        type="button"></button>

					<span class="total-item-round">2</span>

					<!--====== Menu ======-->
					<div class="ah-lg-mode">

						<span class="ah-close">✕ Close</span>

						<!--====== List ======-->
						<ul class="ah-list ah-list--design1 ah-list--link-color-white">
							<li>
								<a href="../main/main.do"><i class="fas fa-home u-c-brand"></i></a>
							</li>
							<li>
								<a href="../like/likeList.do"><i class="far fa-heart"></i></a>
							</li>
							<li>
								<a href="../mypage/cart.do" class="mini-cart-shop-link">
									<i class="fas fa-shopping-bag"></i>
								</a>
							</li>
						</ul>
						<!--====== End - List ======-->
					</div>
					<!--====== End - Menu ======-->
				</div>
				<!--====== End - Dropdown Main plugin ======-->
			</div>
			<!--====== End - Secondary Nav ======-->
		</div>
	</nav>
	<!--====== End - Nav 2 ======-->
</header>
<!--====== End - Main Header ======-->
</body>