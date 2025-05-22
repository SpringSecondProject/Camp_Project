<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 조회수 TOP12</title>

<style>
.addr {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	display: block;
}
</style>
</head>
<body>
	<!--====== 캠핑장 TOP12 ======-->
	<div style="margin-top: 20px;"></div>
	<div class="u-s-p-b-60" id="electronic-01">
		<div class="section__intro u-s-m-b-46">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="block">
							<span class="block__title">캠핑장 TOP12</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="section__content">
			<div class="container">
				<div class="tab-content">
					<div class="tab-pane active show" id="e-t-r">
						<div class="slider-fouc">
							<div class="owl-carousel tab-slider" data-item="4">

								<c:forEach var="cvo" items="${Clist}">
									<div class="u-s-m-b-30">
										<div class="product-o product-o--hover-on">
											<div class="product-o__wrap">
												<a class="aspect aspect--bg-grey aspect--square u-d-block"
													href="../camp/detail_before.do?cno=${cvo.cno}"> <img
													class="aspect__img" src="${cvo.poster}">
												</a>
												
											</div>

											<span class="product-o__category"> <a href="../camp/detail_before.do?cno=${cvo.cno}">종류
													: ${cvo.induty} </a>
											</span> <span class="product-o__name"> <a
												href="../camp/detail_before.do?cno=${cvo.cno}">${cvo.title}</a>
											</span>

											<div class="product-o__name"
												style="color: #4285F4 !important;">
												<a style="color: #4285F4 !important;"
													href="../camp/detail_before.do?cno=${cvo.cno}">가격 :
													${cvo.price} 원 </a>
											</div>
											<hr style="margin: 5px;">
											<div class="product-o__category addr">
												<a href="../camp/detail_before.do?cno=${cvo.cno}">주소 :
													${cvo.addr} </a>
											</div>
											<div class="product-o__category addr">
												<a href="../camp/detail_before.do?cno=${cvo.cno}">조회수 :
													${cvo.hit} </a>
											</div>

										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>