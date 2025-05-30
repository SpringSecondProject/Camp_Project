<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
	<title></title>
</head>
<body>
<div id="sideNavApp"
     class="flex flex-col px-8 py-16 w-full bg-white shadow-lg text-2xl gap-4 mb-12">
	<a id="account" href="../mypage/main.do">
		계정
	</a>
	<a id="profile" href="../mypage/profile.do">
		프로필
	</a>
	<a id="mileage" href="../mypage/mileage.do">
		마일리지 조회
	</a>
	<a id="campreserve" href="../mypage/campreserve.do">
		캠핑장 예약 관리
	</a>
	<a id="campcarrent" href="../mypage/campcarrent.do">
		캠핑카 렌트 내역
	</a>
	<a id="cart" href="../mypage/cart.do">
		장바구니
	</a>
	<a id="buy" href="../mypage/buy.do">
		구매내역
	</a>
	<a id="like" href="../like/likeList.do">
		좋아요
	</a>
	<a id="reply" href="../mypage/reply.do">
		댓글
	</a>
</div>
<script>
  const currentPath = document.getElementById("${path}")
  currentPath.classList.add('font-bold')
  currentPath.classList.add('underline')
  currentPath.classList.add('underline-offset-4')
</script>
</body>
