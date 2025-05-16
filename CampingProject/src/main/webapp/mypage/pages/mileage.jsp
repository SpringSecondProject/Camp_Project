<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
	<title></title>
<style type="text/css">
td p{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
<!--====== Main App ======-->
<div id="app">
	<!--====== App Content ======-->
	<div class="app-content" id="myMileageApp">
		<!--====== Section 1 ======-->
		<div class="u-s-p-b-60">

			<!--====== Section Intro ======-->
			<div class="section__intro u-s-m-b-60">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="section__text-wrap">
								<h1 class="section__heading u-c-secondary">마일리지 조회</h1>
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
								<table class="table" style="font-size: 16px">
									<tr>
										<th class="text-center" width="10%">번호</th>
										<th class="text-center" width="20%">적립일</th>
										<th class="text-center" width="50%"></th>
										<th class="text-center" width="15%">잔여포인트</th>
									</tr>
									<tr v-for="vo in list" :style="(vo.state==='적립'?'background-color:#F0FFF0;':'background-color:#FFF0F5;')+'color: black;'">
										<td class="text-center" width="10%">{{vo.num}}</td>
										<td class="text-center" width="20%">{{vo.regdateStr}}</td>
										<td width="50%"><p>{{vo.describe}}</p></td>
										<td class="text-center" width="15%">{{vo.total_point}} Point</td>
									</tr>
								</table>
							</div>
							<div class="text-center">
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
let myMileageApp=Vue.createApp({
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
			axios.get('../mypage/mileage_list_vue.do',{
				params:{
					page:this.curpage
				}
			}).then(res=>{
				console.log(res.data)
				this.list=res.data.list
				for(let i=0;i<this.list.length;i++){
					this.list[i].point=new Intl.NumberFormat().format(this.list[i].point)
					this.list[i].total_point=new Intl.NumberFormat().format(this.list[i].total_point)
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
}).mount('#myMileageApp')
</script>
</body>