    	var IMP = window.IMP; 
		IMP.init("imp42434332");
		let dcno=$('#reserve-data').data('cno')
		let dpoint=$('#reserve-data').data('point')
    	let reserveApp=Vue.createApp({
    		data(){
    			return {
    				cno:dcno,
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
    				totalPrice:0,
    				totalPriceStr:'',
    				payPrice:0,
    				payPriceStr:'',
    				hasPoint:dpoint,
    				usePoint:0
    			}
    		},
    		mounted(){
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
    			sCheck(r,i){
    				if(r==1){
    					alert("이미 예약된 사이트입니다")
    					return
    				}
    				let idx=this.checks.indexOf(i+1)
    				if(idx==-1){
    					$('#reserveBox'+i).css("background-color","whitesmoke")
	    				this.checks.push(i+1)
	    				this.checks=this.checks.sort((a,b)=>a-b)
    				}else{
    					$('#reserveBox'+i).css("background-color","white")
    					this.checks.splice(idx,1)
    				}
    				this.totalPrice=this.checks.length*this.price*this.night
    				this.totalPriceStr=new Intl.NumberFormat().format(this.totalPrice)
    				this.payPrice=this.totalPrice
    				this.payPriceStr=new Intl.NumberFormat().format(this.payPrice)
    			},
    			selectSite(){
    				if(this.checks.length==0){
    					alert('사이트를 선택해주세요')
    					return
    				}
    				this.isSite=true
    				this.usePoint=0
    			},
    			resetSite(){
   					$('.reserveBox').css("background-color","white")
    				this.isSite=false
    				this.checks=[]
    				$('.site_check').prop('checked',false)
    			},
				pointInsert(){
					if(this.usePoint>this.hasPoint){
						this.usePoint=this.hasPoint
					}
					if(this.usePoint>this.totalPrice){
						this.usePoint=this.totalPrice
					}
					this.payPrice=this.totalPrice-this.usePoint
					this.payPriceStr=new Intl.NumberFormat().format(this.payPrice)
				},
    			reserve(){
    				let formData=new FormData()
					formData.append("cno",this.cno);
					formData.append("title",this.vo.title);
					formData.append("type",this.type);
					formData.append("startDateStr",this.startDate);
					formData.append("endDateStr",this.endDate);
					formData.append("price",this.payPrice);
					formData.append("bak",this.night);
					formData.append("point",this.usePoint);
					for(let i=0;i<this.checks.length;i++){
						formData.append("sites",this.checks[i])
					}
    				axios.post('../camp/reserve_vue.do',formData)
    				.then(res=>{
    					console.log(res.data)
    					if(res.data.msg=='OK'){
    						this.requestPay()
    					}else{
    						alert('예약 실패\n'+'이미 매진된 사이트입니다 ('+res.data.list.toString()+')')
    						this.resetSite()
    						this.sitePrint()
    					}
        			}).catch(error=>{
        				console.log(error.response)
        			})
    			},
    			requestPay() {
				    IMP.request_pay({
				        pg: "kakaopay",
				        pay_method: "card",
				        merchant_uid: "ORD20180131-0000011",
				        name: this.title+"예약 ("+this.checks.toString()+")",
				        amount: this.payPrice,
				        buyer_email: '',
				        buyer_name: '',
				        buyer_tel:'',
				        buyer_addr: '',
				        buyer_postcode: ''
				    }, function (rsp) {
				    	alert("예약 완료!!")
				    	location.href="../mypage/campreserve.do"
				    })
				}
    		}
    	}).mount('#reserveApp')
