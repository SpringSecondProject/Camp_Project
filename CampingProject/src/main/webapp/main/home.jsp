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
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <!--====== End - Primary Slider ======-->
	                </div>
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