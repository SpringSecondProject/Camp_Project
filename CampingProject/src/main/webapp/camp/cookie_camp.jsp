<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .cookie {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    display: block;
  }
</style>
</head>
<body>
	<!--====== 캠핑장 쿠키 ======-->
	<div class="u-s-p-b-60" id="electronic-01">
		<div class="section__intro u-s-m-b-46">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="block">
							<span class="block__title">최근 방문한 페이지</span>
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
							<div class="owl-carousel tab-slider" data-item="6">

								<c:forEach var="vo" items="${recentList}">
									<div class="u-s-m-b-30">
										<div class="product-o product-o--hover-on">
											<div class="product-o__wrap">
												<a class="aspect aspect--bg-grey aspect--square u-d-block"
													href="../camp/detail.do?cno=${vo.cno}"> <img
													class="aspect__img" src="${vo.poster}" alt="">
												</a> 
											</div>
											</span> <span class="product-o__name" style="text-align: center"> 
											<a class = cookie href="../camp/detail.do?cno=${vo.cno}">${vo.title}</a>
											</span>
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