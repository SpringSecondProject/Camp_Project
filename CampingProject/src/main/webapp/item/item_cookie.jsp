<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 방문한 상품</title>
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
	<div class="u-s-p-b-60" id="electronic-01">
		<div class="section__intro u-s-m-b-46">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="block">
							<span class="block__title">최근 방문한 상품</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="section__content">
			<div class="container">
				<div class="row">
					<c:forEach var="vo" items="${recentList}">
						<div class="col-7">
							<a  class="aspect aspect--bg-grey aspect--square u-d-block" href="../item/detail.do?ino=${vo.ino}">
								<img class="aspect__img" src="https://www.ocamall.com/${vo.poster}" class="recent-item-img" alt="">
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
