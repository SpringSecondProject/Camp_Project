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

                                        <span class="js-shop-list-target">List</span></div>
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
                                            <div class="u-s-m-b-8"><select class="select-box select-box--transparent-b-2">
                                                    <option selected>Sort By: Newest Items</option>
                                                    <option>Sort By: Latest Items</option>
                                                    <option>Sort By: Best Selling</option>
                                                    <option>Sort By: Best Rating</option>
                                                    <option>Sort By: Lowest Price</option>
                                                    <option>Sort By: Highest Price</option>
                                                </select></div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="shop-p__collection">
                                <div class="row is-grid-active">
                                	<div :class="colClass" v-for="vo in list">
                                        <div class="product-m">
                                            <div class="product-m__thumb">

                                                <a class="aspect aspect--bg-grey aspect--square u-d-block" :href="'../camp/detail.do?cno='+vo.cno" >

                                                    <img class="aspect__img" :src="vo.poster"></a> 
                                                <div class="product-m__quick-look">

                                                    <a class="fas fa-search" data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick Look"></a></div>
                                                <div class="product-m__add-cart"> 

                                                    <a class="btn--e-brand" data-modal="modal" data-modal-id="#add-to-cart">Add to Cart</a></div>
                                            </div>
                                            <div class="product-m__content">
                                            	<br>
		
                                                <div class="product-m__name">

                                                    <a :href="'/camp/detail.do?cno=' + vo.cno">{{ vo.title }}</a>
                                                </div>
                                                <hr style="margin: 5px;">
                                                <div class="product-m__category" >
                                                
                                                    <a href="shop-side-version-2.html">종류 : {{vo.induty}} </a>
                                                </div>
                                                    
                                                
                                                <div class="product-m__category">
                                                	<a href="shop-side-version-2.html">환경 정보 : {{vo.lctCl}} </a>
                                                </div>
                                                <div class="product-m__hover">
                                                    <div class="product-m__preview-description">
														<span>주소 : {{vo.addr}}</span>
														<br>
                                                        <span>정보 : {{vo.intro}}</span></div>
                                                    <div class="product-m__wishlist">

                                                        <a class="far fa-heart" href="#" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"></a></div>
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
                                <div class="u-s-m-b-30">
                                    <div class="shop-w">
                                        <div class="shop-w__intro-wrap">
                                            <h1 class="shop-w__h">애견 동반</h1>

                                            <span class="fas fa-minus shop-w__toggle" data-target="#s-shipping" data-toggle="collapse"></span>
                                        </div>
                                        <div class="shop-w__wrap collapse show" id="s-shipping">
                                            <ul class="shop-w__list gl-scroll">
                                                <li>

                                                    <!--====== Check Box ======-->
                                                    <div class="check-box">

                                                        <input type="checkbox" id="free-shipping">
                                                        <div class="check-box__state check-box__state--primary">

                                                            <label class="check-box__label" for="free-shipping">Free Shipping</label></div>
                                                    </div>
                                                    <!--====== End - Check Box ======-->
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="u-s-m-b-30">
                                    <div class="shop-w">
                                        <div class="shop-w__intro-wrap">
                                            <h1 class="shop-w__h">CATEGORY</h1>

                                            <span class="fas fa-minus shop-w__toggle" data-target="#s-category" data-toggle="collapse"></span>
                                        </div>
                                        <div class="shop-w__wrap collapse show" id="s-category">
                                            <ul class="shop-w__category-list gl-scroll">
                                                <li class="has-list">

                                                    <a href="#">Electronics</a>

                                                    <span class="category-list__text u-s-m-l-6">(23)</span>

                                                    <span class="js-shop-category-span is-expanded fas fa-plus u-s-m-l-6"></span>
                                                    <ul style="display:block">
                                                        <li class="has-list">

                                                            <a href="#">3D Printer & Supplies</a>

                                                            <span class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                            <ul>
                                                                <li>

                                                                    <a href="#">3d Printer</a></li>
                                                                <li>

                                                                    <a href="#">3d Printing Pen</a></li>
                                                                <li>

                                                                    <a href="#">3d Printing Accessories</a></li>
                                                                <li>

                                                                    <a href="#">3d Printer Module Board</a></li>
                                                            </ul>
                                                        </li>
                                                        
                                                        <li class="has-list">

                                                            <a href="#">Necessary Accessories</a>

                                                            <span class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                            <ul>
                                                                <li>

                                                                    <a href="#">Flash Cards</a></li>
                                                                <li>

                                                                    <a href="#">Memory Cards</a></li>
                                                                <li>

                                                                    <a href="#">Flash Pins</a></li>
                                                                <li>

                                                                    <a href="#">Compact Discs</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                                
                                                
                                               
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="u-s-m-b-30">
                                    <div class="shop-w">
                                        <div class="shop-w__intro-wrap">
                                            <h1 class="shop-w__h">PRICE</h1>

                                            <span class="fas fa-minus shop-w__toggle" data-target="#s-price" data-toggle="collapse"></span>
                                        </div>
                                        <div class="shop-w__wrap collapse show" id="s-price">
                                            <form class="shop-w__form-p">
                                                <div class="shop-w__form-p-wrap">
                                                    <div>

                                                        <label for="price-min"></label>

                                                        <input class="input-text input-text--primary-style" type="text" id="price-min" placeholder="Min"></div>
                                                    <div>

                                                        <label for="price-max"></label>

                                                        <input class="input-text input-text--primary-style" type="text" id="price-max" placeholder="Max"></div>
                                                    <div>

                                                        <button class="btn btn--icon fas fa-angle-right btn--e-transparent-platinum-b-2" type="submit"></button></div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="u-s-m-b-30">
                                    <div class="shop-w">
                                        <div class="shop-w__intro-wrap">
                                            <h1 class="shop-w__h">COLOR</h1>

                                            <span class="fas fa-minus shop-w__toggle" data-target="#s-color" data-toggle="collapse"></span>
                                        </div>
                                        <div class="shop-w__wrap collapse show" id="s-color">
                                            <ul class="shop-w__list gl-scroll">
                                                <li>
                                                    <div class="color__check">

                                                        <input type="checkbox" id="jet">

                                                        <label class="color__check-label" for="jet" style="background-color: #333333"></label></div>

                                                    <span class="shop-w__total-text">(2)</span>
                                                </li>
                                                <li>
                                                    <div class="color__check">

                                                        <input type="checkbox" id="folly">

                                                        <label class="color__check-label" for="folly" style="background-color: #FF0055"></label></div>

                                                    <span class="shop-w__total-text">(4)</span>
                                                </li>
                                                <li>
                                                    <div class="color__check">

                                                        <input type="checkbox" id="yellow">

                                                        <label class="color__check-label" for="yellow" style="background-color: #FFFF00"></label></div>

                                                    <span class="shop-w__total-text">(6)</span>
                                                </li>
                                                <li>
                                                    <div class="color__check">

                                                        <input type="checkbox" id="granite-gray">

                                                        <label class="color__check-label" for="granite-gray" style="background-color: #605F5E"></label></div>

                                                    <span class="shop-w__total-text">(8)</span>
                                                </li>
                                                <li>
                                                    <div class="color__check">

                                                        <input type="checkbox" id="space-cadet">

                                                        <label class="color__check-label" for="space-cadet" style="background-color: #1D3461"></label></div>

                                                    <span class="shop-w__total-text">(10)</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="u-s-m-b-30">
                                    <div class="shop-w">
                                        <div class="shop-w__intro-wrap">
                                            <h1 class="shop-w__h">SIZE</h1>

                                            <span class="fas fa-minus collapsed shop-w__toggle" data-target="#s-size" data-toggle="collapse"></span>
                                        </div>
                                        <div class="shop-w__wrap collapse" id="s-size">
                                            <ul class="shop-w__list gl-scroll">
                                                <li>

                                                    <!--====== Check Box ======-->
                                                    <div class="check-box">

                                                        <input type="checkbox" id="xs">
                                                        <div class="check-box__state check-box__state--primary">

                                                            <label class="check-box__label" for="xs">XS</label></div>
                                                    </div>
                                                    <!--====== End - Check Box ======-->

                                                    <span class="shop-w__total-text">(2)</span>
                                                </li>
                                                <li>

                                                    <!--====== Check Box ======-->
                                                    <div class="check-box">

                                                        <input type="checkbox" id="small">
                                                        <div class="check-box__state check-box__state--primary">

                                                            <label class="check-box__label" for="small">Small</label></div>
                                                    </div>
                                                    <!--====== End - Check Box ======-->

                                                    <span class="shop-w__total-text">(4)</span>
                                                </li>
                                                <li>

                                                    <!--====== Check Box ======-->
                                                    <div class="check-box">

                                                        <input type="checkbox" id="medium">
                                                        <div class="check-box__state check-box__state--primary">

                                                            <label class="check-box__label" for="medium">Medium</label></div>
                                                    </div>
                                                    <!--====== End - Check Box ======-->

                                                    <span class="shop-w__total-text">(6)</span>
                                                </li>
                                                <li>

                                                    <!--====== Check Box ======-->
                                                    <div class="check-box">

                                                        <input type="checkbox" id="large">
                                                        <div class="check-box__state check-box__state--primary">

                                                            <label class="check-box__label" for="large">Large</label></div>
                                                    </div>
                                                    <!--====== End - Check Box ======-->

                                                    <span class="shop-w__total-text">(8)</span>
                                                </li>
                                                <li>

                                                    <!--====== Check Box ======-->
                                                    <div class="check-box">

                                                        <input type="checkbox" id="xl">
                                                        <div class="check-box__state check-box__state--primary">

                                                            <label class="check-box__label" for="xl">XL</label></div>
                                                    </div>
                                                    <!--====== End - Check Box ======-->

                                                    <span class="shop-w__total-text">(10)</span>
                                                </li>
                                                <li>

                                                    <!--====== Check Box ======-->
                                                    <div class="check-box">

                                                        <input type="checkbox" id="xxl">
                                                        <div class="check-box__state check-box__state--primary">

                                                            <label class="check-box__label" for="xxl">XXL</label></div>
                                                    </div>
                                                    <!--====== End - Check Box ======-->

                                                    <span class="shop-w__total-text">(12)</span>
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
    <!--====== End - App Content ======-->
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
    			locationCounts: [] // 지역별 갯수
    			  
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
    	},
    	methods:{
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
    			axios.get('http://localhost:8080/web/camp/list_vue.do',{
        			params:{
        				page:this.curpage,
        				rowSize: this.rowSize,
        				locations: this.locations.join(',')
        			}
        		}).then(res=>{
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
    	}
    }).mount("#campApp")
    </script>
</body>
</html>