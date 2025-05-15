<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
	<title></title>
</head>
<body>
<div id="accountApp" class="flex flex-col w-full h-full">
	<div class="flex flex-col justify-center align-center mb-12 p-12 gap-4 w-full shadow-lg">
		<p class="w-full text-left font-normal text-3xl">내 계정</p>
		<div class="flex flex-row w-full h-full gap-6 justify-around">
			<div class="flex flex-col px-8 py-6 text-left shadow-lg bg-gray-100 w-full gap-2">
				<p class="text-2xl text-gray-800">내 프로필</p>
				<p class="text-xl">{{ vo.nickname }}</p>
				<p class="text-xl">{{ vo.email }}</p>
				<p class="text-xl">{{ vo.name }}</p>
			</div>
			<div class="flex flex-col px-8 py-6 text-left shadow-lg bg-gray-100 w-full gap-2">
				<p class="text-2xl text-gray-800">배송지 및 연락처</p>
				<p class="text-xl">{{ vo.addr }}</p>
				<p class="text-xl">{{ vo.phone }}</p>
			</div>
			<div class="flex flex-col px-8 py-6 text-left shadow-lg bg-gray-100 w-full gap-2">
				<p class="text-2xl text-gray-800">BILLING ADDRESS</p>
				<p class="text-xl">Default Billing Address</p>
				<p class="text-xl">4247 Ashford Drive Virginia - VA-20006 - USA</p>
				<p class="text-xl">(+0) 900901904</p>
			</div>
		</div>
	</div>
	<div class="dash__box dash__box--shadow dash__box--bg-white dash__box--radius">
		<h2 class="dash__h2 u-s-p-xy-20">RECENT ORDERS</h2>
		<div class="dash__table-wrap gl-scroll">
			<table class="dash__table">
				<thead>
				<tr>
					<th>Order #</th>
					<th>Placed On</th>
					<th>Items</th>
					<th>Total</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>3054231326</td>
					<td>26/13/2016</td>
					<td>
						<div class="dash__table-img-wrap">

						</div>
					</td>
					<td>
						<div class="dash__table-total">

							<span>$126.00</span>
							<div class="dash__link dash__link--brand">

								<a href="#">MANAGE</a>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>3054231326</td>
					<td>26/13/2016</td>
					<td>
						<div class="dash__table-img-wrap">

						</div>
					</td>
					<td>
						<div class="dash__table-total">

							<span>$126.00</span>
							<div class="dash__link dash__link--brand">

								<a href="#">MANAGE</a>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>3054231326</td>
					<td>26/13/2016</td>
					<td>
						<div class="dash__table-img-wrap">
						</div>
					</td>
					<td>
						<div class="dash__table-total">

							<span>$126.00</span>
							<div class="dash__link dash__link--brand">

								<a href="#">MANAGE</a>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>3054231326</td>
					<td>26/13/2016</td>
					<td>
						<div class="dash__table-img-wrap">

						</div>
					</td>
					<td>
						<div class="dash__table-total">

							<span>$126.00</span>
							<div class="dash__link dash__link--brand">

								<a href="#">MANAGE</a>
							</div>
						</div>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
  let accountApp = Vue.createApp({
    data() {
      return {
        vo: {},
      }
    },
    mounted() {
      axios.get('/web/mypage/account_vue.do', {
        params: {
          id: '${sessionScope.userid}'
        }
      }).then(res => {
        this.vo = res.data
      }).catch(e => {
        console.error(e)
      })
    },
  }).mount('#accountApp')
</script>
</body>
