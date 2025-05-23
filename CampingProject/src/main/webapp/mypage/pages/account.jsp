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
				<p class="text-2xl text-gray-800">마일리지 내역 : {{mileage}} 포인트</p>
				<p class="text-xl" v-for="m in list">{{m.regdateStr}} : {{m.state}}({{m.point}})</p>
			</div>
		</div>
	</div>
</div>

<script>
  let accountApp = Vue.createApp({
    data() {
      return {
        vo: {},
        list: [],
        mileage: ''
      }
    },
    mounted() {
      axios.get('../mypage/account_vue.do', {
        params: {
          id: '${sessionScope.userid}'
        }
      }).then(res => {
        this.vo = res.data
      }).catch(e => {
        console.error(e)
      })
      axios.get('../mypage/mileage_list_vue.do', {
        params: {
          page: 1
        }
      }).then(res => {
        const maxLength = Math.min(5, res.data.list.length)
        for (let i = 0; i < maxLength; i++) {
          this.list[i] = res.data.list[i]
          if (i == 0) {
            this.mileage = new Intl.NumberFormat().format(res.data.list[i].total_point)
          }
        }
        for (let i = 0; i < maxLength; i++) {
          this.list[i].point = new Intl.NumberFormat().format(this.list[i].point)
          this.list[i].total_point = new Intl.NumberFormat().format(this.list[i].total_point)
        }
      }).catch(error => {
        console.log(error.response)
      })
    },
  }).mount('#accountApp')
</script>
</body>
