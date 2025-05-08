<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${vo.intro!='' }">
		<table class="table">
			<tr>
				<td><pre
						style="white-space: normal; background-color: white; border: none; font-size: 12px">${vo.intro }</pre>
					최종정보 수정일 : ${vo.modifiedtime}</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${vo.sbrsCl!='' }">
		<h3>
			<i class="fas fa-check-circle u-s-m-r-8" style="color: green;"></i> <span
				style="color: black;">캠핑장 시설정보<span>
		</h3>
		<table class="table">
			<tr>
				<td>
					<div class="row" style="background-color: #F9F9F9;">
						<c:forEach var="sbr" items="${sbrsCl}">
							<c:if test="${sbr.check==1}">
								<div
									style="width: 80px; height: 80px; text-align: center; line-height: 200%; margin: 20px">
									<img src="../images/icon/camp/icon_${sbr.no }.PNG"
										style="width: 50px; height: 50px;">
									<div>${sbr.text }</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>
	</c:if>
	<h3>
		<i class="fas fa-check-circle u-s-m-r-8" style="color: green;"></i> <span
			style="color: black;">기타 주요시설<span>
	</h3>
	<table class="table" style="font-size: 12px">
		<c:if test="${main!=''}">
			<tr>
				<th class="text-center" width="20%">주요시설</th>
				<td class="text-left" width="80%">${main }</td>
			</tr>
		</c:if>
		<c:if test="${floor!=''}">
			<tr>
				<th class="text-center" width="20%">바닥형태 (단위:면)</th>
				<td class="text-left" width="80%">${floor }</td>
			</tr>
		</c:if>
		<c:if test="${size!=''}">
			<tr>
				<th class="text-center" width="20%">사이트 크기</th>
				<td class="text-left" width="80%">${size }</td>
			</tr>
		</c:if>
		<c:if test="${vo.glampInnerFclty!='' }">
			<tr>
				<th class="text-center" width="20%">글램핑 내부시설</th>
				<td class="text-left" width="80%">${vo.glampInnerFclty}</td>
			</tr>
		</c:if>
		<c:if test="${vo.caravInnerFclty!='' }">
			<tr>
				<th class="text-center" width="20%">카라반 내부시설</th>
				<td class="text-left" width="80%">${vo.caravInnerFclty }</td>
			</tr>
		</c:if>
		<c:if test="${vo.animalCmgCl!='' }">
			<tr>
				<th class="text-center" width="20%">반려동물 출입</th>
				<td class="text-left" width="80%">${vo.animalCmgCl }</td>
			</tr>
		</c:if>
		<c:if test="${vo.brazierCl!='' }">
			<tr>
				<th class="text-center" width="20%">화로대</th>
				<td class="text-left" width="80%">${vo.brazierCl }</td>
			</tr>
		</c:if>
		<c:if test="${safe!=''}">
			<tr>
				<th class="text-center" width="20%">안전시설현황</th>
				<td class="text-left" width="80%">${safe }</td>
			</tr>
		</c:if>
	</table>
	<div class="row">
		<c:forEach var="img" items="${images }">
			<div class="col-md-2">
				<div class="thumbnail">
					<img src="${img }" alt="Lights" style="height: 80px">
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>