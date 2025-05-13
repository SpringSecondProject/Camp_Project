<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <section class="archive-area section_padding_80" id="listApp">
  <div class="container mt-4">
    <div class="row" id="detail">
		<table class="table">
			<tr>
				<td colspan="3" class="text-center">
				<img :src="vo.poster" style="width:750px;height:300px">
				</td>
			</tr>
			<tr>
				<td colspan="3" class="text-center">
				<h3>{{vo.title}}</h3>
				</td>
			</tr>
			<tr>
				<td colspan="3" class="text-center">
				<span style="color:gray">{{vo.content}}</span>
				</td>
			</tr>
			<tr>
				<td class="text-center"><img src="../images/icon/recipe/a1.png"></td>
				<td class="text-center"><img src="../images/icon/recipe/a2.png"></td>
				<td class="text-center"><img src="../images/icon/recipe/a3.png"></td>
			</tr>
			<tr>
				<td class="text-center">{{vo.cook_portion}}</td>
				<td class="text-center">{{vo.cook_time}}</td>
				<td class="text-center">{{vo.cook_level}}</td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<td><h3>[재료]</h3></td>
			</tr>
			<tr>
				<td>
					<ul>
						<li v-for="d in materials">{{d}}</li>
					</ul>
				</td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<td>
					<h3>[조리순서]</h3>
				</td>
			</tr>
			<tr>
				<td>
				 <table class="table" v-for="(m,index) in mlist">
				 	<tr>
				 		<td width=80% class="text-left">{{m}}</td>
				 		<td width=20% class="text-right">
				 			<img :src="ilist[index]" style="width:120px; height:80px">
				 		</td>
				 	</tr>
				 </table>
				</td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<td colspan=2>
					<h3>[레시피 작성자]</h3>
				</td>
			</tr>
			<tr>
				<td width=30% class="text-center">
					<img :src="vo.chef_poster" style="width: 50px;height:50px" class="img-circle">
				</td>
				<td width=70%>
					{{vo.chef}}<br>
					<sub>{{vo.chef_comment}}</sub>
				</td>
			</tr>
		</table>
    </div>
  </div>
  </section>
  <script>
  let listApp=Vue.createApp({
  	data(){
  		return {
			no:${param.no},
			vo:{},
			mlist:[],
			ilist:[],
			materials:[]			
  		}
  	},
  	mounted(){
  		this.dataRecv()
  	},
  	methods:{
		async dataRecv() {
		  try
		  {
			const res=await axios.get('../recipe/recipe_detail_vue.do',{
				params:{
					no:this.no
				}
			})
			console.log(res)
			this.vo=res.data.vo
			this.mlist=res.data.mlist
			this.ilist=res.data.ilist
			this.materials=res.data.vo.materials.split(RecipeConfig.MATERIAL_SEPERATOR);
		  }catch(err){
			console.log("데이터 수신 중 오류 발생:",err.response);
		  }
		}
  	}
  }).mount("#listApp")
  </script>
  
</body>
</html>