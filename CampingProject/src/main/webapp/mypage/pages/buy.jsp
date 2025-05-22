<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--====== Main App ======-->
<div id="app">
	<!--====== App Content ======-->
	<div class="app-content" id="buyApp">
		<!--====== Section 1 ======-->
		<div class="u-s-p-b-60">

			<!--====== Section Intro ======-->
			<div class="section__intro u-s-m-b-60">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="section__text-wrap">
								<h1 class="section__heading u-c-secondary">결제내역</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--====== End - Section Intro ======-->


			<!--====== Section Content ======-->
			<div class="section__content">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 u-s-m-b-30">
							<div class="table-responsive">
								<h3 class="text-center" style="font-size: 24px" v-if="list.length==0">구매 내역이 없습니다</h3>
							</div>
							<div class="text-center" v-if="list.length!=0">
								<page-card></page-card>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--====== End - Section Content ======-->
		</div>
		<!--====== End - Section 2 ======-->
	</div>
	<!--====== End - App Content ======-->
</div>
<!--====== End - Main App ======-->
<script src="../js/commons/page-card.js"></script>
<script>
let buyApp=Vue.createApp({
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
			axios.get('../mypage/buy_list_vue.do',{
				params:{
					page:this.curpage
				}
			}).then(res=>{
				console.log(res.data)
				this.list=res.data.list
				for(let i=0;i<this.list.length;i++){
					this.list[i].total_priceStr=new Intl.NumberFormat().format(this.list[i].total_price)
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
		}
	},
	components:{
		'page-card':page_card
	}
}).mount('#buyApp')
</script>
</body>
</html>