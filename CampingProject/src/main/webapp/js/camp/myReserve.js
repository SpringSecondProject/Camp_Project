let myReserveApp=Vue.createApp({
	data(){
		return {
			list:[],
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0
		}
	},
	mounted(){
		this.dataRecv()
	},
	methods:{
		dataRecv(){
			axios.get('../mypage/reserve_list_vue.do',{
				params:{
					page:this.curpage
				}
			}).then(res=>{
				console.log(res.data)
				this.list=res.data.list
				for(let i=0;i<this.list.length;i++){
					this.list[i].price=new Intl.NumberFormat().format(this.list[i].price)
				}
				this.curpage=res.data.curpage
				this.totalpage=res.data.totalpage
				this.startPage=res.data.startPage
				this.endPage=res.data.endPage
			}).catch(error=>{
				console.log(error.response)
			})
		},
		prev(){
			this.curpage=this.curpage-1
			this.dataRecv()
		},
		next(){
			this.curpage=this.curpage+1
			this.dataRecv()
		},
		pageChange(i){
			this.curpage=i
			this.dataRecv()
		},
		range(start,end){
			let arr=[]
			let len=end-start
			for(let i=0;i<=len;i++){
				arr[i]=start
				start++
			}
			return arr
		},
		reserveCancel(rno){
			if(confirm('취소하시겠습니까?\n취소시 사용한 마일리지는 복구되지 않습니다')){
				
			}else{
				return
			}
			axios.get('../mypage/reserve_cancel_vue.do',{
				params:{
					rno:rno
				}
			}).then(res=>{
				if(res.data=='OK'){
					alert("취소 성공")
				}else{
					alert("취소 실패")
				}
				this.dataRecv()
			}).catch(error=>{
				console.log(error.response)
			})
		},
		reserveConfirmed(rno){
			if(confirm('확정하시겠습니까?\n확정 이후 취소할 수 없습니다')){
				
			}else{
				return
			}
			axios.get('../mypage/reserve_confirmed_vue.do',{
				params:{
					rno:rno
				}
			}).then(res=>{
				if(res.data=='OK'){
					alert("확정 성공")
				}else{
					alert("확정 실패")
				}
				this.dataRecv()
			}).catch(error=>{
				console.log(error.response)
			})
		}
	},
	components:{
		'page-card':page_card
	}
}).mount('#myReserveApp')
