<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.aspect_img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>
</head>
<body>
    <!--====== App Content ======-->
    <div class="app-content" id="listApp">

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
                                </div>
                            </div>
                            <div class="shop-p__collection">
                                <div class="row is-grid-active">
                                    <div class="col-lg-4 col-md-6 col-sm-6" v-for="vo in list">
                                        <div class="product-m">
                                            <div class="product-m__thumb">

                                                <a class="aspect" :href="'../item/detail.do?ino='+vo.ino">
  													<img class="aspect_img" :src="'https://www.ocamall.com'+vo.poster" alt="" />
												</a>
                                                <div class="product-m__quick-look">

                                                    <a class="fas fa-search" data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick Look"></a></div>
                                                <div class="product-m__add-cart">

                                                    <a class="btn--e-brand" data-modal="modal" data-modal-id="#add-to-cart">Add to Cart</a></div>
                                            </div>
                                            <div class="product-m__content">
                                                <div class="product-m__category">

                                                    <a href="shop-side-version-2.html">{{vo.type}}</a></div>
                                                <div class="product-m__name">

                                                    <a :href="'../item/detail.do?ino='+vo.ino">{{vo.name}}({{vo.rcount}})</a></div>
                                                <div class="product-m__price">{{vo.price}}원</div>
                                                <div class="product-m__hit">조회수:{{vo.hit}}</div>
                                                <div class="product-m__hover">
                                                    <div class="product-m__preview-description">

                                                        <span></span></div>
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
								<ul class="shop-p__pagination d-flex justify-content-center align-items-center gap-2 flex-wrap mt-3">
  									<li v-if="startPage>1">
    									<a class="fas fa-angle-left" @click.prevent="prev()"></a>
  									</li>
  									<li :class="i===curpage?'is-active':''" v-for="i in range(startPage, endPage)" :key="i">
    									<a @click.prevent="pageChange(i)">{{i}}</a>
  									</li>
  									<li v-if="endPage < totalpage">
    									<a class="fas fa-angle-right" @click.prevent="next()"></a>
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
                                            <h1 class="shop-w__h">카테고리</h1>

                                            <span class="fas fa-minus shop-w__toggle" data-target="#s-category" data-toggle="collapse"></span>
                                        </div>
                                        <div class="shop-w__wrap collapse show" id="s-category">
                                            <ul class="shop-w__category-list gl-scroll">
                                                <li class="has-list">
                                                    <a @click.prevent="changeCategory(1)">화로/BBQ</a>
                                                    <span class="category-list__text u-s-m-l-6">(453)</span>
                                                        </li>
                                                        <li class="has-list">
                                                            <a @click.prevent="changeCategory(2)">퍼니처</a>
                                                            <span class="category-list__text u-s-m-l-6">(468)</span>
                                                        </li>
                                                        <li class="has-list">
                                                            <a @click.prevent="changeCategory(3)">텐트/타프</a>
                                                            <span class="category-list__text u-s-m-l-6">(389)</span>
                                                        </li>
                                                        <li class="has-list">
                                                            <a @click.prevent="changeCategory(4)">키친</a>
                                                            <span class="category-list__text u-s-m-l-6">(921)</span>
                                                        </li>
                                                        <li class="has-list">
                                                            <a @click.prevent="changeCategory(5)">침낭/매트</a>
                                                            <span class="category-list__text u-s-m-l-6">(306)</span>
                                                        </li>
                                                        <li class="has-list">
                                                            <a @click.prevent="changeCategory(6)">액세서리</a>
                                                            <span class="category-list__text u-s-m-l-6">(425)</span>
                                                        </li>
                                                        <li class="has-list">
                                                            <a @click.prevent="changeCategory(7)">스토리지</a>
                                                            <span class="category-list__text u-s-m-l-6">(294)</span>
                                                        </li>
                                                        <li class="has-list">
                                                            <a @click.prevent="changeCategory(8)">라이팅</a>
                                                            <span class="category-list__text u-s-m-l-6">(206)</span>
                                                        </li>
                                                        <li class="has-list">
                                                            <a @click.prevent="changeCategory(9)">계절용품</a>
                                                            <span class="category-list__text u-s-m-l-6">(108)</span>
                                                        </li>
                                                        <li class="has-list">
                                                            <a @click.prevent="changeCategory(10)">RV용품</a>
                                                            <span class="category-list__text u-s-m-l-6">(77)</span>
                                                        </li>
                                                        <li class="has-list">
                                                            <a @click.prevent="changeCategory(11)">기타</a>
                                                            <span class="category-list__text u-s-m-l-6">(743)</span>
                                                        </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="u-s-m-b-30">
                                    <div class="shop-w">
                                        <div class="shop-w__intro-wrap">
                                            <h1 class="shop-w__h">가격대</h1>
                                            <span class="fas fa-minus shop-w__toggle" data-target="#s-price" data-toggle="collapse"></span>
                                        </div>
                                        <div class="shop-w__wrap collapse show" id="s-price">
                                            <form class="shop-w__form-p" @submit.prevent="priceFilter">
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
                            </div>
						<jsp:include page="item_cookie.jsp" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
	let listApp=Vue.createApp({
    data(){
        return {
            list:[],
            curpage:1,
            totalpage:0,
            startPage:0,
            endPage:0,
            ino:0,
            cookieList:[]
        }
    },
    mounted() {
        this.dataRecv()
    },
    methods:{
        changeCategory(ino) {
            const categoryMap={
                1:"화로/BBQ",
                2:"퍼니처",
                3:"텐트/타프",
                4:"키친",
                5:"침낭/매트",
                6:"액세서리",
                7:"스토리지",
                8:"라이팅",
                9:"계절용품",
                10:"RV용품",
                11:"기타"
            }
            this.ino=categoryMap[ino]
            this.curpage=1
            this.list=[]
            this.dataRecvC()
        },
        priceFilter() {
            const min=document.getElementById("price-min").value||null;
            const max=document.getElementById("price-max").value||null;

            axios.get("http://localhost:8080/web/item/list_by_price_vue.do",{
                params:{
                    page:this.curpage,
                    min:min?parseInt(min):null,
                    max:max?parseInt(max):null
                }
            }).then(res=>{
                this.list=res.data.list;
                this.curpage=res.data.curpage;
                this.totalpage=res.data.totalpage;
                this.startPage=res.data.startPage;
                this.endPage=res.data.endPage;
            }).catch(error=>{
                console.log("가격 필터 에러:", error.response)
            })
        },
        prev(){
            this.curpag=this.startPage-1
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
            for(let i=start;i<=end;i++){
                arr.push(i)
            }
            return arr
        },
        dataRecv(){
            axios.get('http://localhost:8080/web/item/list_vue.do',{
                params:{
                    page:this.curpage,
                    ino:this.ino
                }
            }).then(res=>{
                this.list=res.data.list
                this.curpage=res.data.curpage
                this.totalpage=res.data.totalpage
                this.startPage=res.data.startPage
                this.endPage=res.data.endPage
            }).catch(error=>{
                console.log(error.response)
            })
        },
        dataRecvC(){
            axios.get('http://localhost:8080/web/item/list_by_category_vue.do',{
                params:{
                    page:this.curpage,
                    category:this.ino
                }
            }).then(res=>{
                console.log("응답 데이터",res.data)
                this.list=res.data.list
                this.curpage=res.data.curpage
                this.totalpage=res.data.totalpage
                this.startPage=res.data.startPage
                this.endPage=res.data.endPage
            })
        }
    }
	}).mount("#listApp")
</script>
</body>
</html>