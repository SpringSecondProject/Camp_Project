<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.video_title{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	margin-top: 20px;
}
</style>
<script type="text/javascript">
$(function(){
	let arr=${vList}
	console.log(arr)
})
</script>
</head>
<body>
<div style="margin-top: 20px;"></div>
    <div class="u-s-p-b-60">

        <!--====== Section Intro ======-->
        <div class="section__intro u-s-m-b-46">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="block">
                            <span class="block__title">캠핑 인기 영상</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section Intro ======-->


        <!--====== Section Content ======-->
        <div class="section__content" id="videoApp">
            <div class="container">
                <div class="tab-content">
                    <!--====== Tab 3 ======-->
                    <div class="tab-pane active show" id="e-t-r">
                        <div class="slider-fouc">
                            <div class="owl-carousel tab-slider" data-item="4">
                            	<c:forEach var="vVo" items="${vList }">
	                                <div class="u-s-m-b-30" title="${vVo.title}">
	                                    <div class="product-o product-o--hover-on">
	                                        <div class="product-o__wrap">
	                                            <iframe src="https://www.youtube.com/embed/${vVo.videoid}" style="width: 240px;height: 180px"></iframe>
	                                        </div>
	                                        <p class="video_title">${vVo.title}</p>
	                                    </div>
	                                </div>
                            	</c:forEach>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Tab 3 ======-->
                </div>
            </div>
        </div>
        <!--====== End - Section Content ======-->
    </div>
</body>
</html>