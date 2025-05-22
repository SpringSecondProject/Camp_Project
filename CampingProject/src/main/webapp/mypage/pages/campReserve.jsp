<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
	<title></title>
</head>
<body>
<!--====== Main App ======-->
<div id="app">
	<!--====== App Content ======-->
	<div class="app-content" id="myReserveApp">
		<!--====== Section 1 ======-->
		<div class="u-s-p-b-60">

			<!--====== Section Intro ======-->
			<div class="section__intro u-s-m-b-60">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="section__text-wrap">
								<h1 class="section__heading u-c-secondary">예약 관리</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--====== End - Section Intro ======-->


			<!--====== Section Content ======-->
			<div class="section__content">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 u-s-m-b-30">
							<div class="table-responsive">
								<h3 class="text-center" style="font-size: 24px" v-if="list.length==0">예약 내역이 없습니다</h3>
								<table class="table-p" v-if="list.length!=0">
									<tbody>
										<!--====== Row ======-->
										<tr v-for="vo in list">
											<td>
												<div class="table-p__box">
													<div class="table-p__img-wrap">
														<img class="u-img-fluid" :src="vo.cvo.poster" style="width: 120px;height: 120px;"></div>
													<div class="table-p__info">
	                                                    <span class="table-p__name">
	                                                        <a :href="'../camp/detail.do?cno='+vo.cno">{{vo.title}}</a>
	                                                    </span>
														<ul class="table-p__variant-list">
															<li>
																<span>{{vo.typeStr}} : {{vo.sites.toString()}}</span>
															</li>
															<li>
																<span>주소 : {{vo.cvo.addr}}</span>
															</li>
															<li>
																<span>일정 : {{vo.startDateStr}} ~ {{vo.endDateStr}}</span>
															</li>
														</ul>
													</div>
												</div>
											</td>
											<td>
												<span class="table-p__price">{{vo.price}} 원</span>
											</td>
											<td width="20%">
												<div class="table-p__del-wrap text-center" v-if="vo.state==1">
													<input type="button" value="확정완료" class="btn btn-sm btn-default" disabled>
												</div>
												<div class="table-p__del-wrap text-center" v-if="vo.state==0">
													<input type="button" value="확정" class="btn btn-xs btn-primary" @click="reserveConfirmed(vo.rno)">
													<input type="button" value="취소" class="btn btn-xs btn-danger" @click="reserveCancel(vo.rno)">
												</div>
											</td>
										</tr>
										<!--====== End - Row ======-->
									</tbody>
								</table>
							</div>
							<div class="text-center" v-if="list.length!=0">
								<page-card></page-card>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--====== End - Section Content ======-->
		</div>
		<!--====== End - Section 2 ======-->
	</div>
	<!--====== End - App Content ======-->
</div>
<!--====== End - Main App ======-->
<script src="../js/commons/page-card.js"></script>
<script src="../js/camp/myReserve.js"></script>
</body>
