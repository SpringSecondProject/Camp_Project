<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setDateHeader("Expires", 0);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 방문한 레시피</title>
<style>
  .col-7 {
    width: 10px;
    height: 10px;
    object-fit: contain;
    border: 1px solid #eee;
    margin-bottom: 10px;
  }
</style>
</head>
<body>
	<div class="u-s-p-b-60">
		<div class="section__intro u-s-m-b-46">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="block">
							<span class="block__title">최근 방문한 레시피</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section__content">
			<div class="container">
				<div class="row">
					<c:forEach var="vo" items="${recentList}">
						<div class="col-7" style="width: 100%;height: 120px;">
							<a  class="aspect aspect--bg-grey aspect--square u-d-block" href="../recipe/recipe_detail.do?no=${vo.no}">
								<img class="aspect__img" src="${vo.poster}" title="${vo.title }" class="recent-item-img">
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>