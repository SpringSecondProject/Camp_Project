<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
	<title></title>
</head>
<body>
<div id="sideNavApp"
     class="flex flex-col px-8 py-16 w-full bg-white shadow-lg text-2xl gap-4 mb-12">
	<a id="account" href="../admin/member.do">
		회원
	</a>
</div>
<script>
  const currentPath = document.getElementById("${path}")
  currentPath.classList.add('font-bold')
  currentPath.classList.add('underline')
  currentPath.classList.add('underline-offset-4')
</script>
</body>
