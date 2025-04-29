<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#sample a').attr("target","_blank")
})
</script>
</head>
<body>
        <!--====== Main Header ======-->
        <header class="header--style-2">

            <!--====== Nav 1 ======-->
            <nav class="primary-nav-wrapper">
                <div class="container">

                    <!--====== Primary Nav ======-->
                    <div class="primary-nav">

                        <!--====== Main Logo ======-->

                        <a class="main-logo" href="../main/main.do">

                            <img src="../images/logo/logo-2.png" alt=""></a>
                        <!--====== End - Main Logo ======-->


                        <!--====== Search Form ======-->
                        <form class="main-form">

                            <label for="main-search"></label>

                            <input class="input-text input-text--border-radius input-text--style-2" type="text" id="main-search" placeholder="Search">

                            <button class="btn btn--icon fas fa-search main-search-button" type="submit"></button></form>
                        <!--====== End - Search Form ======-->


                        <!--====== Dropdown Main plugin ======-->
                        <div class="menu-init" id="navigation">

                            <button class="btn btn--icon toggle-button toggle-button--white fas fa-cogs" type="button"></button>

                            <!--====== Menu ======-->
                            <div class="ah-lg-mode">

                                <span class="ah-close">✕ Close</span>

                                <!--====== List ======-->
                                <ul class="ah-list ah-list--design1 ah-list--link-color-white">
                                    <li class="has-dropdown" data-tooltip="tooltip" data-placement="left">

                                        <a>
                                        	<i class="far fa-user-circle"></i>
                                        	<c:if test="${sessionScope.userid==null }">
                                        		<span>로그인/회원가입</span>
                                        	</c:if>
                                        	<c:if test="${sessionScope.userid!=null }">
                                        		<span>${sessionScope.username }님 환영합니다</span>
                                        	</c:if>
                                        </a>

                                        <!--====== Dropdown ======-->

                                        <span class="../js-menu-toggle"></span>
                                        <ul style="width:120px">
                                        	<c:if test="${sessionScope.userid==null }">
	                                            <li>
	                                                <a href="../member/signup.do"><i class="fas fa-user-plus u-s-m-r-6"></i>
	                                                    <span>회원가입</span>
	                                                </a>
	                                            </li>
	                                            <li>
	                                                <a href="../member/login.do"><i class="fas fa-lock u-s-m-r-6"></i>
	                                                    <span>로그인</span>
	                                                </a>
	                                            </li>
                                        	</c:if>
                                        	<c:if test="${sessionScope.userid!=null }">
	                                            <li>
	                                                <a href="#"><i class="fas fa-user-circle u-s-m-r-6"></i>
	                                                    <span>계정</span>
	                                                </a>
	                                            </li>
	                                            <li>
	                                                <a href="../member/logout.do"><i class="fas fa-lock-open u-s-m-r-6"></i>
	                                                    <span>로그아웃</span>
	                                                </a>
	                                            </li>
                                        	</c:if>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                </ul>
                                <!--====== End - List ======-->
                            </div>
                            <!--====== End - Menu ======-->
                        </div>
                        <!--====== End - Dropdown Main plugin ======-->
                    </div>
                    <!--====== End - Primary Nav ======-->
                </div>
            </nav>
            <!--====== End - Nav 1 ======-->


            <!--====== Nav 2 ======-->
            <nav class="secondary-nav-wrapper">
                <div class="container">

                    <!--====== Secondary Nav ======-->
                    <div class="secondary-nav">

                        <!--====== Dropdown Main plugin ======-->
                        <div class="menu-init" id="navigation1">
                        </div>
                        <!--====== End - Dropdown Main plugin ======-->


                        <!--====== Dropdown Main plugin ======-->
                        <div class="menu-init" id="navigation2">

                            <button class="btn btn--icon toggle-button toggle-button--white fas fa-cog" type="button"></button>

                            <!--====== Menu ======-->
                            <div class="ah-lg-mode">

                                <span class="ah-close">✕ Close</span>

                                <!--====== List ======-->
                                <ul class="ah-list ah-list--design2 ah-list--link-color-white">
                                    <li>
                                        <a href="../main/main.do">HOME</a>
                                    </li>
                                    <li class="has-dropdown">
                                        <a>캠핑장<i class="fas fa-angle-down u-s-m-l-6"></i></a>
                                        <!--====== Dropdown ======-->
                                        <span class="js-menu-toggle"></span>
                                        <ul style="width:200px">
                                            <li>
                                                <a href="../camp/list.do">캠핑장 목록</a>
                                            </li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                    <li class="has-dropdown">
                                        <a>쇼핑몰<i class="fas fa-angle-down u-s-m-l-6"></i></a>
                                        <!--====== Dropdown ======-->
                                        <span class="js-menu-toggle"></span>
                                        <ul style="width:200px">
                                            <li>
                                                <a href="#">Blog Left Sidebar</a>
                                            </li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                    <li class="has-dropdown">
                                        <a>레시피<i class="fas fa-angle-down u-s-m-l-6"></i></a>
                                        <!--====== Dropdown ======-->
                                        <span class="js-menu-toggle"></span>
                                        <ul style="width:200px">
                                            <li>
                                                <a href="#">Blog Left Sidebar</a>
                                            </li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                    <li class="has-dropdown">
                                        <a>커뮤니티<i class="fas fa-angle-down u-s-m-l-6"></i></a>
                                        <!--====== Dropdown ======-->
                                        <span class="js-menu-toggle"></span>
                                        <ul style="width:200px">
                                            <li>
                                                <a href="#">Blog Left Sidebar</a>
                                            </li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                    <li class="has-dropdown">
                                        <a>고객센터<i class="fas fa-angle-down u-s-m-l-6"></i></a>
                                        <!--====== Dropdown ======-->
                                        <span class="js-menu-toggle"></span>
                                        <ul style="width:200px">
                                            <li>
                                                <a href="#">Blog Left Sidebar</a>
                                            </li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                    <sec:authorize access="hasRole('ROLE_USER')">
	                                    <li class="has-dropdown">
	                                        <a>마이페이지<i class="fas fa-angle-down u-s-m-l-6"></i></a>
	                                        <!--====== Dropdown ======-->
	                                        <span class="js-menu-toggle"></span>
	                                        <ul style="width:200px">
	                                            <li>
	                                                <a href="#">Blog Left Sidebar</a>
	                                            </li>
	                                        </ul>
	                                        <!--====== End - Dropdown ======-->
	                                    </li>
                                    </sec:authorize>
                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
	                                    <li class="has-dropdown">
	                                        <a>관리자페이지<i class="fas fa-angle-down u-s-m-l-6"></i></a>
	                                        <!--====== Dropdown ======-->
	                                        <span class="js-menu-toggle"></span>
	                                        <ul style="width:200px">
	                                            <li>
	                                                <a href="#">Blog Left Sidebar</a>
	                                            </li>
	                                        </ul>
	                                        <!--====== End - Dropdown ======-->
	                                    </li>
                                    </sec:authorize>
                                    <li class="has-dropdown">
                                        <a>샘플 페이지<i class="fas fa-angle-down u-s-m-l-6"></i></a>

                                        <!--====== Dropdown ======-->

                                        <span class="../js-menu-toggle"></span>
                                        <ul style="width:170px" id="sample">
                                            <li class="has-dropdown has-dropdown--ul-left-100">

                                                <a>홈<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                                <!--====== Dropdown ======-->

                                                <span class="../js-menu-toggle"></span>
                                                <ul style="width:118px">
                                                    <li>

                                                        <a href="../sample/index.html">홈 1</a></li>
                                                    <li>

                                                        <a href="../sample/index-2.html">홈 2</a></li>
                                                    <li>

                                                        <a href="../sample/index-3.html">홈 3</a></li>
                                                </ul>
                                                <!--====== End - Dropdown ======-->
                                            </li>
                                            <li class="has-dropdown has-dropdown--ul-left-100">

                                                <a href="../sample/dashboard.html">Dashboard<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                                <!--====== Dropdown ======-->

                                                <span class="../js-menu-toggle"></span>
                                                <ul style="width:200px">
                                                    <li class="has-dropdown has-dropdown--ul-left-100">

                                                        <a href="../sample/dashboard.html">Manage My Account<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                                        <!--====== Dropdown ======-->

                                                        <span class="../js-menu-toggle"></span>
                                                        <ul style="width:180px">
                                                            <li>

                                                                <a href="../sample/dash-edit-profile.html">Edit Profile</a></li>
                                                            <li>

                                                                <a href="../sample/dash-address-book.html">Edit Address Book</a></li>
                                                            <li>

                                                                <a href="../sample/dash-manage-order.html">Manage Order</a></li>
                                                        </ul>
                                                        <!--====== End - Dropdown ======-->
                                                    </li>
                                                    <li>

                                                        <a href=../sample/"dash-my-profile.html">My Profile</a></li>
                                                    <li class="has-dropdown has-dropdown--ul-left-100">

                                                        <a href="../sample/dash-address-book.html">Address Book<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                                        <!--====== Dropdown ======-->

                                                        <span class="../js-menu-toggle"></span>
                                                        <ul style="width:180px">
                                                            <li>

                                                                <a href="../sample/dash-address-make-default.html">Address Make Default</a></li>
                                                            <li>

                                                                <a href="../sample/dash-address-add.html">Add New Address</a></li>
                                                            <li>

                                                                <a href="../sample/dash-address-edit.html">Edit Address Book</a></li>
                                                        </ul>
                                                        <!--====== End - Dropdown ======-->
                                                    </li>
                                                    <li>

                                                        <a href="../sample/dash-track-order.html">Track Order</a></li>
                                                    <li>

                                                        <a href="../sample/dash-my-order.html">My Orders</a></li>
                                                    <li>

                                                        <a href="../sample/dash-payment-option.html">My Payment Options</a></li>
                                                    <li>

                                                        <a href="../sample/dash-cancellation.html">My Returns & Cancellations</a></li>
                                                </ul>
                                                <!--====== End - Dropdown ======-->
                                            </li>
                                            <li class="has-dropdown has-dropdown--ul-left-100">

                                                <a>Empty<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                                <!--====== Dropdown ======-->

                                                <span class="../js-menu-toggle"></span>
                                                <ul style="width:200px">
                                                    <li>

                                                        <a href="../sample/empty-search.html">Empty Search</a></li>
                                                    <li>

                                                        <a href="../sample/empty-cart.html">Empty Cart</a></li>
                                                    <li>

                                                        <a href="../sample/empty-wishlist.html">Empty Wishlist</a></li>
                                                </ul>
                                                <!--====== End - Dropdown ======-->
                                            </li>
                                            <li class="has-dropdown has-dropdown--ul-left-100">

                                                <a>Product Details<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                                <!--====== Dropdown ======-->

                                                <span class="../js-menu-toggle"></span>
                                                <ul style="width:200px">
                                                    <li>

                                                        <a href="../sample/product-detail.html">Product Details</a></li>
                                                    <li>

                                                        <a href="../sample/product-detail-variable.html">Product Details Variable</a></li>
                                                    <li>

                                                        <a href="../sample/product-detail-affiliate.html">Product Details Affiliate</a></li>
                                                </ul>
                                                <!--====== End - Dropdown ======-->
                                            </li>
                                            <li class="has-dropdown has-dropdown--ul-left-100">

                                                <a>Shop Grid Layout<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                                <!--====== Dropdown ======-->

                                                <span class="../js-menu-toggle"></span>
                                                <ul style="width:200px">
                                                    <li>

                                                        <a href="../sample/shop-grid-left.html">Shop Grid Left Sidebar</a></li>
                                                    <li>

                                                        <a href="../sample/shop-grid-right.html">Shop Grid Right Sidebar</a></li>
                                                    <li>

                                                        <a href="../sample/shop-grid-full.html">Shop Grid Full Width</a></li>
                                                    <li>

                                                        <a href="../sample/shop-side-version-2.html">Shop Side Version 2</a></li>
                                                </ul>
                                                <!--====== End - Dropdown ======-->
                                            </li>
                                            <li class="has-dropdown has-dropdown--ul-left-100">

                                                <a>Shop List Layout<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                                <!--====== Dropdown ======-->

                                                <span class="../js-menu-toggle"></span>
                                                <ul style="width:200px">
                                                    <li>

                                                        <a href="../sample/shop-list-left.html">Shop List Left Sidebar</a></li>
                                                    <li>

                                                        <a href="../sample/shop-list-right.html">Shop List Right Sidebar</a></li>
                                                    <li>

                                                        <a href="../sample/shop-list-full.html">Shop List Full Width</a></li>
                                                </ul>
                                                <!--====== End - Dropdown ======-->
                                            </li>
                                            <li>

                                                <a href="../sample/cart.html">Cart</a></li>
                                            <li>

                                                <a href="../sample/wishlist.html">Wishlist</a></li>
                                            <li>

                                                <a href="../sample/checkout.html">Checkout</a></li>
                                            <li>

                                                <a href="../sample/faq.html">FAQ</a></li>
                                            <li>

                                                <a href="../sample/about.html">About us</a></li>
                                            <li>

                                                <a href="../sample/contact.html">Contact</a></li>
                                            <li>

                                                <a href="../sample/404.html">404</a></li>
                                            <li class="has-dropdown has-dropdown--ul-left-100">

                                                <a>blog<i class="fas fa-angle-down i-state-right u-s-m-l-6"></i></a>

                                                <!--====== Dropdown ======-->

                                                <span class="../js-menu-toggle"></span>
                                                <ul style="width:200px">
                                                    <li>
		                                                <a href="../sample/blog-left-sidebar.html">Blog Left Sidebar</a></li>
		                                            <li>
		
		                                                <a href="../sample/blog-right-sidebar.html">Blog Right Sidebar</a></li>
		                                            <li>
		
		                                                <a href="../sample/blog-sidebar-none.html">Blog Sidebar None</a></li>
		                                            <li>
		
		                                                <a href="../sample/blog-masonry.html">Blog Masonry</a></li>
		                                            <li>
		
		                                                <a href="../sample/blog-detail.html">Blog Details</a></li>
                                                </ul>
                                                <!--====== End - Dropdown ======-->
                                            </li>
                                            <li>
		                                        <a href="../sample/shop-side-version-2.html">VALUE OF THE DAY</a></li>
		                                    <li>
		                                        <a href="../sample/shop-side-version-2.html">GIFT CARDS</a></li>
                                        </ul>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                </ul>
                                <!--====== End - List ======-->
                            </div>
                            <!--====== End - Menu ======-->
                        </div>
                        <!--====== End - Dropdown Main plugin ======-->


                        <!--====== Dropdown Main plugin ======-->
                        <div class="menu-init" id="navigation3">

                            <button class="btn btn--icon toggle-button toggle-button--white fas fa-shopping-bag toggle-button-shop" type="button"></button>

                            <span class="total-item-round">2</span>

                            <!--====== Menu ======-->
                            <div class="ah-lg-mode">

                                <span class="ah-close">✕ Close</span>

                                <!--====== List ======-->
                                <ul class="ah-list ah-list--design1 ah-list--link-color-white">
                                    <li>
                                        <a href="../main/main.do"><i class="fas fa-home u-c-brand"></i></a>
                                    </li>
                                    <li>
                                        <a href="wishlist.html"><i class="far fa-heart"></i></a>
                                    </li>
                                    <li class="has-dropdown">

                                        <a class="mini-cart-shop-link"><i class="fas fa-shopping-bag"></i>

                                            <span class="total-item-round">2</span></a>

                                        <!--====== Dropdown ======-->

                                        <span class="../js-menu-toggle"></span>
                                        <div class="mini-cart">

                                            <!--====== Mini Product Container ======-->
                                            <div class="mini-product-container gl-scroll u-s-m-b-15">

                                                <!--====== Card for mini cart ======-->
                                                <div class="card-mini-product">
                                                    <div class="mini-product">
                                                        <div class="mini-product__image-wrapper">

                                                            <a class="mini-product__link" href="product-detail.html">

                                                                <img class="u-img-fluid" src="../images/product/electronic/product3.jpg" alt=""></a></div>
                                                        <div class="mini-product__info-wrapper">

                                                            <span class="mini-product__category">

                                                                <a href="shop-side-version-2.html">Electronics</a></span>

                                                            <span class="mini-product__name">

                                                                <a href="product-detail.html">Yellow Wireless Headphone</a></span>

                                                            <span class="mini-product__quantity">1 x</span>

                                                            <span class="mini-product__price">$8</span></div>
                                                    </div>

                                                    <a class="mini-product__delete-link far fa-trash-alt"></a>
                                                </div>
                                                <!--====== End - Card for mini cart ======-->


                                                <!--====== Card for mini cart ======-->
                                                <div class="card-mini-product">
                                                    <div class="mini-product">
                                                        <div class="mini-product__image-wrapper">

                                                            <a class="mini-product__link" href="product-detail.html">

                                                                <img class="u-img-fluid" src="../images/product/electronic/product18.jpg" alt=""></a></div>
                                                        <div class="mini-product__info-wrapper">

                                                            <span class="mini-product__category">

                                                                <a href="shop-side-version-2.html">Electronics</a></span>

                                                            <span class="mini-product__name">

                                                                <a href="product-detail.html">Nikon DSLR Camera 4k</a></span>

                                                            <span class="mini-product__quantity">1 x</span>

                                                            <span class="mini-product__price">$8</span></div>
                                                    </div>

                                                    <a class="mini-product__delete-link far fa-trash-alt"></a>
                                                </div>
                                                <!--====== End - Card for mini cart ======-->


                                                <!--====== Card for mini cart ======-->
                                                <div class="card-mini-product">
                                                    <div class="mini-product">
                                                        <div class="mini-product__image-wrapper">

                                                            <a class="mini-product__link" href="product-detail.html">

                                                                <img class="u-img-fluid" src="../images/product/women/product8.jpg" alt=""></a></div>
                                                        <div class="mini-product__info-wrapper">

                                                            <span class="mini-product__category">

                                                                <a href="shop-side-version-2.html">Women Clothing</a></span>

                                                            <span class="mini-product__name">

                                                                <a href="product-detail.html">New Dress D Nice Elegant</a></span>

                                                            <span class="mini-product__quantity">1 x</span>

                                                            <span class="mini-product__price">$8</span></div>
                                                    </div>

                                                    <a class="mini-product__delete-link far fa-trash-alt"></a>
                                                </div>
                                                <!--====== End - Card for mini cart ======-->


                                                <!--====== Card for mini cart ======-->
                                                <div class="card-mini-product">
                                                    <div class="mini-product">
                                                        <div class="mini-product__image-wrapper">

                                                            <a class="mini-product__link" href="product-detail.html">

                                                                <img class="u-img-fluid" src="../images/product/men/product8.jpg" alt=""></a></div>
                                                        <div class="mini-product__info-wrapper">

                                                            <span class="mini-product__category">

                                                                <a href="shop-side-version-2.html">Men Clothing</a></span>

                                                            <span class="mini-product__name">

                                                                <a href="product-detail.html">New Fashion D Nice Elegant</a></span>

                                                            <span class="mini-product__quantity">1 x</span>

                                                            <span class="mini-product__price">$8</span></div>
                                                    </div>

                                                    <a class="mini-product__delete-link far fa-trash-alt"></a>
                                                </div>
                                                <!--====== End - Card for mini cart ======-->
                                            </div>
                                            <!--====== End - Mini Product Container ======-->


                                            <!--====== Mini Product Statistics ======-->
                                            <div class="mini-product-stat">
                                                <div class="mini-total">

                                                    <span class="subtotal-text">SUBTOTAL</span>

                                                    <span class="subtotal-value">$16</span></div>
                                                <div class="mini-action">

                                                    <a class="mini-link btn--e-brand-b-2" href="checkout.html">PROCEED TO CHECKOUT</a>

                                                    <a class="mini-link btn--e-transparent-secondary-b-2" href="cart.html">VIEW CART</a></div>
                                            </div>
                                            <!--====== End - Mini Product Statistics ======-->
                                        </div>
                                        <!--====== End - Dropdown ======-->
                                    </li>
                                </ul>
                                <!--====== End - List ======-->
                            </div>
                            <!--====== End - Menu ======-->
                        </div>
                        <!--====== End - Dropdown Main plugin ======-->
                    </div>
                    <!--====== End - Secondary Nav ======-->
                </div>
            </nav>
            <!--====== End - Nav 2 ======-->
        </header>
        <!--====== End - Main Header ======-->
</body>
</html>