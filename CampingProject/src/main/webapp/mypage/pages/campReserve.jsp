<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
	<title></title>
</head>
<body>
<!--====== Main App ======-->
<div id="app">
	<!--====== App Content ======-->
	<div class="app-content" id="myReserveApp">
		<!--====== Section 1 ======-->
		<div class="u-s-p-b-60">

			<!--====== Section Intro ======-->
			<div class="section__intro u-s-m-b-60">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="section__text-wrap">
								<h1 class="section__heading u-c-secondary">예약 관리</h1>
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
								<table class="table-p">
									<tbody>
										<!--====== Row ======-->
										<tr v-for="vo in list">
											<td>
												<div class="table-p__box">
													<div class="table-p__img-wrap">
														<img class="u-img-fluid" :src="vo.cvo.poster" style="width: 120px;height: 120px;"></div>
													<div class="table-p__info">
	                                                    <span class="table-p__name">
	                                                        <a :href="'../camp/detail.do?cno='+vo.cno">{{vo.title}}</a>
	                                                    </span>
														<span class="table-p__category">
	                                                         <a href="shop-side-version-2.html">예약일 : {{vo.regDateStr}}</a>
	                                                    </span>
														<ul class="table-p__variant-list">
															<li>
																<span>주소 : {{vo.cvo.addr}}</span>
															</li>
															<li>
																<span>일정 : {{vo.startDateStr}} ~ {{vo.endDateStr}}</span>
															</li>
														</ul>
													</div>
												</div>
											</td>
											<td>
												<span class="table-p__price">{{vo.price}} 원</span>
											</td>
											<td width="20%">
												<div class="table-p__del-wrap text-center" v-if="vo.state==-1">
													<input type="button" value="취소 완료" class="btn btn-sm btn-default" disabled>
												</div>
												<div class="table-p__del-wrap text-center" v-if="vo.state==0">
													<input type="button" value="확정" class="btn btn-xs btn-primary" @click="reserveConfirmed(vo.rno)">
													<input type="button" value="취소" class="btn btn-xs btn-danger" @click="reserveCancel(vo.rno)">
												</div>
											</td>
										</tr>
										<!--====== End - Row ======-->
									</tbody>
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
</script>
</body>
