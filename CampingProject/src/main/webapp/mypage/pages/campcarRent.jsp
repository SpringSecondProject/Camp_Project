<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
	<title></title>
</head>
<body>
<div id="accountApp" class="flex flex-col w-full h-full items-center px-12 gap-4">
	<p class="text-4xl font-bold py-12">캠핑카 렌트 내역</p>
	<div v-for="item in list"
	     class="flex flex-col w-full border border-gray-200 rounded-xl gap-8">
		<div class="flex flex-row w-full p-8 gap-12">
			<div class="relative size-40 bg-gray-400 rounded-xl">
				<img :src="item.poster || '../assets/images/no_image.webp'" alt=""
				     class="absolute w-full h-full object-fill rounded-xl"/>
			</div>
			<div class="flex flex-col w-2/3 items-start justify-center text-left gap-2">
				<p class="text-2xl text-black">{{ item.name }}</p>
				<p class="text-xl">수용인원 : {{ item.capacity }}명</p>
				<p class="text-xl">예약일 : {{ formatDate(item.regdate) }}</p>
				<p class="text-xl">기간 : {{ formatDate(item.startdate) }} ~ {{
					formatDate(item.enddate) }}</p>
			</div>
			<div class="flex w-1/3 h-full items-center justify-center">
				<p class="text-2xl text-black">{{ formatPrice(item.price) }}원</p>
			</div>
		</div>
	</div>
</div>

<script>
  let accountApp = Vue.createApp({
    data() {
      return {
        list: {},
        detail: {},
        curpage: 1,
        totalpage: 0,
        startPage: 0,
        endPage: 0,
        rowSize: 12,
      }
    },
    mounted() {
      this.dataRecv()
    },
    methods: {
      dataRecv() {
        axios.get('/web/mypage/campcarrent_vue.do', {
          params: {
            id: '${sessionScope.userid}',
            page: this.curpage,
          }
        }).then(res => {
          console.log(res.data)
          this.list = res.data.list
          console.log(this.list)
        }).catch(e => {
          console.error(e)
        })
      },
      prev() {
        this.curpage = this.startPage - 1
        this.dataRecv()
      },
      next() {
        this.curpage = this.endPage + 1
        this.dataRecv()
      },
      pageChange(page) {
        this.curpage = page
        this.dataRecv()
      },
      range(start, end) {
        let arr = []
        let len = end - start
        for (let i = 0; i <= len; i++) {
          arr[i] = start
          start++
        }
        return arr
      },
      formatPrice(price) {
        return (price || 0).toLocaleString('ko-KR');
      },
      formatDate(date) {
        let data = new Date(date)
        return data.getFullYear().toString().slice(-2) + "." + (data.getMonth() + 1) + "."
            + data.getDate()
      },
    }
  }).mount('#accountApp')
</script>
</body>
