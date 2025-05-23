<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
</style>
</head>
<body>
	<div class="row" id="nlistApp" style="margin-top: 10px;">
	    <h3>공지사항</h3>
	    <table class="table">
	        <tr>
	            <th width="10%">번호</th>
	            <th width="45%">제목</th>
	            <th width="15%">이름</th>
	            <th width="20%">작성일</th>
	            <th width="10%">조회수</th>
	        </tr>
	        <tr v-for="nvo in nlist" :key="nvo.bno">
	            <td>{{ nvo.bno }}</td>
	            <td style="text-align: left;">
	                <a :href="'detail.do?bno=' + nvo.bno">{{ nvo.subject }}</a>
	            </td>
	            <td>{{ nvo.nickname }}</td>
	            <td>{{ nvo.regdate }}</td>
	            <td>{{ nvo.hit }}</td>
	        </tr>
	    </table>
	</div>
<script>
let listApp = Vue.createApp({
    data() {
        return {
            nlist: [],
        }
    },
    mounted() {
        this.dataRecv()
    },
    methods: {
        dataRecv() {
            axios.get('../main/notice_list.do')
            .then(res=> {
                this.nlist=res.data
            }).catch(error=> {
                console.log(error.response)
            })
        }
    }
}).mount("#nlistApp");
</script>
</body>
</html>