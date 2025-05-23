<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 검색</title>
<style type="text/css">
.aspect_img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.search-box {
    display: flex;
    gap: 8px;
    margin-bottom: 20px;
}
.search-select, .search-input {
    height: 38px;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 0 10px;
}
.search-button {
    background-color: gray;
    color: white;
    border: none;
    height: 38px;
    border-radius: 5px;
    padding: 0 15px;
    cursor: pointer;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue@3.2.45/dist/vue.global.prod.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="app-content" id="listApp" data-userid="${sessionScope.userid}">
    <div class="u-s-p-y-90">
        <div class="container">
            <div class="row">
                <!-- 검색창 -->
                <div class="col-12">
                    <form class="search-box" @submit.prevent="search(true)">
                        <select class="search-select" v-model="fd">
                            <option value="name">상품명</option>
                            <option value="type">타입</option>
                            <option value="brand">브랜드</option>
                        </select>
                        <input type="text" class="search-input" v-model="ss" placeholder="검색어를 입력하세요" />
                        <button class="search-button" type="submit">검색</button>
                    </form>
                </div>

                <!-- 상품 리스트 -->
                <div class="col-lg-12 col-md-12 d-flex justify-content-center">
    			  <div class="shop-p" style="max-width: 1080px;width: 100%;">
                        <div class="shop-p__toolbar u-s-m-b-30">
                            <div class="shop-p__tool-style">
                                <div class="tool-style__group u-s-m-b-8">
                                    <span class="js-shop-grid-target is-active">Grid</span>
                                    <span class="js-shop-list-target">List</span>
                                </div>
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
													<c:if test="${sessionScope.userid!=null }">
                                                    <a class="btn--e-brand" data-modal="modal" @click.prevent="cartInsert(vo.ino)">장바구니 추가</a></c:if></div>
                                            </div>
                                            <div class="product-m__content">
                                                <div class="product-m__category">

                                                    <a href="shop-side-version-2.html">{{vo.type}}</a></div>
                                                <div class="product-m__name">

                                                    <a :href="'../item/detail.do?ino='+vo.ino">{{vo.name}}({{vo.rcount}})</a></div>
                                                <div class="product-m__price">{{vo.price}}원</div>
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

                        <!-- 페이지네이션 -->
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
const listApp = Vue.createApp({
    data() {
        return {
            list: [],
            curpage: 1,
            totalpage: 0,
            startPage: 0,
            endPage: 0,
            ss: "",
            fd: "name",
            message: "",
            ino: 0,
            result: "",
            userId: '',
            cno: 0
        }
    },
    mounted(){
        this.search(false)
	    this.userId = $('#listApp').data('userid');
    },
    methods:{
    	search(isSearchClick=false,resetPage=true) {
    	    if(isSearchClick && this.ss.trim()==="") {
    	        alert("검색어를 입력하세요.")
    	        this.dataRecv()
    	        return
    	    }
    	    if(resetPage)this.curpage=1
    	    axios.get("../web/item/find_vue.do", {
    	        params: {
    	            page:this.curpage,
    	            fd:this.fd,
    	            ss:this.ss
    	        }
    	    }).then(res=> {
    	        this.list=res.data.list
    	        this.curpage=res.data.curpage
    	        this.totalpage=res.data.totalpage
    	        this.startPage=res.data.startPage
    	        this.endPage=res.data.endPage
    	        if (this.list.length === 0) {
    	            alert("해당되는 상품은 없습니다")
    	        }
    	    }).catch(error=> {
    	        console.error("검색 오류:", error.response)
    	    })
    	},
        dataRecv(){
            axios.get('../web/item/list_vue.do',{
                params:{
                    page:this.curpage
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
        pageChange(page){
            this.curpage=page
            if (this.ss.trim()!=="")
            {
                this.search(false, false)
            }
            else
            {
                this.dataRecv()
            }
        },
        prev(){
            this.curpage=this.startPage-1
            if (this.ss.trim()!=="")
            {
                this.search(false, false)
            }
            else
            {
                this.dataRecv()
            }
        },
        next(){
            if (this.curpage<this.totalpage) 
            {
                this.curpage+=1
                if(this.ss.trim()!=="")
                {
                    this.search(false, false)
                } 
                else
                {
                    this.dataRecv()
                }
            }
        },
        range(start,end){
            return Array.from({length:end-start+1},(_,i)=>start+i)
        },
        cartInsert(ino){
        	axios.post('../item/cart_insert.do',null, {
          	  params:{
      	          ino: ino,
      	          account: 1,
      	          id: this.userId      	          
          	  }
              })
              .then(response => {
            	  const result = response.data;
            	  console.log(result)
            	  if (result === 'yes') {
                     alert('장바구니에 추가되었습니다!');
                 } else{
                     alert('에러: ' + result);
                 }
              })
          }     
    }
}).mount("#listApp")
</script>
</body>
</html>
