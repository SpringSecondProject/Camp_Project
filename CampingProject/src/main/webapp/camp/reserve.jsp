<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://cdn.jsdelivr.net/npm/@fullcalendar/icalendar@5.11.3/main.css' rel='stylesheet' />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/locales-all.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style type="text/css">
#siteStr{
	width: 180px;
	white-space: normal;
	word-break: break-word;
	display: inline-block;
}
.link{
	cursor: pointer;
}
</style>
</head>
<body>
	<!--====== App Content ======-->
    <div class="app-content" id="reserveApp">
		<div id="reserve-data" data-cno=${param.cno } data-point=${sessionScope.point }></div>

        <!--====== Section 1 ======-->
        <div class="u-s-p-t-90">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">

                        <div>
                            <ul class="pd-breadcrumb__list">
                                <li class="has-separator">
                                    <a href="../main/main.do">Home</a></li>
                                <li class="has-separator">
                                    <a href="../camp/list.do">캠핑장 목록</a></li>
                                <li class="has-separator">
                                    <a href="../camp/detail.do?cno=${param.cno}">캠핑장 상세</a></li>
                                <li class="has-separator">
                                    <a href="../camp/reserve.do?cno=${param.cno}">캠핑장 예약</a></li>
                            </ul>
                        </div>

                       	<table class="table" style="font-size: 16px">
                       		<tr>
                       			<td class="text-center" colspan="3">
                       				<img :src="vo.poster" style="width: 80%;height: auto;">
                       			</td>
                       		</tr>
                       		<tr>
                       			<td class="text-center" colspan="3">
                       				<h3>{{vo.title}}</h3>
                       			</td>
                       		</tr>
                       		<tr>
                       			<th width="20">일정</th>
                       			<td width="65" class="text-center" style="padding: 8px 0px;"><span v-if="endDate!=''">{{startDate}} - {{endDate}}</span></td>
                       			<td width="15%" class="text-center">
                       				<input type="button" class="btn-sm btn-success" value="저장" v-if="!isDate" style="width: 60px;" @click="selectDate()">
                       				<input type="button" class="btn-sm btn-warning" value="초기화" v-if="isDate" @click="resetDate()">
                       			</td>
                       		</tr>
                       		<tr v-if="isDate">
                       			<th width="20%">사이트</th>
                       			<td width="65" class="text-center" style="padding: 8px 0px;"><p id="siteStr">{{checks.toString()}}</p></td>
                       			<td width="15%" class="text-center">
                       				<input type="button" class="btn-sm btn-success" value="저장" v-if="!isSite" style="width: 60px;" @click="selectSite()">
                       				<input type="button" class="btn-sm btn-warning" value="초기화" v-if="isSite" @click="resetSite()">
                       			</td>
                       		</tr>
                       		<tr v-if="totalPrice">
                       			<th width="20%">비용</th>
                       			<td colspan="2">
                       				<span title="(일 수)*(사이트수)*(1박 비용)">{{night}}일 * {{checks.length}}개 * {{priceStr}}원 = {{totalPriceStr}}원</span>
                       			</td>
                       		</tr>
                       	</table>
                       	<table class="table" style="font-size: 16px" v-if="isDate && isSite">
                       		<tr>
                       			<th width="25%" class="text-center">보유<br>마일리지</th>
                       			<td class="text-center">
                       				${sessionScope.point} point
                       			</td>
                       		</tr>
                       		<tr>
                       			<th width="25%" class="text-center">사용<br>마일리지</th>
                       			<td class="text-center">
                       				<input type="number" min="0" ref="usePoint" v-model="usePoint" @input="pointInsert()">
                       			</td>
                       		</tr>
                       		<tr>
                       			<th width="25%">결제 금액</th>
                       			<td class="text-center">
                       				{{payPriceStr}}원
                       			</td>
                       		</tr>
                       		<tr>
                       			<td colspan="2" class="text-center">
                       				<input type="button" class="btn-lg btn-success" value="예약" @click="reserve()" style="width: 100%">
                       			</td>
                       		</tr>
                       	</table>
                    </div>
                    <div class="col-lg-8">
                    	<div id="calendar-box" ref="calendar-box" v-show="!isDate">
	                       	<div id="calendar"></div>
                    	</div>
                    	<div id="site-box" ref="site-box" v-show="isDate && !isSite">
		                	<select ref="type" v-model="type" style="font-size: 16px" @change="typeChange()">
		                		<option v-for="s in sList" :value="s.type">{{s.typeStr}} - {{s.price}}원</option>
		                	</select>
			                <div class="row">
			                	<div class="col-lg-3" v-for="r,idx in rList">
								    <div class="thumbnail reserveBox" :id="'reserveBox'+idx" :style="r===1?'opacity: 0.3':''">
									    <a @click="sCheck(r,idx)">
									        <img :src="vo.poster" style="width:100%">
									        <div class="caption">
									        	<p>{{typeStr}}-{{idx+1}} (<span style="color: gray;">{{priceStr}}원</span>)</p>
									        </div>
									    </a>
								    </div>
								</div>
			                </div>
                    	</div>
                    	<div id="notic-box" ref="notic-box" v-show="isDate && isSite">
                    		<h3>예약 현황</h3>
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
        </div>
        <!--====== End - Section 1 ======-->
    </div>
    <!--====== End - App Content ======-->
    <script src="../js/commons/page-card.js"></script>
    <script src="../js/camp/reserve.js"></script>
</body>
</html>