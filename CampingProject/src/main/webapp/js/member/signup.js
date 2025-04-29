let signupApp=Vue.createApp({
	data(){
		return {
			id:'',
			isID:false,
			pwd1:'',
			pwd2:'',
			isPWD:false,
			name:'',
			sex:'',
			birthday:'',
			email:'',
			phone:'',
			post:'',
			addr1:'',
			addr2:'',
			content:'',
			idMsg:'',
			pwdMsg:'',
	    	pwdView1:false,
	    	pwdView2:false
		}
	},
	mounted(){
		const today=new Date
		const day=today.getFullYear()+'-'+(today.getMonth()+1).toString().padStart(2,0)+'-'+today.getDate()
		$('#birthday').attr('max',day)
	},
	methods:{
		cancel(){
			location.href="../main/main.do"
		},
		signup(){
			if(this.isID===false){
				this.$refs.id.focus()
				return
			}
			if(this.isPWD===false){
				this.$refs.pwd2.focus()
				this.pwdView(1)
				this.pwdView(2)
				return
			}
			if(this.name===""){
				this.$refs.name.focus()
				return
			}
			if(this.birthday===""){
				this.$refs.birthday.focus()
				return
			}
			if(this.sex===""){
				this.$refs.sex.focus()
				return
			}
			if(this.email===""){
				this.$refs.email.focus()
				return
			}
			if(this.phone===""){
				this.$refs.phone.focus()
				return
			}
			if(this.post===""){
				this.$refs.post.focus()
				return
			}
			if(this.addr1===""){
				this.$refs.addr1.focus()
				return
			}
			axios.post('../member/signup_insert_vue.do',null,{
				params:{
					id:this.id,
					pwd:this.pwd1,
					name:this.name,
					dbday:this.birthday,
					sex:this.sex,
					email:this.email,
					phone:this.phone,
					post:this.post,
					addr1:this.addr1,
					addr2:this.addr2,
					content:this.content
				}
			}).then(res=>{
				console.log(res.data)
				if(res.data==="yes"){
					location.href="../member/login.do"
				}else{
					console.log(res.data)
					alert("회원가입에 실패했습니다")
				}
			}).catch(error=>{
				console.log(error.response)
			})
		},
		postFind(){
			let _this=this
			new daum.Postcode({
				oncomplete:function(data){
					_this.post=data.zonecode
					_this.addr1=data.address
				}
			}).open()
		},
		phoneFocus(){
			this.phone=''
		},
		phoneCheck(){
			let numbers=this.phone.replace(/\D/g, '')
			
			numbers = numbers.substring(0, 11);
			
			if (numbers.length >= 11) {
				this.phone = numbers.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
			} else if (numbers.length >= 7) {
				this.phone = numbers.replace(/(\d{3})(\d{4})(\d*)/, '$1-$2-$3');
			} else if (numbers.length >= 4) {
				this.phone = numbers.replace(/(\d{3})(\d*)/, '$1-$2');
			} else {
				this.phone = numbers;
			}
		},
		pwdView(num){
			if(num===1){
				if(this.pwdView1){
					this.pwdView1=false
					this.$refs.pwd1.type="password"
				}else{
					this.pwdView1=true
					this.$refs.pwd1.type="text"
				}
			}
			if(num===2){
				if(this.pwdView2){
					this.pwdView2=false
					this.$refs.pwd2.type="password"
				}else{
					this.pwdView2=true
					this.$refs.pwd2.type="text"
				}
			}
		},
		pwdCheck(){
			if(this.pwd1==='' || this.pwd2===''){
				this.pwdMsg=""
				this.isPWD=false
				return
			}
			if(this.pwd1===this.pwd2){
				this.pwdMsg="비밀번호가 일치합니다"
				this.isPWD=true
			}else{
				this.pwdMsg="비밀번호가 일치하지 않습니다"
				this.isPWD=false
			}
		},
		idInput(){
			this.idMsg=""
			this.isID=false
		},
		idCheck(){
			if(this.id===""){
				this.$refs.id.focus()
				return
			}
			/*
			if(this.id.length<10){
				this.idMsg="10~20글자를 입력해주세요"
				$('#idMsg').css("color","red")
				return
			}
			*/
			axios.get('../member/id_check_vue.do',{
				params:{
					id:this.id
				}
			}).then(res=>{
				if(res.data==="yes"){
					this.isID=true
					this.idMsg="사용 가능한 아이디 입니다"
				}else{
					this.isID=false
					this.idMsg="사용 할 수 없는 아이디 입니다"
					console.log(res.data)
				}
			}).catch(error=>{
				console.log(error.response)
			})
		}
	}
}).mount("#signupApp")
