<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!--====== App Content ======-->
    <div class="app-content">

        <!--====== Anti Flash White Background ======-->
        <div class="bg-anti-flash-white">

            <!--====== White Container ======-->
            <div class="white-container">
<div class="u-s-p-b-60">

                    <!--====== Section Intro ======-->
                    <div class="section__intro u-s-m-b-46">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="block">

                                        <span class="block__title">ELECTRONIC'S</span>
                                        <ul class="nav tab-list">
                                            <li class="nav-item">

                                                <a class="nav-link btn--e-white-brand-shadow" data-toggle="tab" href="#e-l-p">LATEST PRODUCTS</a></li>
                                            <li class="nav-item">

                                                <a class="nav-link btn--e-white-brand-shadow active" data-toggle="tab" href="#e-b-s">BEST SELLING</a></li>
                                            <li class="nav-item">

                                                <a class="nav-link btn--e-white-brand-shadow" data-toggle="tab" href="#e-t-r">TOP RATING</a></li>
                                            <li class="nav-item">

                                                <a class="nav-link btn--e-white-brand-shadow" data-toggle="tab" href="#e-f-p">FEATURED PRODUCTS</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
                    </div>
                    </div>
                    
	<div class="u-s-p-b-60 container">
		<!--====== Section Intro ======-->
		<div class="section__intro u-s-m-b-46">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="block">
							<span class="block__title">최근 본 캠핑장</span>
							<ul class="nav tab-list">
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--====== Section Content ======-->
		<div class="section__content">
			<div class="container">
				<div class="row">
					<c:forEach var="vo" items="${recentList}">
						<div class="col-lg-2 col-md-3 col-sm-4 col-6 u-s-m-b-30">
							<div class="product-m shadow-sm">
								<div class="product-m__thumb">
									<a class="aspect aspect--bg-grey aspect--square u-d-block"
										href="../camp/detail.do?cno=${vo.cno}"> 
										<img class="aspect__img" src="${vo.poster}">
									</a>
								</div> 
								<div class="product-m__thumb">
										<a href="detail_before.do?contentId=${vo.cno}">${vo.title}</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
</html>