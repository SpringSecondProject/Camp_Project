<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
	<title></title>
	<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div id="serviceDetailApp"
     class="flex flex-col w-1/2 min-h-screen justify-start items-center gap-6 my-16 mx-auto">
	<div class="flex w-full justify-start items-center p-4 bg-gray-200 mb-12">
		<ul class="breadcrumb__list w-full p-4 bg-gray-100">
			<li class="has-separator">
				<a href="../main/main.do">Home</a></li>
			<li class="has-separator">
				<a href="../service/list.do">QnA</a></li>
			<li class="is-marked">
				<a href="#">상세보기</a></li>
		</ul>
	</div>
	<div class="flex flex-col justify-start text-left gap-4 w-full">
		<!-- 제목 -->
		<div class="flex flex-row justify-between items-center w-full">
			<p class="font-bold text-5xl text-black w-full">
				{{ qvo.title }}
			</p>
			<div class="flex flex-row w-full justify-end items-center gap-4">
				<p class="text-2xl">
					{{ qvo.ok == 0 ? '답변대기' : '답변완료' }}
				</p>
				<button type="button"
				        v-show="qvo.pid == userid"
				        onclick="deleteQuestion()"
				        class="bg-red-200 hover:bg-red-300 focus:outline-none font-medium rounded-lg text-2xl px-5 py-2.5 me-2 mb-2">
					삭제
				</button>
			</div>
		</div>
		<!-- 작성 정보 -->
		<p class="text-2xl">
			{{ formatDate(qvo.regdate) }}
		</p>
		<!-- 본문 내용 -->
		<p class="text-3xl my-12">
			{{ qvo.content }}
		</p>
		<!-- 작성자 정보 -->
		<div class="text-2xl">
			작성자 : {{ writer }}
		</div>
	</div>

	<div class="mt-4 mb-12 w-full border-b border-gray-400"></div>

	<!-- 답변 -->
	<div v-show="qvo.ok == 1" class="container my-6 flex flex-col w-full">
		<div class="flex flex-row justify-between items-center w-full">
			<p class="font-bold text-5xl text-black w-full">
				{{ qvo.title }}
			</p>
			<div class="flex flex-row w-full justify-end items-center gap-4">
				<button type="button"
				        v-show="qvo.pid == userid"
				        onclick="deleteQuestion()"
				        class="bg-red-200 hover:bg-red-300 focus:outline-none font-medium rounded-lg text-2xl px-5 py-2.5 me-2 mb-2">
					삭제
				</button>
			</div>
		</div>
		<!-- 제목 -->
		<p class="fw-bold my-2">
			{{ avo.title }}
		</p>
		<!-- 작성 정보 -->
		<p class="text-2xl">
			{{ formatDate(avo.regdate) }}
		</p>
		<!-- 본문 내용 -->
		<p class="text-3xl my-12">
			{{ avo.content }}
		</p>
	</div>
</div>
<script>
  let serviceDetailApp = Vue.createApp({
    data() {
      const param = new URLSearchParams(window.location.search)
      return {
        id: param.get('id'),
        userid: '',
        writer: '',
        qvo: [],
        avo: []
      }
    },
    mounted() {
      this.dataRecv()
    },
    methods: {
      dataRecv() {
        axios.get('/web/service/detail_vue.do', {
          params: {
            id: this.id,
          }
        }).then(res => {
          this.qvo = res.data.qvo
          this.userid = res.data.userid
          this.writer = res.data.writer
          if (res.data.avo != null) {
            this.avo = res.data.avo
          }
        }).catch(error => {
          console.log(error)
          throw Error(res.statusText)
        })
      },
      formatDate(date) {
        let data = new Date(date)
        return data.getFullYear().toString().slice(-2) + "." + (data.getMonth() + 1) + "."
            + data.getDate() + " " + data.getHours() + ":" + data.getMinutes();
      },
      deleteQuestion() {
        if (confirm("정말 삭제하시겠습니까?")) {
          <%--fetch('/Project_Main/service/delete.do?id=${svo.id }', {method: 'get'});--%>
          alert("삭제되었습니다!")
          setInterval(() => {
            // location.href = "/Project_Main/service/main.do"
          }, 2000)
        }
      }
    }
  }).mount("#serviceDetailApp")
</script>
</body>
