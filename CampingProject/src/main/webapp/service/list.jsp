<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
	<title>QnA</title>
	<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div id="serviceListApp"
     class="flex flex-col w-screen min-h-screen justify-start items-center gap-6 py-14 my-10">
	<div class="flex justify-between items-center w-1/2 mb-10">
		<form>
			<label for="default-search"
			       class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
			<div class="relative w-80">
				<input type="search" id="default-search"
				       class="block w-full p-4 text-xl text-gray-900 border border-gray-300 rounded-xl bg-gray-50 focus:ring-blue-500 focus:border-blue-500"
				       placeholder="" required/>
				<button type="submit"
				        class="absolute top-3 right-4 bg-gray-800 hover:bg-blue-300 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-lg px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
					<svg class="w-4 h-6 text-white" aria-hidden="true"
					     xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
						<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
						      stroke-width="2"
						      d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"></path>
					</svg>
				</button>
			</div>
		</form>
		<button type="button"
		        @click="goWrite()"
		        class="w-40 h-14 text-white bg-gray-800 hover:bg-gray-900 focus:outline-none focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-2xl px-5 py-2.5 me-2 mb-2 hover:-translate-y-2 hover:duration-700">
			작성하기
		</button>
	</div>
	<div v-for="item in list"
	     @click="goDetail(item.id)"
	     class="flex flex-col w-1/2 shadow-lg rounded-2xl p-10 hover:shadow-xl hover:cursor-pointer gap-4 hover:-translate-y-2 hover:duration-700">
		<div class="flex justify-between">
			<p class="text-xl text-gray-600">
				{{ formatDate(item.regdate) }}
			</p>
			<p class="text-xl text-gray-600 ${item.ok == 0 ? 'text-green-600' : 'text-gray-600'}">{{
				item.ok == 0 ? '답변대기' : '답변완료' }}</p>
		</div>
		<p class="text-3xl font-bold text-gray-950">
			{{ item.title }}
		</p>
		<p class="text-2xl text-gray-600">
			{{ item.content }}
		</p>
	</div>
	<div class="pt-20 pb-40 w-1/2">
		<!--====== Pagination ======-->
		<ul class="shop-p__pagination d-flex justify-content-center align-items-center gap-2 flex-wrap mt-3">
			<li v-if="startPage>1"
			    class="hover:-translate-y-2 hover:duration-700">
				<a class="fas fa-angle-left" @click.prevent="prev()"></a>
			</li>
			<li :class="i===curpage?'is-active':''"
			    class="hover:-translate-y-2 hover:duration-700"
			    v-for="i in range(startPage, endPage)" :key="i">
				<a @click.prevent="pageChange(i)">{{i}}</a>
			</li>
			<li v-if="endPage < totalpage"
			    class="hover:-translate-y-2 hover:duration-700">
				<a class="fas fa-angle-right" @click.prevent="next()"></a>
			</li>
		</ul>
		<!--====== End - Pagination ======-->
	</div>
</div>
<script>
  let serviceListApp = Vue.createApp({
    data() {
      return {
        userid: '',
        list: [],
        curpage: 1,
        totalpage: 0,
        startPage: 0,
        endPage: 0,
        rowSize: 12,
      }
    },
    mounted() {
      this.dataRecv()
      this.userid = '${sessionScope.userid}'
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
      dataRecv() {
        axios.get('/web/service/list_vue.do', {
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
      formatDate(date) {
        let data = new Date(date)
        return data.getFullYear().toString().slice(-2) + "." + (data.getMonth() + 1) + "."
            + data.getDate() + " " + data.getHours() + ":" + data.getMinutes();
      },
      goDetail(id) {
        location.href = '/web/service/detail.do?id=' + id
      },
      goWrite() {
        if (!this.userid) {
          alert('로그인이 필요합니다.')
        } else {
          location.href = '/web/service/write.do?id=' + this.userid;
        }
      }
    }
  }).mount("#serviceListApp")
</script>
</body>