<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
	<title></title>
</head>
<body>
<div id="serviceDetailApp"
     class="flex flex-col w-1/2 min-h-screen justify-start items-center gap-6 my-24 mx-auto">
	<div class="flex flex-row w-full justify-end items-center"
	     v-show="qvo.pid == userid">
		<button type="button"
		        onclick="deleteQuestion()"
		        class="bg-red-200 hover:bg-red-300 focus:outline-none font-medium rounded-lg text-2xl px-5 py-2.5 me-2 mb-2">
			삭제
		</button>
	</div>

	<div class="flex flex-col justify-start text-left gap-4 w-full">
		<!-- 제목 -->
		<p class="font-bold text-5xl text-black">
			{{ qvo.title }}
		</p>
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
			작성자: {{ writer }}
		</div>
	</div>

	<div class="mt-4 mb-12 w-full border-b border-gray-400"></div>

	<!-- 답변 -->
	<div v-show="qvo.ok == 1" class="container my-5" style="max-width: 800px;">
		<p class="badge bg-success my-2">
			답변
		</p>
		<!-- 제목 -->
		<h3 class="fw-bold my-2">
			{{ avo.title }}
		</h3>
		<!-- 작성 정보 -->
		<p>
			{{ formatDate(avo.regdate) }}
		</p>
		<!-- 본문 내용 -->
		<p class="mt-4 mb-12">
			{{ avo.content }}
		</p>
	</div>
</div>
<script>
  let serviceDetailApp = Vue.createApp({
    data() {
      return {
        id: '',
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
        const param = new URLSearchParams(window.location.search)
        axios.get('/web/service/detail_vue.do', {
          params: {
            id: param.get('id'),
          }
        }).then(res => {
          this.qvo = res.data.qvo
          this.id = res.data.userid
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
