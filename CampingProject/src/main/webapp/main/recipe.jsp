<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--====== 조회수 순위 TOP12 ======-->
    <div class="u-s-p-b-60">

        <!--====== Section Intro ======-->
        <div class="section__intro u-s-m-b-46">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="block">
                            <span class="block__title">레시피 TOP12</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section Intro ======-->


        <!--====== Section Content ======-->
        <div class="section__content" id="listapp">
            <div class="container">
                <div class="tab-content">
                    <!--====== Tab 3 ======-->
                    <div class="tab-pane active show" id="e-t-r">
                        <div class="slider-fouc">
                            <div class="owl-carousel tab-slider" data-item="4">
                                <div class="u-s-m-b-30" v-for="(vo, index) in list" :key="vo.rno">
                                    <div class="product-o product-o--hover-on">
                                        <div class="product-o__wrap">

                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" :href="'../recipe/recipe_detail?no='+vo.rno">

                                                <img class="aspect__img" :src="vo.poster" alt=""></a>
                                            <div class="product-o__action-wrap">
                                                <ul class="product-o__action-list">
                                                    <li>

                                                        <a data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>

                                            <span class="product-o__review">(23)</span></div>

                                        <span class="product-o__price">$125.00

                                            <span class="product-o__discount">$160.00</span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Tab 3 ======-->
                </div>
            </div>
        </div>
        <!--====== End - Section Content ======-->
    </div>
    <script>
    listApp=Vue.createApp({
    	data(){
    		return {
    			list:[]
    		}
    	},
    	mounted(){
    		this.dataRecv()
    	},
    	methods:{
    		dataRecv()
    		{
    			axios.get('../main/recipe_vue.do',{
    				params:{
    				}
    			}).then(res=>{
    				console.log(res.data)
    				this.list=res.data.list
    			}).catch(err=>{
    				console.log(err.response)
    			})	
    		}
    	}
    }).mount("#listApp")
    </script>
</body>
</html>