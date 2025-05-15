<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 리스트</title>
</head>
<body>
    <!--====== App Content ======-->
    <div class="app-content" id="campApp">

        <!--====== Section 1 ======-->
        <div class="u-s-p-y-90">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-md-12">
                        <div class="shop-p">
                            <div class="shop-p__toolbar u-s-m-b-30">
                                <div class="shop-p__tool-style">
                                    <div class="tool-style__group u-s-m-b-8">

                                        <span class="js-shop-grid-target is-active">Grid</span>

                                        <span class="js-shop-list-target">List</span>
                                        <form>
                                        <div class="tool-style__form-wrap">
                                            <div class="u-s-m-b-8">
	                                            <select class="select-box select-box--transparent-b-2" 
	                                            v-model="rowSize" @change="pageChange(1)">
	                                                    <option :value="8">Show: 8</option>
														<option :value="12">Show: 12</option>
														<option :value="16">Show: 16</option>
	                                            </select>
                                            </div>
                                            
                                        </div>
                                    </form>
                                    </div>
                                    
                                    <form class="main-form flex align-center" @submit.prevent="pageChange(1)">

										<label for="main-search"></label>
					
										<input class="input-text input-text--border-radius input-text--style-2"
										       type="text" id="main-search" placeholder="캠핑장 이름과 주소로 검색" v-model="keyword">
					
										<button class="btn btn--icon fas fa-search main-search-button"
										        type="button" @click="pageChange(1)"></button>
									</form>
                                </div>
                            </div>
                            <div class="shop-p__collection">
                            
                            	<div v-if="list.length === 0" class="u-s-m-b-30" style="text-align:center;">
								  <h2>조건에 맞는 캠핑장이 없습니다</h2>
								</div>
								
                                <div class="row is-grid-active">
                                	<div :class="colClass" v-for="vo in list">
                                        <div class="product-m">
                                            <div class="product-m__thumb">

                                                <a class="aspect aspect--bg-grey aspect--square u-d-block" :href="'../camp/detail_before.do?cno='+vo.cno" >

                                                    <img class="aspect__img" :src="vo.poster"></a> 
                                                <div class="product-m__quick-look">

                                                    <a class="fas fa-search" data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick Look"></a></div>
                                                <div class="product-m__add-cart"> 

                                                    <a class="btn--e-brand" data-modal="modal" data-modal-id="#add-to-cart">Add to Cart</a></div>
                                            </div>
                                            <div class="product-m__content">
                                            	<br>
		
                                                <div class="product-m__name" >

                                                    <a :href="'/camp/detail.do?cno=' + vo.cno">{{ vo.title }}</a>
                                                </div>
                                                
                                                <div class="product-m__name" style="color: #4285F4 !important;" >
                                                	<a style="color: #4285F4 !important;"href="shop-side-version-2.html">가격 : {{vo.price.toLocaleString()+ '원'}} </a>
                                                </div>
                                                
                                                <hr style="margin: 5px;">
                                                
                                                <div class="product-m__category" >
                                                
                                                    <a href="shop-side-version-2.html">종류 : {{vo.induty}} </a>
                                                </div>
                                                
                                                <div class="product-m__category" >
                                                
                                                    <a href="shop-side-version-2.html">애견 동반 : {{vo.animalCmgCl}} </a>
                                                </div>
                                                    
                                                
                                                <div class="product-m__category">
                                                	<a href="shop-side-version-2.html">환경 정보 : {{vo.lctCl || '없음' }} </a>
                                                </div>
                                                
                                                <div class="product-m__hover">
                                                    <div class="product-m__preview-description">
														<span>주소 : {{vo.addr}}</span>
														<br>
                                                        <span>정보 : {{ vo.intro || '없음' }}</span></div>
                                                    <div class="product-m__wishlist">
                                                        <a :class="likedCamps.includes(vo.cno) ? 'fas fa-heart' : 'far fa-heart'"
														  title="좋아요" :style="{ color: likedCamps.includes(vo.cno) ? '#ff1500' : '' }"
														  @click.prevent="likeCamp(vo.cno)">
														</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="u-s-p-y-60">

                                <!--====== Pagination ======-->
                                <ul class="shop-p__pagination">
                               		<li class="page-item" v-if="startPage>1" >
                                        <a class="page-link" @click="prev()">
      									<i class="fas fa-angle-left"></i> 이전
      									</a>
                                    </li>
                                        
                                    <li :class="i==curpage?'is-active':''" v-for="i in range(startPage,endPage)">
                                        <a @click="pageChange(i)">{{i}}</a>
                                    </li>
                                        
                                    <li class="page-item" v-if="endPage<totalpage">
                                        <a class="page-link" @click="next()">
									      다음 <i class="fas fa-angle-right"></i>
									    </a>
                                    </li>
                                </ul>
                            
                                <!--====== End - Pagination ======-->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-12">
                        <div class="shop-w-master">
                            <h1 class="shop-w-master__heading u-s-m-b-30"><i class="fas fa-filter u-s-m-r-8"></i>

                                <span>FILTERS</span></h1>
                            <div class="shop-w-master__sidebar sidebar--bg-snow">
                            
                            <%-- 지역별 필터 영역 --%>
                            <div class="u-s-m-b-30">
                                    <div class="shop-w">
                                        <div class="shop-w__intro-wrap">
                                            <h1 class="shop-w__h">지역 선택</h1>

                                            <span class="fas fa-minus shop-w__toggle" data-target="#s-manufacturer" data-toggle="collapse"></span>
                                        </div>
                                        <div class="shop-w__wrap collapse show" id="s-manufacturer">
                                            <ul class="shop-w__list-2">
                                                <li v-for="item in locationCounts" :key="item.name">
												  <div class="list__content">
												    <input type="checkbox" :value="item.name" v-model="locations" @change="pageChange(1)">
												    <span>{{ item.name }}</span>
												  </div>
												  <span class="shop-w__total-text">({{ item.cnt }})</span>
												</li>
                                                
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                
                                <%-- 가격별 필터 영역 --%>
                                <div class="u-s-m-b-30">
                                    <div class="shop-w">
                                        <div class="shop-w__intro-wrap">
                                            <h1 class="shop-w__h">가격</h1>

                                            <span class="fas fa-minus shop-w__toggle" data-target="#s-price" data-toggle="collapse"></span>
                                        </div>
                                        <div class="shop-w__wrap collapse show" id="s-price">
                                            <form class="shop-w__form-p">
                                                <div class="shop-w__form-p-wrap">
                                                    <div>

                                                        <label for="price-min"></label>

                                                        <input class="input-text input-text--primary-style" type="text" id="minPrice" v-model="minPrice" placeholder="최소금액"></div>
                                                    <div>

                                                        <label for="price-max"></label>

                                                        <input class="input-text input-text--primary-style" type="text" id="maxPrice" v-model="maxPrice" placeholder="최대금액"></div>
                                                    <div>
														<likeCard></likeCard>
                                                        
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="u-s-m-b-30">
                                    <div class="shop-w">
                                        <div class="shop-w__intro-wrap">
                                            <h1 class="shop-w__h">애견 동반</h1>

                                            <span class="fas fa-minus shop-w__toggle" data-target="#s-pet" data-toggle="collapse"></span>
                                        </div>
                                        <div class="shop-w__wrap collapse show" id="s-pet">
                                            <ul class="shop-w__list gl-scroll">
                                            	
											  <li>
											    <div class="radio-box">
											      <input type="radio" id="dog-small" value="" v-model="selectedPet" @change="pageChange(1)">
											      <div class="radio-box__state radio-box__state--primary">
											        <label class="radio-box__label">전체</label>
											      </div>
											    </div>
											  </li>
											  
											  <li>
											    <div class="radio-box">
											      <input type="radio" id="dog-small" value="가능(소형견)" v-model="selectedPet" @change="pageChange(1)">
											      <div class="radio-box__state radio-box__state--primary">
											        <label class="radio-box__label">소형견 가능</label>
											      </div>
											    </div>
											  </li>
											  
											  <li>
											    <div class="radio-box">
											      <input type="radio" id="dog-all" value="가능" v-model="selectedPet" @change="pageChange(1)">
											      <div class="radio-box__state radio-box__state--primary">
											        <label class="radio-box__label">모든견종 가능</label>
											      </div>
											    </div>
											  </li>
											
											  <li>
											    <div class="radio-box">
											      <input type="radio" id="no-pet" value="불가능" v-model="selectedPet" @change="pageChange(1)">
											      <div class="radio-box__state radio-box__state--primary">
											        <label class="radio-box__label">애견동반 불가</label>
											      </div>
											    </div>
											  </li>
											</ul>	
                                        </div>
                                    </div>
                                </div>
                                
								<div class="u-s-m-b-30">
                                    <div class="shop-w">
                                        <div class="shop-w__intro-wrap">
                                            <h1 class="shop-w__h">캠핑 유형</h1>

                                            <span class="fas fa-minus shop-w__toggle" data-target="#s-type" data-toggle="collapse"></span>
                                        </div>
                                        <div class="shop-w__wrap collapse show" id="s-type">
                                            <ul class="shop-w__list gl-scroll">
												
												<li v-for="item in typeCounts" :key="item.induty">
												  <div class="check-box">
												    <input type="checkbox" :value="item.induty" v-model="selectedTypes" @change="pageChange(1)">
												    <div class="check-box__state check-box__state--primary">
												      <label class="check-box__label">{{ item.induty }}</label>
												    </div>
												  </div>
												  <span class="shop-w__total-text">({{ item.cnt }})</span>
												</li>
                                                
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="u-s-m-b-30">
                                    <div class="shop-w">
                                        <div class="shop-w__intro-wrap">
                                            <h1 class="shop-w__h">자연 환경</h1>

                                            <span class="fas fa-minus shop-w__toggle" data-target="#s-envir" data-toggle="collapse"></span>
                                        </div>
                                        <div class="shop-w__wrap collapse show" id="s-envir">
                                            <ul class="shop-w__list gl-scroll">
                                                
                                                <li v-for="Llist in lctclCounts" :key="Llist.lctcl">
												  <div class="check-box">
												    <input type="checkbox" :value="Llist.lctcl" v-model="lctcl" @change="pageChange(1)">
												    <div class="check-box__state check-box__state--primary">
												      <label class="check-box__label">{{ Llist.lctcl }}</label>
												    </div>
												  </div>
												  <span class="shop-w__total-text">({{ Llist.cnt }})</span>
												</li>
												
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!--====== End - Section 1 ======-->
    </div>
    <jsp:include page="cookie_camp.jsp" />
    <!--====== End - App Content ======-->
    
    <script src="../like/likeCard.js"></script>
    <script src="../like/likeTypes.js"></script>
    <script>
    
    let campListApp=Vue.createApp({
    	data(){
    		return {
    			list:[],
    			curpage:1,
    			totalpage:0,
    			startPage:0,
    			endPage:0,
    			rowSize:12,
    			locations: [], // 지역별 필터
    			locationCounts: [], // 지역별 갯수
    			minPrice: null, // 금액별 필터
    		    maxPrice: null,
    		    selectedPet:'', // 팻 필터
    		    selectedTypes: [], // 캠핑장 종류 필터
    		    typeCounts: [], // 종류별 갯수
    		    lctcl:[],	// 환경 종류 필터
    		    lctclCounts:[], // 환경 종류 필터 갯수
    		    likedCamps: [], // 로그인 유저가 좋아요한거 표시
    		    keyword:''// 캠핑장 검색어
    		}
    	},
    	computed: {
			  colClass() {
			    if (this.rowSize === 8) return "col-lg-6 col-md-6 col-sm-12" 
			    if (this.rowSize === 12) return "col-lg-4 col-md-6 col-sm-12"
			    if (this.rowSize === 16) return "col-lg-3 col-md-6 col-sm-12" 
			    return "col-lg-3 col-md-6 col-sm-12"
			  }
		},
    	mounted(){
			this.dataRecv()
			this.getLocationCounts()
			this.getTypeCounts()
			this.getLctclCounts()
			//this.loadLikedCamps();
			likeUtil.loadLikedCamps(this, window.LIKE_TYPES.CAMP); // 좋아요 불러오기
    	},
    	methods:{
    		likeCamp(no) { // 좋아요 클릭시
    		      likeUtil.likeCamp(this, no , window.LIKE_TYPES.CAMP); 
    		//  CAMP: 0, SHOP: 1, RECIPE: 2, CAR: 3, COMMUNITY: 4
    		},
    		getLctclCounts() {
    		  axios.get("http://localhost:8080/web/camp/lctcl_count_vue.do")
    		    .then(res => { 
    		      this.lctclCounts = res.data 
    		    })
    		},
   		    getTypeCounts() {
   			  axios.get("http://localhost:8080/web/camp/type_count_vue.do")
   			    .then(res => {
   			      this.typeCounts = res.data // 캠핑장 종류별 필터 갯수
   			    })
   			},
   		 	getLocationCounts() { // 지역별 필터 갯수
   			  axios.get("http://localhost:8080/web/camp/location_count_vue.do")
   			    .then(res => {
   			      this.locationCounts = res.data
   			    }).catch(err => {
   			      console.error(err)
   			    })
   			},
    		prev(){
    			this.curpage=this.startPage-1
    			this.dataRecv()
    		},
    		next(){
    			this.curpage=this.endPage+1
    			this.dataRecv()
    			
    		},
    		pageChange(page){
    			this.curpage=page
    			this.dataRecv()
    			
    			
    		},
    		range(start,end){
    			let arr=[]
    			let len=end-start
    			for(let i=0;i<=len;i++)
    			{
    				arr[i]=start
    				start++
    			}
    			return arr
    		},
    		dataRecv(){
    			//console.log("최소금액:", this.minPrice)
    			//console.log("최대금액:", this.maxPrice)
    			//console.log("selectedPet:", this.selectedPet)
    			//console.log("selectedTypes:", this.selectedTypes)
    			//console.log(this.lctcl)
    			console.log(this.keyword+"키워드")
    			axios.get('http://localhost:8080/web/camp/list_vue.do',{
        			params:{
        				page:this.curpage,
        				rowSize: this.rowSize,
        				locations: this.locations.join(','), // 지역필터
        			    minPrice: this.minPrice, //금액필터
        			    maxPrice: this.maxPrice,
        			    pet: this.selectedPet, // 펫 필터
        			    types: this.selectedTypes.join(','), // 캠핑장 종류
        			    lctcl: this.lctcl.join(','), // 환경 종류
        			    keyword: this.keyword
        			}
        		}).then(res=>{
        			console.log(res.data)
        			this.list=res.data.list
        			this.curpage=res.data.curpage
        			this.totalpage=res.data.totalpage
        			this.startPage=res.data.startPage
        			this.endPage=res.data.endPage
					
        			
        			this.$nextTick(() => {
        		        setTimeout(() => window.dispatchEvent(new Event('resize')), 100);
        		    });
        		}).catch(error=>{
        			console.log(error.response)
        		})
    		}
    	},
    	components:{
    		'likeCard':likeCard
    	}
    }).mount("#campApp")
    </script>
</body>
</html>