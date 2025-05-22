<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div class="container">

                    <!--====== Primary Slider ======-->
                    <div class="s-skeleton s-skeleton--h-600 s-skeleton--bg-black">
                        <div class="owl-carousel primary-style-2" id="hero-slider">
						    <div class="hero-slide hero-slide--4">
						        <div class="primary-style-2-container">
						            <div class="row">
						                <div class="col-12">
						                    <div class="slider-content slider-content--animation">
						                        <span class="content-span-1 u-c-white" style="font-size: 18px;">캠핑 장소 추천!</span><br>
						                        <span class="content-span-2 u-c-white">캠핑 여행 어디로 떠나지?</span><br>
						                        <span class="content-span-3 u-c-white" style="font-size: 18px;">전국 1000개 이상 장소를 모아봤습니다</span><br>
						                        <span class="content-span-4 u-c-white" style="font-size: 15px;">
						                            시작가 <span class="u-c-brand" style="font-size: 16px; color: #3974D9 !important;" >₩10,000원</span>
						                        </span><br><br>
						                        <a class="shop-now-link btn--e-brand" href="../camp/list.do" style="font-size: 16px; background-color: #3974D9" >장소 둘러보기 →</a>
						                    </div>
						                </div>
						            </div>
						        </div>
						    </div> 
						   
						   <div class="hero-slide hero-slide--5">
						        <div class="primary-style-2-container">
						            <div class="row">
						                <div class="col-12">
						                    <div class="slider-content slider-content--animation">
						                        <span class="content-span-1 u-c-white" style="font-size: 18px;">캠핑카 타고 지금 출발!</span><br>
						                        <span class="content-span-2 u-c-white">캠핑카 어디서 빌리지?</span><br>
						                        <span class="content-span-3 u-c-white" style="font-size: 18px;">"최고의 캠핑카를 가장 합리적인 가격에 만나보세요!"</span><br>
						                        <span class="content-span-4 u-c-white" style="font-size: 15px;">
						                            시작가 <span class="u-c-brand" style="font-size: 16px; color: #3974D9 !important;">₩140,000</span>
						                        </span><br><br>
						                        <a class="shop-now-link btn--e-brand" href="../campcar/list.do" style="font-size: 16px; background-color: #3974D9" >지금 예약하기 →</a>
						                    </div>
						                </div>
						            </div>
						        </div>
						    </div> 
						    
						    <div class="hero-slide hero-slide--6">
						        <div class="primary-style-2-container">
						            <div class="row">
						                <div class="col-12">
						                    <div class="slider-content slider-content--animation">
						                        <span class="content-span-1 u-c-black" style="font-size: 18px;">매진 임박!</span><br>
						                        <span class="content-span-2 u-c-black">캠핑! 뭐가 필요하지?</span><br>
						                        <span class="content-span-3 u-c-black" style="font-size: 18px;">"꼭 필요한 캠핑용품을 한눈에!"</span><br>
						                        <span class="content-span-4 u-c-black" style="font-size: 15px;">
						                            최대 할인 <span class="u-c-brand" style="font-size: 16px; color: #3974D9 !important;">80%</span>
						                        </span><br><br>
						                        <a class="shop-now-link btn--e-brand" href="../item/list.do" style="font-size: 16px; background-color: #3974D9">지금 구매하기 →</a>
						                    </div>
						                </div>
						            </div>
						        </div>
						    </div> 
						    
						    
						</div> 
	                </div>    
	                    <!--====== End - Primary Slider ======-->
	                
	                <!-- top12 추가 start -->
	                <jsp:include page="../main/camp.jsp"/>
	                <jsp:include page="../main/item.jsp"/>
	                <jsp:include page="../main/recipe.jsp"/>
	                <!-- top12 추가end -->
	                <%-- <jsp:include page="../main/video.jsp"/> --%>
	                <!-- 쿠키 추가 start -->
	                <!-- 쿠키 추가 end -->
                </div>
                <!--====== End - Section 10 ======-->
            </div>
            <!--====== End - White Container ======-->
        </div>
        <!--====== End - Anti Flash White Background ======-->
    </div>
    <!--====== End - App Content ======-->
</body>
</html>