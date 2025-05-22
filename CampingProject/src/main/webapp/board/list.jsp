<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
    margin: 40px auto;
    width: 800px;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-size: 16px;
}

h3 {
    text-align: center;
    font-size: 30px;
    margin-bottom: 20px;
}

.table {
    font-size: 16px;
    border-collapse: collapse;
}

.table th {
    background-color: #e9ecef;
    font-weight: 600;
    font-size: 17px;
    text-align: center !important;
    vertical-align: middle !important;
    border-top: 2px solid #dee2e6;
    border-bottom: 2px solid #dee2e6;
}

.table td {
    vertical-align: middle !important;
    text-align: center;
    padding: 12px 8px;
    border-bottom: 1px solid #dee2e6;
}

.table tr:nth-child(even) {
    background-color: #f9f9f9;
}

.table tr:hover {
    background-color: #f1f1f1;
}

a.btn {
    font-size: 16px;
    padding: 6px 12px;
    margin-right: 5px;
}
.btn-container {
    text-align: right;
    margin-bottom: 40px;
}
</style>
</head>
<body>
<div class="row" id="listApp">
    <h3>공지사항</h3>
    <table class="table">
        <tr>
            <th width="10%">번호</th>
            <th width="45%">제목</th>
            <th width="15%">이름</th>
            <th width="20%">작성일</th>
            <th width="10%">조회수</th>
        </tr>
        <tr v-for="vo in list" :key="vo.bno">
            <td>{{ vo.bno }}</td>
            <td style="text-align: left;">
                <a :href="'detail.do?bno=' + vo.bno">{{ vo.subject }}</a>
            </td>
            <td>{{ vo.nickname }}</td>
            <td>{{ vo.regdate }}</td>
            <td>{{ vo.hit }}</td>
        </tr>
    </table>
	<div class="u-s-p-y-60">
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
<script>
let listApp = Vue.createApp({
    data() {
        return {
            list: [],
            curpage: 1,
            totalpage: 0,
            startPage: 0,
            endPage: 0,
            bno: 0
        }
    },
    mounted() {
        this.dataRecv()
    },
    methods: {
        prev() {
            this.curpage=this.startPage-1
            this.dataRecv()
        },
        next() {
            this.curpage=this.endPage+1
            this.dataRecv()
        },
        pageChange(page) {
            this.curpage=page
            this.dataRecv()
        },
        range(start, end) {
            let arr=[]
            for (let i=start;i<=end;i++) {
                arr.push(i)
            }
            return arr
        },
        dataRecv() {
            axios.get('../board/list_vue.do', {
                params: {
                    page: this.curpage,
                    bno: this.bno
                }
            }).then(res=> {
            	console.log(res.data)
                this.list=res.data.list
                this.curpage=res.data.curpage
                this.totalpage=res.data.totalpage
                this.startPage=res.data.startPage
                this.endPage=res.data.endPage
            }).catch(error=> {
                console.log(error.response);
            })
        }
    }
}).mount("#listApp");
</script>
</body>
</html>