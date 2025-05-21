<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
	<title></title>
</head>
<body>
<div class="flex w-full justify-start items-center p-4 bg-gray-200 mb-12">
	<ul class="breadcrumb__list w-full p-4 bg-gray-100 gap-4">
		<li class="has-separator">
			<a href="../main/main.do">Home</a></li>
		<li class="has-separator">
			<a href="../campcar/list.do">CAMPING_CAR</a></li>
		<li class="is-marked">
			<a href="${path}">${path.toUpperCase() }</a>
		</li>
	</ul>
</div>
</body>
