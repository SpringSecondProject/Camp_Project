<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
	<title></title>
	<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div id="app" class="flex justify-center w-screen min-h-screen p-24">
	<div class="flex flex-col w-4/5 mx-auto">
		<jsp:include page="components/breadcrumb.jsp"/>
		<div class="flex flex-row w-full">
			<div class="flex flex-col w-1/4">
				<jsp:include page="components/sideNav.jsp"/>
				<jsp:include page="components/orderSummary.jsp"/>
			</div>
			<div class="flex flex-col w-full px-8">
				<jsp:include page="${page }"/>
			</div>
		</div>
	</div>
</div>
</body>
