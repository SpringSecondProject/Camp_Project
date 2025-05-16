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
									<div class="w-r__container" data-price="${formattedSalePrice}" data-qty="${item.account}" data-ino="${item.ino}">
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
														<span class="w-r__price">${formattedSalePrice}원
											         <input type="hidden" class="priceValue" value="${formattedSalePrice}" />
											       <span class="w-r__discount">${item.ivo.price}원</span></span>											       
										          <div class="input-counter">										        
                                                    <span class="input-counter__minus fas fa-minus"></span>
										            <input type="text" class="input-counter__text input-counter--text-primary-style" value="${item.account}" data-default="${item.account}" />
                                                    <span class="input-counter__plus fas fa-plus"></span></div>
										          </div>											                                                     											         
									        	</div>												
                                        <div class="w-r__wrap-2">

                                            <a class="w-r__link btn--e-transparent-platinum-b-2" href="../item/detail.do?ino=${item.ino}">VIEW</a>

                                            <a class="w-r__link btn--e-transparent-platinum-b-2" href="#" onclick="cartDelete(${item.ino}); return false;">REMOVE</a></div>
                                      </div>                                      
                                    </c:forEach>                                   
                                </div>                                
                                <!--====== End - Wishlist Product ======-->
                            </div>
							<div class="col-lg-12">
							    <div class="w-r__container">
							    <div class="route-box__g"></div>
							        <div class="w-r__wrap-2">
							            <span class="route-box__link">총 결제 금액: <span id="totalPrice">0</span>원</span>
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
										<c:set var="userid" value="${sessionScope.userid}" />
                                        <a class="route-box__link" href="#" onclick="cartReset('${userid}'); return false;"><i class="fas fa-trash"></i>
                                            <span>RESET CART</span></a></div>
                                   </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Content ======-->
              </div>
</body>
<script>
const userid = '${sessionScope.userid}';

document.addEventListener('DOMContentLoaded', function () {
    const containers = document.querySelectorAll('.w-r__container');

    containers.forEach(container => {
        const inputCounter = container.querySelector('.input-counter');
        if (!inputCounter) return; // input-counter 없는 경우 건너뜀

        const minusBtn = inputCounter.querySelector('.input-counter__minus');
        const plusBtn = inputCounter.querySelector('.input-counter__plus');
        const input = inputCounter.querySelector('input');
        const ino = container.dataset.ino;

        plusBtn.addEventListener('click', function () {
            let value = parseInt(input.value) || 0;
            input.value = value + 1;
            modifyAccount(userid, ino, input.value);
        });

        minusBtn.addEventListener('click', function () {
            let value = parseInt(input.value) || 0;
            if (value > 1) {
                input.value = value - 1;
                modifyAccount(userid, ino, input.value);
            }
        });
    });

    recalculateTotalPrice();
});

function modifyAccount(userid, ino, newAccount) {
    fetch('../item/item_modify.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'id=' + encodeURIComponent(userid) + 
              '&ino=' + encodeURIComponent(ino) + 
              '&account=' + encodeURIComponent(newAccount)
    })
    .then(response => {
        if (!response.ok) {
            alert("수량 변경 실패");
        } else {
            recalculateTotalPrice();
        }
    })
    .catch(error => {
        console.error("수량 변경 오류:", error);
    });
}

function recalculateTotalPrice() {
    let total = 0;
    document.querySelectorAll('.w-r__container').forEach(container => {
        const price = parseInt(container.dataset.price || 0); // 할인된 가격 기준
        const qtyInput = container.querySelector('.input-counter input');
        const qty = parseInt(qtyInput.value || 0);
        total += price * qty;
    });
    document.getElementById('totalPrice').textContent = total.toLocaleString();
}
</script>
</html>