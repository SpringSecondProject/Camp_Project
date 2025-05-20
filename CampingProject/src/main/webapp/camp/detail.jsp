<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('.nav-link').click(function(){
		let tab=$(this).attr('href')
		$('.tab-pane').removeClass("show")
	})
	console.log(${vo})
})
</script>
<style type="text/css">
.pd-tab__{
	margin: 0px auto;
	width: 860px;
}
</style>
</head>
<body>
    <!--====== App Content ======-->
    <div class="app-content">

        <!--====== Section 1 ======-->
        <div class="u-s-p-t-90">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">

                        <!--====== Product Breadcrumb ======-->
                        <div class="pd-breadcrumb u-s-m-b-30">
                            <ul class="pd-breadcrumb__list">
                                <li class="has-separator">

                                    <a href="../main/main.do">Home</a></li>
                                <li class="has-separator">

                                    <a href="../camp/list.do">캠핑장 목록</a></li>
                                <li class="has-separator">

                                    <a href="../camp/detail.do?cno=${param.cno}">캠핑장 상세</a></li>
                            </ul>
                        </div>
                        <!--====== End - Product Breadcrumb ======-->


                        <!--====== Product Detail Zoom ======-->
                        <div class="pd u-s-m-b-30">
                            <div class="slider-fouc pd-wrap">
                                <div id="pd-o-initiate">
                                	<c:if test="${vo.firstImageUrl!=''}">
	                                    <div class="pd-o-img-wrap" data-src="${vo.firstImageUrl}">
	                                        <img class="u-img-fluid" src="${vo.firstImageUrl}" data-zoom-image="${vo.firstImageUrl}">
	                                    </div>
                                	</c:if>
                                    <c:forEach begin="0" end="6" var="i">
	                                    <div class="pd-o-img-wrap" data-src="${images[i] }">
	                                        <img class="u-img-fluid" src="${images[i] }" data-zoom-image="${images[i] }" style="max-height: 370px">
	                                    </div>
                                    </c:forEach>
                                	<c:if test="${vo.firstImageUrl==''}">
	                                    <div class="pd-o-img-wrap" data-src="${images[7] }">
	                                        <img class="u-img-fluid" src="${images[7] }" data-zoom-image="${images[7] }" style="max-height: 370px">
	                                    </div>
                                	</c:if>
                                </div>
                                <span class="pd-text">Click for larger zoom</span>
                            </div>
                            <div class="u-s-m-t-15">
                                <div class="slider-fouc">
                                    <div id="pd-o-thumbnail">
	                                	<c:if test="${vo.firstImageUrl!=''}">
	                                        <div>
	                                            <img class="u-img-fluid" src="${vo.firstImageUrl}">
	                                        </div>
	                                    </c:if>
	                                    <c:forEach begin="0" end="6" var="i">
	                                        <div>
	                                            <img class="u-img-fluid" src="${images[i] }" style="max-height: 75px">
	                                        </div>
	                                    </c:forEach>
	                                	<c:if test="${vo.firstImageUrl==''}">
	                                        <div>
	                                            <img class="u-img-fluid" src="${images[7] }" style="max-height: 75px">
	                                        </div>
	                                    </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--====== End - Product Detail Zoom ======-->
                    </div>
                    <div class="col-lg-7">

                        <!--====== Product Right Side Details ======-->
                        <div class="pd-detail">
                            <div>
                                <span class="pd-detail__name"><h2>${vo.facltNm}</h2></span>
                            </div>
                            <div class="u-s-m-b-15">
                                <span class="pd-detail__preview-desc">${vo.lineIntro }</span>
                            </div>
                            <div class="u-s-m-b-15">
                            	<table class="table" style="font-size: 16px">
                            		<tr>
                            			<td class="text-center" width="20%"><b>주소</b></td>
                            			<td class="text-left" width="80%">
                            				<c:if test="${vo.addr1!='' || vo.addr2!=''}">
	                            				${vo.addr1}&nbsp;${vo.addr2}
                            				</c:if>
                            				<c:if test="${vo.addr1=='' && vo.addr2==''}">
	                            				&nbsp;-&nbsp;
                            				</c:if>
                            			</td>
                            		</tr>
                            		<tr>
                            			<td class="text-center" width="20%"><b>문의처</b></td>
                            			<td class="text-left" width="80%">
                            				<c:if test="${vo.tel!=''}">
	                            				${vo.tel}
                            				</c:if>
                            				<c:if test="${vo.tel==''}">
	                            				&nbsp;-&nbsp;
                            				</c:if>
                            			</td>
                            		</tr>
                            		<tr>
                            			<td class="text-center" width="20%"><b>캠핑장 유형</b></td>
                            			<td class="text-left" width="80%">
                            				<c:if test="${vo.lctCl!=''}">
	                            				${vo.lctCl}
                            				</c:if>
                            				<c:if test="${vo.lctCl==''}">
	                            				&nbsp;-&nbsp;
                            				</c:if>
                            			</td>
                            		</tr>
                            		<tr>
                            			<td class="text-center" width="20%"><b>운영기간</b></td>
                            			<td class="text-left" width="80%">
                            				<c:if test="${vo.operPdCl!=''}">
	                            				${vo.operPdCl}
                            				</c:if>
                            				<c:if test="${vo.operPdCl==''}">
	                            				&nbsp;-&nbsp;
                            				</c:if>
                            			</td>
                            		</tr>
                            		<tr>
                            			<td class="text-center" width="20%"><b>운영일</b></td>
                            			<td class="text-left" width="80%">
                            				<c:if test="${vo.operDeCl!=''}">
	                            				${vo.operDeCl}
                            				</c:if>
                            				<c:if test="${vo.operDeCl==''}">
	                            				&nbsp;-&nbsp;
                            				</c:if>
                            			</td>
                            		</tr>
                            		<tr>
                            			<td class="text-center" width="20%"><b>홈페이지</b></td>
                            			<td class="text-left" width="80%">
                            				<c:if test="${vo.homepage!=''}">
	                            				<a href="${vo.homepage}" target="_blank">홈페이지 바로가기</a>
                            				</c:if>
                            				<c:if test="${vo.homepage==''}">
	                            				&nbsp;-&nbsp;
                            				</c:if>
                            			</td>
                            		</tr>
                            		<tr>
                            			<td class="text-center" width="20%"><b>예약방법</b></td>
                            			<td class="text-left" width="80%">
                            				<c:if test="${vo.resveCl!=''}">
	                            				${vo.resveCl}
                            				</c:if>
                            				<c:if test="${vo.resveCl==''}">
	                            				&nbsp;-&nbsp;
                            				</c:if>
                            			</td>
                            		</tr>
                            		<tr>
                            			<td class="text-center" width="20%"><b>주변이용가능시설</b></td>
	                            		<td class="text-left" width="80%">
	                            			<c:if test="${vo.posblFcltyCl!=''}">
	                            				${vo.posblFcltyCl}
	                            			</c:if>
	                            			<c:if test="${vo.posblFcltyCl==''}">
	                            				&nbsp;-&nbsp;
	                            			</c:if>
	                            		</td>
                            		</tr>
                            	</table>
                            </div>
                            <div class="u-s-m-b-15">
                                <div class="pd-detail-inline-2">
                                    <div class="u-s-m-b-15">
                                    	<c:if test="${sessionScope.userid!=null }">
	                                        <a class="btn btn--e-brand-b-2" href="../camp/reserve.do?cno=${vo.contentId}">예약하기</a>
                                    	</c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--====== End - Product Right Side Details ======-->
                    </div>
                </div>
            </div>
        </div>

        <!--====== Product Detail Tab ======-->
        <div class="u-s-p-y-90">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="pd-tab">
                            <div class="u-s-m-b-30">
                                <ul class="nav pd-tab__list">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#pd-descript">캠핑장 소개</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#pd-map">위치/주변정보</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#pd-calendar">예약정보</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="view-review" data-toggle="tab" href="#pd-review">리뷰</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="view-review" data-toggle="tab" href="#pd-notice">공지</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="view-review" data-toggle="tab" href="#pd-cctv">교통정보</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content">
                            
								<div class="tab-pane show active" id="pd-descript">
								    <div class="pd-tab__">
								        <jsp:include page="detail_tap.jsp"/>
								    </div>
								</div>	
								<div class="tab-pane" id="pd-map">
								    <div class="pd-tab__">
								        <h2 class="u-s-m-b-15">위치/주변정보</h2>
								    </div>
								</div>
								<div class="tab-pane" id="pd-calendar">
								    <div class="pd-tab__">
								        <h2 class="u-s-m-b-15">예약정보</h2>
								    </div>
								</div>
								<div class="tab-pane" id="pd-review">
								    <div class="pd-tab__" id="review-app" data-type=${type } data-no=${param.cno }>
								        <jsp:include page="../commons/review.jsp"/>
								    </div>
								</div>
								<div class="tab-pane" id="pd-notice">
								    <div class="pd-tab__">
								        <h2 class="u-s-m-b-15">공지</h2>
								    </div>
								</div>
								<div class="tab-pane" id="pd-cctv">
								    <div class="pd-tab__">
								        <jsp:include page="cctv_tap.jsp"/>
								    </div>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Product Detail Tab ======-->
        <div class="u-s-p-b-90">

            <!--====== Section Intro ======-->
            <div class="section__intro u-s-m-b-46">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary u-s-m-b-12">CUSTOMER ALSO VIEWED</h1>

                                <span class="section__span u-c-grey">PRODUCTS THAT CUSTOMER VIEWED</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Intro ======-->


            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="slider-fouc">
                        <div class="owl-carousel product-slider" data-item="4">
                            <div class="u-s-m-b-30">
                                <div class="product-o product-o--hover-on">
                                    <div class="product-o__wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                            <img class="aspect__img" src="../images/product/electronic/product1.jpg" alt=""></a>
                                        <div class="product-o__action-wrap">
                                            <ul class="product-o__action-list">
                                                <li>

                                                    <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a></li>
                                                <li>

                                                    <a data-modal="modal" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-plus-circle"></i></a></li>
                                                <li>

                                                    <a href="signin.html" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"><i class="fas fa-heart"></i></a></li>
                                                <li>

                                                    <a href="signin.html" data-tooltip="tooltip" data-placement="top" title="Email me When the price drops"><i class="fas fa-envelope"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <span class="product-o__category">

                                        <a href="shop-side-version-2.html">Electronics</a></span>

                                    <span class="product-o__name">

                                        <a href="product-detail.html">Beats Bomb Wireless Headphone</a></span>
                                    <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>

                                        <span class="product-o__review">(20)</span></div>

                                    <span class="product-o__price">$125.00

                                        <span class="product-o__discount">$160.00</span></span>
                                </div>
                            </div>
                            <div class="u-s-m-b-30">
                                <div class="product-o product-o--hover-on">
                                    <div class="product-o__wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                            <img class="aspect__img" src="../images/product/electronic/product2.jpg" alt=""></a>
                                        <div class="product-o__action-wrap">
                                            <ul class="product-o__action-list">
                                                <li>

                                                    <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a></li>
                                                <li>

                                                    <a data-modal="modal" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-plus-circle"></i></a></li>
                                                <li>

                                                    <a href="signin.html" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"><i class="fas fa-heart"></i></a></li>
                                                <li>

                                                    <a href="signin.html" data-tooltip="tooltip" data-placement="top" title="Email me When the price drops"><i class="fas fa-envelope"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <span class="product-o__category">

                                        <a href="shop-side-version-2.html">Electronics</a></span>

                                    <span class="product-o__name">

                                        <a href="product-detail.html">Red Wireless Headphone</a></span>
                                    <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>

                                        <span class="product-o__review">(20)</span></div>

                                    <span class="product-o__price">$125.00

                                        <span class="product-o__discount">$160.00</span></span>
                                </div>
                            </div>
                            <div class="u-s-m-b-30">
                                <div class="product-o product-o--hover-on">
                                    <div class="product-o__wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                            <img class="aspect__img" src="../images/product/electronic/product3.jpg" alt=""></a>
                                        <div class="product-o__action-wrap">
                                            <ul class="product-o__action-list">
                                                <li>

                                                    <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a></li>
                                                <li>

                                                    <a data-modal="modal" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-plus-circle"></i></a></li>
                                                <li>

                                                    <a href="signin.html" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"><i class="fas fa-heart"></i></a></li>
                                                <li>

                                                    <a href="signin.html" data-tooltip="tooltip" data-placement="top" title="Email me When the price drops"><i class="fas fa-envelope"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <span class="product-o__category">

                                        <a href="shop-side-version-2.html">Electronics</a></span>

                                    <span class="product-o__name">

                                        <a href="product-detail.html">Yellow Wireless Headphone</a></span>
                                    <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>

                                        <span class="product-o__review">(20)</span></div>

                                    <span class="product-o__price">$125.00

                                        <span class="product-o__discount">$160.00</span></span>
                                </div>
                            </div>
                            <div class="u-s-m-b-30">
                                <div class="product-o product-o--hover-on">
                                    <div class="product-o__wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                            <img class="aspect__img" src="../images/product/electronic/product23.jpg" alt=""></a>
                                        <div class="product-o__action-wrap">
                                            <ul class="product-o__action-list">
                                                <li>

                                                    <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a></li>
                                                <li>

                                                    <a data-modal="modal" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-plus-circle"></i></a></li>
                                                <li>

                                                    <a href="signin.html" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"><i class="fas fa-heart"></i></a></li>
                                                <li>

                                                    <a href="signin.html" data-tooltip="tooltip" data-placement="top" title="Email me When the price drops"><i class="fas fa-envelope"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <span class="product-o__category">

                                        <a href="shop-side-version-2.html">Electronics</a></span>

                                    <span class="product-o__name">

                                        <a href="product-detail.html">Razor Gear Ultra Slim 8GB Ram</a></span>
                                    <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>

                                        <span class="product-o__review">(20)</span></div>

                                    <span class="product-o__price">$125.00

                                        <span class="product-o__discount">$160.00</span></span>
                                </div>
                            </div>
                            <div class="u-s-m-b-30">
                                <div class="product-o product-o--hover-on">
                                    <div class="product-o__wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                            <img class="aspect__img" src="../images/product/electronic/product26.jpg" alt=""></a>
                                        <div class="product-o__action-wrap">
                                            <ul class="product-o__action-list">
                                                <li>

                                                    <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a></li>
                                                <li>

                                                    <a data-modal="modal" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-plus-circle"></i></a></li>
                                                <li>

                                                    <a href="signin.html" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"><i class="fas fa-heart"></i></a></li>
                                                <li>

                                                    <a href="signin.html" data-tooltip="tooltip" data-placement="top" title="Email me When the price drops"><i class="fas fa-envelope"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <span class="product-o__category">

                                        <a href="shop-side-version-2.html">Electronics</a></span>

                                    <span class="product-o__name">

                                        <a href="product-detail.html">Razor Gear Ultra Slim 12GB Ram</a></span>
                                    <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>

                                        <span class="product-o__review">(20)</span></div>

                                    <span class="product-o__price">$125.00

                                        <span class="product-o__discount">$160.00</span></span>
                                </div>
                            </div>
                            <div class="u-s-m-b-30">
                                <div class="product-o product-o--hover-on">
                                    <div class="product-o__wrap">

                                        <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                            <img class="aspect__img" src="../images/product/electronic/product30.jpg" alt=""></a>
                                        <div class="product-o__action-wrap">
                                            <ul class="product-o__action-list">
                                                <li>

                                                    <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a></li>
                                                <li>

                                                    <a data-modal="modal" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-plus-circle"></i></a></li>
                                                <li>

                                                    <a href="signin.html" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"><i class="fas fa-heart"></i></a></li>
                                                <li>

                                                    <a href="signin.html" data-tooltip="tooltip" data-placement="top" title="Email me When the price drops"><i class="fas fa-envelope"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <span class="product-o__category">

                                        <a href="shop-side-version-2.html">Electronics</a></span>

                                    <span class="product-o__name">

                                        <a href="product-detail.html">Razor Gear Ultra Slim 16GB Ram</a></span>
                                    <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>

                                        <span class="product-o__review">(20)</span></div>

                                    <span class="product-o__price">$125.00

                                        <span class="product-o__discount">$160.00</span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 1 ======-->
    </div>
    <!--====== End - App Content ======-->
</body>
</html>