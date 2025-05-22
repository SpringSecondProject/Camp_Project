<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.cart-row:hover{
	background-color: #F0FFF0;
	cursor: pointer;
}
</style>
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
								<h1 class="section__heading u-c-secondary">구매내역</h1>
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
								<table class="table" v-if="list.length!=0">
									<tr style="font-size: 18px">
										<th class="text-center" width="10%">번호</th>
										<th class="text-center" width="50%">구매일</th>
										<th class="text-center" width="20%">결제금액</th>
										<th class="text-center" width="20%"></th>
									</tr>
									<tr v-for="vo in list" style="font-size: 16px">
										<td colspan="4">
											<table class="table" style="margin-bottom: 0px">
												<tr style="background-color: #dcdcdc">
													<td class="text-center" width="10%">{{vo.num}}</td>
													<td class="text-center" width="50%">{{vo.regdateStr}}</td>
													<td class="text-center" width="20%">{{vo.total_priceStr}}원</td>
													<td class="text-center" width="20%">
														<a class="btn btn-sm btn-primary" :id="'dBtn-'+vo.bno" @click="showDetail(vo.bno)">상세보기</a>
													</td>
												</tr>
											</table>
											<table class="table" style="margin-bottom: 0px" v-if="vo.isDetail">
												<tr v-for="cvo in vo.clist" class="cart-row" @click="link(cvo.ino)">
													<td class="text-center" width="20%">
														<img :src="'https://www.ocamall.com'+cvo.ivo.poster" style="width: 40px;height: 30px;">
													</td>
													<td class="text-center" width="50%">{{cvo.ivo.name}}</td>
													<td class="text-center" width="30%">{{cvo.account}}개</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
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
			endPage:0,
			count:0
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
				this.curpage=res.data.curpage
				this.totalpage=res.data.totalpage
				this.startPage=res.data.startPage
				this.endPage=res.data.endPage
				this.count=res.data.count
				for(let i=0;i<this.list.length;i++){
					this.list[i].total_priceStr=new Intl.NumberFormat().format(this.list[i].total_price)
					this.list[i].num=this.count-this.list[i].num+1
					this.list[i].isDetail=false
				}
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
		showDetail(no){
			let idx=this.list.findIndex(vo => vo.bno === no)
			if(this.list[idx].isDetail){
				this.list[idx].isDetail=false
				$('#dBtn-'+no).text('상세보기')
			}else{
				this.list[idx].isDetail=true
				$('#dBtn-'+no).text('취소')
			}
		},
		link(ino){
			location.href="../item/detail.do?ino="+ino
		}
	},
	components:{
		'page-card':page_card
	}
}).mount('#buyApp')
</script>
</body>
</html>