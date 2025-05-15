<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 상품 조회수 TOP12</title>
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
	<div class="u-s-p-b-60" id="electronic-01">
		<div class="section__intro u-s-m-b-46">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="block">
							<span class="block__title">쇼핑몰 상품 TOP12</span>
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

								<c:forEach var="ivo" items="${Ilist}">
									<div class="u-s-m-b-30">
										<div class="product-o product-o--hover-on">
											<div class="product-o__wrap">
												<a class="aspect aspect--bg-grey aspect--square u-d-block"
													href="../item/detail.do?ino=${ivo.ino}"> 
													<img class="aspect__img" src="https://www.ocamall.com${ivo.poster}" >
												</a> 
												<div class="product-o__action-wrap">
													<ul class="product-o__action-list">
														<li>
														<a data-modal="modal" data-modal-id="#quick-look"
															title="Quick View"><i class="fas fa-search-plus"></i></a>
														</li>
														<li><a data-modal="modal"
															data-modal-id="#add-to-cart" title="Add to Cart">
															<i class="fas fa-plus-circle"></i>
															</a>
														</li>
														<li><a href="#" title="Add to Wishlist"><i
																class="fas fa-heart"></i></a></li>
														<li><a href="#"
															title="Email me When the price drops"><i
																class="fas fa-envelope"></i></a></li>
													</ul>
												</div>
											</div>

											<span class="product-o__category"> 
												<a href="#">${ivo.type} </a>
											</span> <span class="product-o__name"> <a
												href="../item/detail.do?ino=${ivo.ino}">${ivo.name}</a>
											</span>

											<div class="product-o__name" style="color: #4285F4 !important;" >
                                                	<a style="color: #4285F4 !important;"href="../item/detail.do?ino=${ivo.ino}">가격:${ivo.price}원</a>
                                            </div>
                                            <div class="product-o__category addr" >
                                                <a href="../item/detail.do?ino=${ivo.ino}">조회수:${ivo.hit} </a>
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