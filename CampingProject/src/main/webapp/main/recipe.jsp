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
    <div class="u-s-p-b-60">
        <div class="section__intro u-s-m-b-46">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="block">
                            <span class="block__title">레시피 TOP12</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section Intro ======-->


        <!--====== Section Content ======-->
        <div class="section__content">
            <div class="container">
                <div class="tab-content">
                    <!--====== Tab 3 ======-->
                    <div class="tab-pane active show" id="e-t-r">
                        <div class="slider-fouc">
                            <div class="owl-carousel tab-slider" data-item="4">
							  <c:forEach var="rvo" items="${Rlist}">
                                <div class="u-s-m-b-30">
                                    <div class="product-o product-o--hover-on">
                                        <div class="product-o__wrap">
                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="../recipe/recipe_detail.do?no=${rvo.no }">
                                                <img class="aspect__img" src="${rvo.poster }" alt="">
                                            </a>
                                            <div class="product-o__action-wrap">
                                                <ul class="product-o__action-list">
                                                    <li>
                                                        <a data-modal="modal" data-modal-id="#quick-look" title="Quick View">
                                                        	<i class="fas fa-search-plus"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <span class="product-o__name">
                                        	<a href="../recipe/recipe_detail.do?no=${rvo.no }">${rvo.title }</a>
                                        </span>
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