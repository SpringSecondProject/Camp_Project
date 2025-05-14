<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
	<title></title>
</head>
<body>
<div id="profileApp" class="flex flex-col w-full h-auto p-8 gap-4 shadow-lg">
	<p class="font-bold text-3xl text-gray-800">
		내 프로필
	</p>

	<div class="my-4 w-full border-b border-gray-400"></div>

	<div class="grid grid-cols-3 ">
		<div class="flex flex-col w-full h-40 gap-4" v-for="(value, key, index) in items"
		     :key="key">
			<p class="font-bold text-2xl">
				{{ key }}
			</p>
			<p v-show="!mode" class="text-xl whitespace-pre-wrap">
				{{ value }}
			</p>
			<div v-show="mode" class="relative w-full h-full">
				<input v-if="index === 0 || index === 1 || index === 2" type="text"
				       class="font-bold text-2xl px-4 py-2 border bg-gray-200 cursor-not-allowed"
				       :value="value" disabled :placeholder="value"/>
				<input v-else type="text"
				       class="font-bold text-2xl px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
				       :placeholder="value" v-model="inputValue[key]"/>
			</div>
		</div>
	</div>
	<div v-show="!mode" class="flex flex-row gap-8">
		<a @click="mode = true"
		   class="text-black rounded-lg text-xl hover:font-bold underline underline-offset-4">
			수정하기
		</a>
		<a class="text-black rounded-lg text-xl hover:font-bold underline underline-offset-4">
			회원탈퇴
		</a>
	</div>
	<div v-show="mode" class="flex flex-row gap-8">
		<a @click="onCommit()"
		   class="text-black rounded-lg text-xl hover:font-bold underline underline-offset-4">
			수정완료
		</a>
		<a @click="mode = false"
		   class="text-black rounded-lg text-xl hover:font-bold underline underline-offset-4">
			취소
		</a>
	</div>
</div>
<script>
  let profileApp = Vue.createApp({
    data() {
      return {
        mode: false,
        items: {},
        inputValue: {}
      }
    },
    mounted() {
      this.dataRecv()
    },
    methods: {
      dataRecv() {
        axios.get('/web/member/profile_vue.do', {
          params: {
            id: '${sessionScope.userid }'
          }
        })
        .then(res => {
          this.items = res.data
          this.inputValue = {...res.data}
        }).catch(e => {
          console.log(e)
        })
      },
      onCommit() {
        console.log('onCommit', this.inputValue);
        // 서버로 수정된 데이터 전송
        axios.post('/web/member/profile_update_vue.do', {
          id: '${sessionScope.userid }',
          ...this.inputValue
        }).then(res => {
          this.items = {...this.inputValue}; // 화면에 반영
          this.mode = false;
        }).catch(e => {
          console.log('Update failed', e);
        });
      }
    }
  }).mount('#profileApp')
</script>
</body>
