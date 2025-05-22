<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
  <!--====== App Content ======-->
  <div class="app-content"id="cartApp">
    <div id="cart-data" 
         data-cno="${param.cno}" 
         data-point="${sessionScope.point}"
         data-userid="${sessionScope.userid}">
    </div>>
    <!-- Section 2 -->
    <div class="u-s-p-b-60">
      <div class="section__intro u-s-m-b-60">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <div class="section__text-wrap">
                <h1 class="section__heading u-c-secondary">장바구니</h1>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Section Content -->
      <div class="section__content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
              <!-- Wishlist Products -->
              <div class="w-r u-s-m-b-30" v-for="item in cartItems" :key="item.ino">
                <div class="w-r__container" :data-price="item.salePrice" :data-qty="item.account" :data-ino="item.ino">
                  <div class="w-r__wrap-1">
                    <div class="w-r__img-wrap">
                      <img class="u-img-fluid" :src="'https://www.ocamall.com' + item.ivo.poster" alt="">
                    </div>
                    <div class="w-r__info">
                      <span class="w-r__name">
                        <a :href="'../item/detail.do?ino=' + item.ino">{{ item.ivo.name }}</a>
                      </span>
                      <span class="w-r__category">{{ item.ivo.type }}</span>
                      <span class="w-r__price">
                        {{ item.recPrice }}원
                        <input type="hidden" class="priceValue" :value="item.salePrice">
                        <span class="w-r__discount">{{ item.ivo.price }}원</span>
                      </span>
                      <div class="input-counter">
                        <span class="input-counter__minus fas fa-minus" @click="changeQuantity(item.ino, 'minus')"></span>
                        <input type="number" class="input-counter__text input-counter--text-primary-style" v-model="item.account" :data-default="item.account">
                        <span class="input-counter__plus fas fa-plus" @click="changeQuantity(item.ino, 'plus')"></span>
                      </div>
                    </div>
                  </div>
                  <div class="w-r__wrap-2">
                    <a class="w-r__link btn--e-transparent-platinum-b-2" href="#" @click="removeFromCart(item.ino)">삭제</a>
                  </div>
                </div>
              </div>
            </div>

            <!-- Total Price and Buy Button -->
            <div class="col-lg-12">
              <div class="w-r__wrap-2">
                <span class="route-box__link">총 결제 금액: {{ totalPriceStr }}원</span>
                <a class="w-r__link btn--e-brand-b-2" @click="buyItems">BUY</a>
              </div>
            </div>

            <!-- Continue Shopping and Reset Cart -->
            <div class="col-lg-12">
              <div class="route-box">
                <div class="route-box__g">
                  <a class="route-box__link" href="../item/list.do">
                    <i class="fas fa-long-arrow-alt-left"></i><span>쇼핑 계속하기</span>
                  </a>
                </div>
                <div class="route-box__g">
                  <a class="route-box__link" href="#" @click="resetCart"> <i class="fas fa-trash"></i> <span>초기화</span> </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

<script>
var IMP = window.IMP; 
IMP.init("imp42434332");
let cartApp=Vue.createApp({
  data() {
    return {
      userId:'',
      cartItems: [], // 장바구니 아이템
      totalPrice: 0, // 총 가격
      totalPriceStr:'' // 총 가격 문자열
    };
  },
  mounted() {
	    this.userId = $('#cart-data').data('userid');
	    // 장바구니 아이템을 가져오는 메소드 호출
	    this.getCartItems();
  },
  methods: {
    getCartItems() {    // 장바구니 아이템 가져오기
      axios.get(`../item/get_cart_items.do`,{
    	  params:{
    		  id:this.userId
    	  }
      })
        .then(response => {
          this.cartItems = response.data;
          this.recalculateTotalPrice();
        })
        .catch(error => {
          console.error('Error fetching cart items:', error);
        });
    },
    changeQuantity(ino, action) {    // 수량 변경
      const item = this.cartItems.find(item => item.ino === ino);
      if (action === 'plus') {
        item.account++;
      } else if (action === 'minus' && item.account > 1) {
        item.account--;
      }
      this.modifyAccount(item);
    },
    modifyAccount(item) {    // 수량 변경 서버 반영
      axios.post('../item/item_modify.do',null, {
    	  params:{
	          id: this.userId,
	          cno: item.cno,
	          account: item.account
    	  }
        })
        .then(response => {
	    	this.getCartItems();
        })
        .catch(error => {
          console.error('Error modifying item:', error);
        });
    },
    removeFromCart(ino) {    // 장바구니에서 아이템 제거
      axios
        .post('../item/cart_delete.do',null,{params:{ ino, id: this.userId }})
        .then(response => {
          this.getCartItems(); // 아이템 목록 새로고침
        })
        .catch(error => {
          console.error('Error removing item:', error);
        });
    },
    recalculateTotalPrice() {    // 총 금액 재계산
    	this.totalPrice=0
    	this.totalPriceStr=''
    	for(let i=0;i<this.cartItems.length;i++){
    		let price=Number(this.cartItems[i].ivo.price.replaceAll(',',''))
    		let dis=(100-this.cartItems[i].ivo.discount)/100
    		let totalprice=this.cartItems[i].account*price*dis
    		this.totalPrice+=totalprice
    		this.cartItems[i].recPrice=totalprice
    	}
    	this.totalPriceStr=new Intl.NumberFormat().format(this.totalPrice)
    },
    resetCart() {    // 장바구니 초기화
      axios
        .post('../item/cart_reset.do',null,{params:{ id: this.userId }})
        .then(response => {
        	this.getCartItems()
        })
        .catch(error => {
          console.error('Error resetting cart:', error);
        });
    },
    buyItems() {    // 장바구니 결제
      // 결제 로직 구현
    	let formData=new FormData()
		formData.append("total_price",this.totalPrice);
		for(let i=0;i<this.cartItems.length;i++){
			formData.append("carts",this.cartItems[i].cno)
		}
      axios.post('../item/cart_buy.do',formData)
      .then(res=>{
    	  console.log(res.data)
    	  if(res.data=="yes"){
	    	  this.requestPay()
    	  }else{
    		  alert("결제 실패")
    	  }
      })
    },
    requestPay() {
	    IMP.request_pay({
	        pg: "kakaopay",
	        pay_method: "card",
	        merchant_uid: "ORD20180131-0000011",
	        name: "장바구니 전체 결제",
	        amount: this.totalPrice,
	        buyer_email: '',
	        buyer_name: '',
	        buyer_tel:'',
	        buyer_addr: '',
	        buyer_postcode: ''
	    }, function (rsp) {
	    	alert("구매 완료!!")
	    	location.href="../mypage/buy.do"
	    })
	},
  }
}).mount('#cartApp');
</script>
</body>
</html>