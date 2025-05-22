<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.google.gson.Gson"%>
<head>
	<title>결제 페이지</title>
	<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div id="paymentApp" class="flex flex-col items-center w-screen min-h-screen p-12">
	<div class="flex flex-col w-2/3 h-full mx-auto">
		<jsp:include page="components/breadcrumb.jsp"/>
		<div class="flex flex-row gap-8">
			<div class="flex flex-col w-1/2 p-8 rounded-xl border border-gray-400 gap-8">
				<p class="text-3xl font-bold">제품 정보</p>
				<p class="text-2xl">모델명: {{ item.name }}</p>
				<p class="text-2xl">최대인원: {{ item.capacity }}명</p>
				<p class="text-2xl">기본가격: {{ formatPrice(item.price) }}원</p>
				<p class="text-2xl">일일가격: {{ formatPrice(item.price / 6) }}원</p>
			</div>
			<div class="flex flex-col w-1/2 p-8 rounded-xl border border-gray-400 gap-8">
				<p class="text-3xl font-bold">결제 정보</p>
				<p class="text-2xl">예약자: {{ payment.pid }}</p>
				<p class="text-2xl">시작 날짜: {{ payment.startDate }}</p>
				<p class="text-2xl">종료 날짜: {{ payment.endDate }}</p>
				<p class="text-2xl">제품 가격: {{ formatPrice(payment.price) }}원</p>
				<p class="text-2xl">총 가격: {{ formatPrice(payment.finalPrice) }}원</p>
				<button class="px-8 py-4 bg-blue-500 text-white rounded-xl shadow-lg hover:bg-blue-600 font-normal text-2xl mt-8"
				        @click="completePayment">
					결제 완료
				</button>
			</div>
		</div>
	</div>
</div>
<script>
  let paymentApp = Vue.createApp({
    data() {
      return {
        item: {},
        payment: <%= session.getAttribute("payment") != null ?
                    new com.google.gson.Gson().toJson(session.getAttribute("payment")) : "{}" %> 
      }
    },
    mounted() {
      this.dataRecv()
    },
    methods: {
      dataRecv() {
        axios.get('/web/campcar/detail_vue.do', {
          params: {
            id: this.payment.cid
          }
        }).then(res => {
          this.item = res.data
        }).catch(error => {
          console.log(error.response)
        })
      },
      formatPrice(price) {
        return (price || 0).toLocaleString('ko-KR');
      },
      completePayment() {
        axios.get('/web/campcar/clearSession.do').then(() => {
          alert('결제가 완료되었습니다.');
          location.href = '/web/campcar/list.do';
        }).catch(error => {
          console.error(error.response);
          alert('결제 처리 중 오류가 발생했습니다.');
        });
      }
    }
  }).mount('#paymentApp')
</script>
</body>