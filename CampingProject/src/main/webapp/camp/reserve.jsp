<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://cdn.jsdelivr.net/npm/@fullcalendar/icalendar@5.11.3/main.css' rel='stylesheet' />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/locales-all.min.js"></script>
<style type="text/css">
#siteStr{
	width: 180px;
	white-space: normal;
}
</style>
</head>
<body>
	<!--====== App Content ======-->
    <div class="app-content" id="reserveApp">

        <!--====== Section 1 ======-->
        <div class="u-s-p-t-90">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">

                        <div>
                            <ul class="pd-breadcrumb__list">
                                <li class="has-separator">
                                    <a href="../main/main.do">Home</a></li>
                                <li class="has-separator">
                                    <a href="../camp/list.do">캠핑장 목록</a></li>
                                <li class="has-separator">
                                    <a href="../camp/detail.do?cno=${param.cno}">캠핑장 상세</a></li>
                                <li class="has-separator">
                                    <a href="../camp/reserve.do?cno=${param.cno}">캠핑장 예약</a></li>
                            </ul>
                        </div>

                       	<table class="table" style="font-size: 16px">
                       		<tr>
                       			<td class="text-center" colspan="3">
                       				<img :src="vo.poster" style="width: 80%;height: auto;">
                       			</td>
                       		</tr>
                       		<tr>
                       			<td class="text-center" colspan="3">
                       				<h3>{{vo.title}}</h3>
                       			</td>
                       		</tr>
                       		<tr>
                       			<th width="20">일정</th>
                       			<td width="65" class="text-center" style="padding: 8px 0px;"><span v-if="endDate!=''">{{startDate}} - {{endDate}}</span></td>
                       			<td width="15%" class="text-center">
                       				<input type="button" class="btn-sm btn-success" value="저장" v-if="!isDate" style="width: 60px;" @click="selectDate()">
                       				<input type="button" class="btn-sm btn-warning" value="초기화" v-if="isDate" @click="resetDate()">
                       			</td>
                       		</tr>
                       		<tr v-if="isDate">
                       			<th width="20%">사이트</th>
                       			<td width="65" class="text-center" style="padding: 8px 0px;"><p id="siteStr">{{checks.toString()}}</p></td>
                       			<td width="15%" class="text-center">
                       				<input type="button" class="btn-sm btn-success" value="저장" v-if="!isSite" style="width: 60px;" @click="selectSite()">
                       				<input type="button" class="btn-sm btn-warning" value="초기화" v-if="isSite" @click="resetSite()">
                       			</td>
                       		</tr>
                       		<tr v-if="isDate && isSite">
                       			<td width="20%">비용</td>
                       			<td colspan="2">
                       				<span title="(일 수)*(사이트수)*(1박 비용)">{{night}}일 * {{checks.length}}개 * {{priceStr}}원 = {{totalPrice}}원</span>
                       			</td>
                       		</tr>
                       		<tr v-if="isDate && isSite">
                       			<td colspan="3">
                       				<input type="button" class="btn-sm btn-success" value="예약" @click="reserve()">
                       			</td>
                       		</tr>
                       	</table>
                    </div>
                    <div class="col-lg-8">
                    	<div id="calendar-box" ref="calendar-box" v-show="!isDate">
	                       	<div id="calendar"></div>
                    	</div>
                    	<div id="site-box" ref="site-box" v-show="isDate && !isSite">
		                	<select ref="type" v-model="type" @change="typeChange()">
		                		<option v-for="s in sList" :value="s.type">{{s.typeStr}} - {{s.price}}원</option>
		                	</select>
			                <div class="row">
			                	<div class="col-lg-3" v-for="r,idx in rList">
			                		<input type="checkbox" class="site_check" :disabled="r===1" @click="sCheck(idx)">{{typeStr}}{{idx+1}}
			                		
			                	</div>
			                </div>
                    	</div>
                    	<div id="notic-box" ref="notic-box" v-show="isDate && isSite">
                    		<h1>test</h1>
                    	</div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section 1 ======-->
    </div>
    <!--====== End - App Content ======-->
    <script>
    	let reserveApp=Vue.createApp({
    		data(){
    			return {
    				cno:${param.cno},
    				vo:{},
    				sList:[],
    				rList:[],
    				type:0,
    				price:0,
    				priceStr:'',
    				typeStr:'',
    				firstDate:'',
    				startDate:'',
    				endDate:'',
    				night:0,
    				operDeCl:[],
    				isDate:false,
    				isSite:false,
    				checks:[],
    				totalPrice:''
    			}
    		},mounted(){
    			axios.get('../camp/detail_vue.do',{
    				params:{
    					cno:this.cno
    				}
    			}).then(res=>{
    				console.log(res.data)
    				this.vo=res.data
	    			this.printCalender()
    			}).catch(error=>{
    				console.log(error.response)
    			})
    			axios.get('../camp/site_list_vue.do',{
    				params:{
    					cno:this.cno
    				}
   				}).then(res=>{
       				this.sList=res.data
       				this.type=this.sList[0].type
       				this.typeChange()
       			}).catch(error=>{
       				console.log(error.response)
       			})
    		},
    		methods:{
    			printCalender(){
    				if (this.calendar) {
	    				this.calendar.destroy();
	    				this.calendar = null;
    				}
    				
    				let date=new Date()
        			let year=date.getFullYear()
        			let month=("0"+(1+date.getMonth())).slice(-2)
        			let day=("0"+date.getDate()).slice(-2)
        			
        			let _this=this
       				let calendarEl=document.getElementById("calendar")
       				let calendar=new FullCalendar.Calendar(calendarEl,{
       					initialView:'dayGridMonth',
       					locale: 'ko', // 한국어 적용
       					dayCellContent: function(arg) { // '일' 제거
      						  return { html: String(arg.date.getDate()) }
      						},
       					height:500,
       					validRange:{
       						start:year+"-"+month+"-"+day,
       						end:(year+1)+"-"+month+"-"+'01'
       					},
       					themeSystem:'bootstrap',
       					editable:true, // 라이브러리??
       					selectAllow: function(selectInfo) {
       						const day = selectInfo.start.getDay();
       						console.log(_this.vo.operDecl)
       						if(_this.vo.operDeCl===0){
   	    						return [0,1,2,3,4,5,6].includes(day);
       						}else {
   	    						return [1,2,3,4,5].includes(day);
       						}
       					},
       					businessHours:[
       						{
   		    					daysOfWeek: _this.vo.operDeCl===1?[1,2,3,4,5]:[0,1,2,3,4,5,6],
       						}
       					],
       					unselectAuto: false, // 선택 자동해제 해제
       			        select: function(info) {
       			        	_this.startDate=info.startStr.split('T')[0]
   	    					_this.endDate=info.end.toISOString().split('T')[0]
       			        	if(_this.startDate===_this.endDate){
       			        		_this.endDate=''
       			        	}else{
       			        		_this.sitePrint()
       			        	}
       			        },
       					dateClick: function(info) {
       						if(_this.vo.operDeCl===1){
   	    						if ([0, 6].includes(info.date.getDay())) {
   		    						alert("주말은 선택할 수 없습니다.")
   		    						return;
   	    						}
       						}
       						if (_this.firstDate==='') {
       							_this.firstDate = info.date;
       							const start = _this.firstDate
   	    						const end = _this.firstDate
   	    						calendar.select(start, new Date(end.getTime() + 86400000))
       						} else {
   	    						const start = _this.firstDate < info.date ? _this.firstDate : info.date
   	    						const end = _this.firstDate > info.date ? _this.firstDate : info.date
   	    						_this.night=(end-start)/86400000
   	    						if((end-start)>432000000){
   	    							alert("최대 캠핑 일정은 5박 6일입니다")
   	    							return
   	    						}
   	    						
   			    				let current = new Date(start)
   	    						if(_this.vo.operDeCl===1){
   				    				while (current < end) {
   					    				const day = current.getDay()
   					    				if ([0,6].includes(day)) {
   					    					alert("주말을 포함할 수 없습니다.")
   					    					return
   					    				}
   					    				current.setDate(current.getDate()+1)
   				    				}
   	    						}
   	    						// FullCalendar에서 시각화
   	    						calendar.select(start, new Date(end.getTime() + 86400000))
   	    						// 초기화
   	    						_this.firstDate=''
       						}
       					}
       				})
       				this.calendar=calendar
   	   				calendar.render()
    			},
    			selectDate(){
    				if(this.endDate==''){
    					alert("날짜를 선택해주세요")
    					return
    				}
    				this.isDate=true
    			},
    			resetDate(){
    				this.isDate=false
    				this.firstDate=''
    				this.startDate=''
    				this.endDate=''
    				this.resetSite()
    				if(this.calendar) {
						this.calendar.unselect()
					}
    				this.$nextTick(() => {
	    				this.printCalender()
    				})
    			},
    			typeChange(){
    				this.resetSite()
    				this.sitePrint()
    				for(let i=0;i<=this.sList.length;i++){
    					if(this.sList[i].type==this.type){
    						this.typeStr=this.sList[i].typeStr
    						this.price=this.sList[i].price
    						this.priceStr=new Intl.NumberFormat().format(this.price)
    						break;
    					}
    				}
    			},
    			sitePrint(){
    				axios.get('../camp/reserve_list_vue.do',{
    					params:{
    						cno:this.cno,
    						startDateStr:this.startDate,
    						endDateStr:this.endDate,
    						type:this.type
    					}
    				}).then(res=>{
        				this.rList=res.data.rList
        			}).catch(error=>{
        				console.log(error.response)
        			})
    			},
    			sCheck(i){
    				let idx=this.checks.indexOf(i+1)
    				if(idx==-1){
	    				this.checks.push(i+1)
	    				this.checks=this.checks.sort((a,b)=>a-b)
    				}else{
    					this.checks.splice(idx,1)
    				}
    				this.totalPrice=new Intl.NumberFormat().format(this.checks.length*this.price*this.night)
    			},
    			selectSite(){
    				if(this.checks.length==0){
    					alert('사이트를 선택해주세요')
    					return
    				}
    				this.isSite=true
    			},
    			resetSite(){
    				this.isSite=false
    				this.checks=[]
    				$('.site_check').prop('checked',false)
    			},
    			reserve(){
    				
    			}
    		}
    	}).mount('#reserveApp')
    </script>
</body>
</html>