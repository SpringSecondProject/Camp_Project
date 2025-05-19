<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
	<title></title>
	<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div id="campcarListApp" class="flex w-screen min-h-screen justify-center align-start p-12">
	<div class="flex flex-col w-2/3">
		<jsp:include page="components/breadcrumb.jsp"/>
		<div class="grid grid-cols-4 w-full gap-12 px-8">
			<div v-for="item in list"
			     :key="item.id"
			     @click="goDetail(item.id)"
			     class="flex flex-col w-100 h-140 shadow-lg rounded-xl hover:shadow-xl hover:cursor-pointer">
				<div class="relative w-full h-80 bg-gray-400 rounded-t-xl">
					<img :src="item.poster || '../assets/images/no_image.webp'" alt=""
					     class="absolute w-full h-full object-fill rounded-t-xl"/>
				</div>
				<div class="flex flex-col font-normal text-2xl p-4">
					<p class="text-gray-900 font-bold">{{ item.name }}</p>
					<p class="text-gray-600">최대 {{ item.capacity }}명</p>
					<p class="text-gray-900">{{ formatPrice(item.price) }}원~</p>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
  let campcarListApp = Vue.createApp({
    data() {
      return {
        list: [],
        curpage: 1,
        totalpage: 0,
        startPage: 0,
        endPage: 0,
        rowSize: 12,
      }
    },
    mounted() {
      axios.get('/web/campcar/list_vue.do', {
        params: {
          page: this.curpage,
          rowSize: this.rowSize,
        }
      }).then(res => {
        this.list = res.data.list
        this.curpage = res.data.curpage
        this.totalpage = res.data.totalpage
        this.startPage = res.data.startPage
        this.endPage = res.data.endPage
      }).catch(error => {
        console.log(error.response)
      })
    },
    methods: {
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
      goDetail(id) {
        location.href = '/web/campcar/detail.do?id=' + id
      },
      formatPrice(price) {
        return (price || 0).toLocaleString('ko-KR');
      }
    }
  }).mount('#campcarListApp')
</script>
</body>