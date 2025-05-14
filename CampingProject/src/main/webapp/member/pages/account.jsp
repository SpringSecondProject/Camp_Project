<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
	<title></title>
</head>
<body>
<div id="accountApp" class="flex flex-col w-full h-full px-8">
	<div class="flex flex-col justify-center align-center mb-12 p-12 gap-4 w-full shadow-lg">
		<p class="w-full text-left font-normal text-3xl">계정</p>
		<div class="flex flex-row w-full h-full gap-6 justify-around">
			<div class="flex flex-col p-8 text-left shadow-lg bg-gray-100 w-full">
				<p class="dash__h2 u-s-m-b-8">
					내 프로필
				</p>
				<p class="dash__text">
					{{ vo.nickname ? vo.nickname : vo.id }}
				</p>
				<p class="dash__text">
					{{ vo.name }}
				</p>
				<p class="dash__text">
					{{ vo.email }}
				</p>
				<div class="dash__link dash__link--secondary u-s-m-b-8">
					<a href="../member/profile/profileEdit.do">
						> 수정하기
					</a>
				</div>
			</div>
			<div class="flex flex-col p-8 text-left shadow-lg bg-gray-100 w-full">
				<p class="dash__h2 u-s-m-b-8">
					배송지 및 연락처
				</p>
				<p class="dash__text-2 u-s-m-b-8">
					{{ vo.post }}&nbsp;{{ vo.addr1 }}&nbsp;{{ vo.addr2 }}
				</p>
				<p class="dash__text">{{ vo.phone }}</p>
			</div>
			<div class="flex flex-col p-8 text-left shadow-lg bg-gray-100 w-full">
				<h2 class="dash__h2 u-s-m-b-8">BILLING ADDRESS</h2>
				<span class="dash__text-2 u-s-m-b-8">Default Billing Address</span>
				<span class="dash__text">4247 Ashford Drive Virginia - VA-20006 - USA</span>
				<span class="dash__text">(+0) 900901904</span>
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

							<img class="u-img-fluid"
							     src="../../sample/images/product/electronic/product3.jpg"
							     alt=""></div>
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

							<img class="u-img-fluid"
							     src="../../sample/images/product/electronic/product14.jpg"
							     alt=""></div>
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

							<img class="u-img-fluid"
							     src="../../sample/images/product/men/product8.jpg"
							     alt=""></div>
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

							<img class="u-img-fluid"
							     src="../../sample/images/product/women/product10.jpg"
							     alt=""></div>
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
      const param = new URLSearchParams(window.location.search)
      return {
        id: param.get('id'),
        vo: []
      }
    },
    mounted() {
      this.dataRecv()
      console.log(vo.nickname)
    },
    methods: {
      dataRecv() {
        axios.get('/web/member/account_vue.do', {
          params: {
            id: this.id
          }
        }).then(res => {
          this.vo = res.data
        }).catch((e) => {
          console.log(e)
        })
      }
    }
  }).mount('#accountApp')
</script>
</body>
