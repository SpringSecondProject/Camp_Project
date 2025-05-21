<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
p{
	overflow:hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.card {
  width: 100px;
  text-align: center;
  margin: 20px;
}
.card:hover{
	cursor: pointer;
}
.card img {
  width: 100%%;
  display: block;
  border-radius: 8px;
}

.card .title {
  margin-top: 10px;
  font-weight: bold;
}
.review-tr:hover {
	background-color: #dcdcdc;
}
</style>
</head>
<body class="config">
	<!--====== Main App ======-->
	<div id="reviewApp">
		<!--====== App Content ======-->
		<div class="app-content">
			<div class="u-s-m-b-8">
				<select class="select-box select-box--transparent-b-2" style="font-size: 16px;float: left;" @change="selectType()" v-model="type">
					<option value="0">캠핑장</option>
					<option value="1">쇼핑몰</option>
					<option value="2">레시피</option>
					<option value="3">캠핑카</option>
				</select>
				<span style="font-size: 16px;float: left;margin-top: 10px">댓글 {{count}}개</span>
			</div>
			<!--====== Section 1 ======-->
			<div class="u-s-p-y-10">
				<div class="container">
					<div style="min-height: 400px;">
						<table class="table">
							<tr style="font-size: 18px;">
								<th class="text-center" width="5%">번호</th>
								<th class="text-center" width="20%">게시글</th>
								<th class="text-center" width="60%">내용</th>
								<th class="text-center" width="15%">등록일</th>
							</tr>
							<tr class="review-tr" v-for="rvo in list" style="font-size: 16px;">
								<td style="vertical-align: middle;" class="text-center" width="5%">{{count-rvo.num+1}}</td>
								<td width="20%" :title="rvo.title">
									<div class="card" @click=link(rvo.no)>
										<img v-if="type!=1" :src="rvo.poster">
										<img v-if="type==1" :src="'https://www.ocamall.com/'+rvo.poster">
										<p>{{rvo.title}}</p>
									</div>
								</td>
								<td style="vertical-align: middle;" width="60%">{{rvo.msg}}</td>
								<td style="vertical-align: middle;" class="text-center" width="15%">{{rvo.rgday}}</td>
							</tr>
						</table>
					</div>
					<div class="text-center" v-if="list.length!=0">
						<page-card></page-card>
					</div>
				</div>
			</div>
			<!--====== End - Section 1 ======-->
		</div>
		<!--====== End - App Content ======-->
	</div>
	<script src="../js/commons/page-card.js"></script>
	<script>
	let campLike=Vue.createApp({
		data(){
			return{
				type:0,
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
				axios.get("../mypage/review_list.do",{
					params:{
						type:this.type,
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
				}).catch(error=>{
					console.log(error.response)
				})
			},
			selectType(){
				this.dataRecv()
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
			link(no){
				if(this.type==0){
					location.href="../camp/detail.do?cno="+no
				}else if(this.type==1){
					location.href="../item/detail.do?ino="+no
				}else if(this.type==2){
					location.href="../recipe/recipe_detail.do?no="+no
				}else if(this.type==3){
					location.href="../campcar/detail.do?id="+no
				}
			}
		},
		components:{
			'page-card':page_card
		}
	}).mount("#reviewApp")
	</script>
</body>

