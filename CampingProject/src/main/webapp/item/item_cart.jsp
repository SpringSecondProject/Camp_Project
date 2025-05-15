<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!--====== App Content ======-->
        <div class="app-content">

            <!--====== Section 1 ======-->
            <div class="u-s-p-y-60">

                <!--====== Section Content ======-->
                <div class="section__content">
                    <div class="container">
                        <div class="breadcrumb">
                            <div class="breadcrumb__wrap">
                                <ul class="breadcrumb__list">
                                    <li class="has-separator">

                                        <a href="../main/main.do">Home</a></li>
                                    <li class="is-marked">

                                     <a href="../item/item_cart.do?id=${param.id}">Shopping  Cart</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section 1 ======-->


            <!--====== Section 2 ======-->
            <div class="u-s-p-b-60">

                <!--====== Section Intro ======-->
                <div class="section__intro u-s-m-b-60">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section__text-wrap">
                                    <h1 class="section__heading u-c-secondary">Shopping Cart</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Intro ======-->


                <!--====== Section Content ======-->
                <div class="section__content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <!--====== Wishlist Product ======-->
                                <div class="w-r u-s-m-b-30">
								  <c:forEach var="item" items="${cartItem}" >
                                    <div class="w-r__container" data-price="${item.ivo.price}" data-qty="${item.account}">
                                        <div class="w-r__wrap-1">
                                            <div class="w-r__img-wrap">
                                                <img class="u-img-fluid" src="https://www.ocamall.com${item.ivo.poster} " alt=""></div>
                                            <div class="w-r__info">

                                                <span class="w-r__name">

                                                    <a href="../item/detail.do?ino=${item.ino}">${item.ivo.name}</a></span>

                                                <span class="w-r__category">${item.ivo.type}</span>
                                                      
                                                    
												        <fmt:parseNumber var="price" value="${item.ivo.price}" integerOnly="true"/>
												          <fmt:parseNumber var="discount" value="${item.ivo.discount}" integerOnly="true"/>
												          <c:set var="salePrice" value="${price - (price * discount / 100)}"/>
														 <fmt:formatNumber value="${salePrice}" type="number" maxFractionDigits="0" var="formattedSalePrice"/>
														<span class="w-r__price" id="salePrice">${formattedSalePrice}원	
											         <input type="hidden" id="priceValue" value="${formattedSalePrice}" />
											       <span class="w-r__discount">${item.ivo.price}원</span></span>  											       
										          <div class="input-counter">										        
                                                    <span class="input-counter__minus fas fa-minus"></span>
										            <input type="text" class="input-counter__text input-counter--text-primary-style" value="${item.account}" data-default="${item.account}" readonly />
                                                    <span class="input-counter__plus fas fa-plus"></span></div>
										          </div>											                                                     											         
									        	</div>												
                                        <div class="w-r__wrap-2">

                                            <a class="w-r__link btn--e-transparent-platinum-b-2" href="../item/detail.do?ino=${item.ino}">VIEW</a>

                                            <a class="w-r__link btn--e-transparent-platinum-b-2" href="#">REMOVE</a></div>
                                      </div>                                      
                                    </c:forEach>                                   
                                </div>                                
                                <!--====== End - Wishlist Product ======-->
                            </div>
                             <div class="col-lg-12">
                                <div class="w-r__container">
									<div class="route-box__g"></div>
                                      <div class="w-r__wrap-2">
							  		<span class="route-box__link">총 결제 금액:<span id="cartTotal">0</span>원</span>
                                  <a class="w-r__link btn--e-brand-b-2" data-modal="modal" data-modal-id="#add-to-cart">BUY</a>
							  </div>
                            </div>
                           </div>
                            <div class="col-lg-12">
                                <div class="route-box">
                                    <div class="route-box__g">
                                        <a class="route-box__link" href="../item/list.do"><i class="fas fa-long-arrow-alt-left"></i>
                                            <span>CONTINUE SHOPPING</span></a></div>
                                    <div class="route-box__g">
                                        <a class="route-box__link" href="wishlist.html"><i class="fas fa-trash"></i>
                                            <span>CLEAR WISHLIST</span></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Content ======-->
            </div>
            <!--====== End - Section 2 ======-->
        <!--====== End - App Content ======-->
</body>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const rawPrice = document.getElementById('priceValue').value || "0";
    const price = parseInt(rawPrice.replace(/,/g, ''), 10);
    const quantitySelect = document.getElementById('quantitySelect');
    const totalAmount = document.getElementById('totalAmount');

    function updateTotal() {
      const quantity = parseInt(quantitySelect.value);
      const total = price * quantity;
      totalAmount.textContent = total.toLocaleString();
    }

    quantitySelect.addEventListener('change', updateTotal);
    updateTotal();
  });
document.addEventListener('DOMContentLoaded', function () {
	  const containers = document.querySelectorAll('.w-r__container');
	  let total = 0;

	  containers.forEach(container => {
	    let priceStr = container.dataset.price || "0";
	    let qty = parseInt(container.dataset.qty || "0", 10);
	    
	    let price = parseInt(priceStr.replace(/,/g, ''), 10);
	    total += price * qty;
	  });

	  document.getElementById('cartTotal').textContent = total.toLocaleString();
	});
</script>
</html>