let loginApp=Vue.createApp({
	data(){
		return {
			id:'',
			pwd:'',
			
		}
	},
	methods:{
		cancel(){
			location.href="../main/main.do"
		},
		login(){
			if(this.id===''){
				this.$refs.id.focus()
				return
			}
			if(this.pwd===''){
				this.$refs.pwd.focus()
				return
			}
			$('#frm').submit()
		}
	}
}).mount('#loginApp')