<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!--[if IE]>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="../assets/icons/favicon.png" rel="shortcut icon">
	<title>CAMPRO</title>
	<!-- bootstrap -->
	<link rel="stylesheet"
	      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<!--====== Google Font ======-->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800" rel="stylesheet">

	<!--====== Vendor Css ======-->
	<link rel="stylesheet" href="../css/vendor.css">

	<!--====== Utility-Spacing ======-->
	<link rel="stylesheet" href="../css/utility.css">

	<!--====== App ======-->
	<link rel="stylesheet" href="../css/app.css">

	<!-- vue -->
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<!-- jquery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
</head>
<body class="config" id="../js-scrollspy-trigger">
<div class="preloader is-active">
	<div class="preloader__wrap">

		<img class="preloader__img" src="../images/preloader.png" alt=""></div>
</div>

<!--====== Main App ======-->
<div id="app">

	<jsp:include page="header.jsp"/>

	<jsp:include page="${main_jsp }"/>

	<jsp:include page="footer.jsp"/>


	<!--====== Modal Section ======-->

	<!--====== 로그인창 ======
	<div class="modal fade new-l" id="newsletter-modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content modal--shadow">

				<button class="btn new-l__dismiss fas fa-times" type="button" data-dismiss="modal"></button>
				<div class="modal-body">
					<div class="row u-s-m-x-0">
						<div class="col-lg-6 new-l__col-1 u-s-p-x-0">

							<a class="new-l__img-wrap u-d-block" href="shop-side-version-2.html">

								<img class="u-img-fluid u-d-block" src="../images/newsletter/newsletter.jpg" alt=""></a></div>
						<div class="col-lg-6 new-l__col-2">
							<div class="new-l__section u-s-m-t-30">
								<div class="u-s-m-b-8 new-l--center">
									<h3 class="new-l__h3">Newsletter</h3>
								</div>
								<div class="u-s-m-b-30 new-l--center">
									<p class="new-l__p1">Sign up for emails to get the scoop on new arrivals, special sales and more.</p>
								</div>
								<form class="new-l__form">
									<div class="u-s-m-b-15">

										<input class="news-l__input" type="text" placeholder="E-mail Address"></div>
									<div class="u-s-m-b-15">

										<button class="btn btn--e-brand-b-2" type="submit">Sign up!</button></div>
								</form>
								<div class="u-s-m-b-15 new-l--center">
									<p class="new-l__p2">By Signing up, you agree to receive Reshop offers,<br />promotions and other commercial messages. You may unsubscribe at any time.</p>
								</div>
								<div class="u-s-m-b-15 new-l--center">

									<a class="new-l__link" data-dismiss="modal">No Thanks</a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	====== End - Newsletter Subscribe Modal ======-->
	<!--====== End - Modal Section ======-->
</div>
<!--====== End - Main App ======-->


<!--====== Google Analytics: change UA-XXXXX-Y to be your site's ID ======-->
<script>
  window.ga = function () {
    ga.q.push(arguments)
  };
  ga.q = [];
  ga.l = +new Date;
  ga('create', 'UA-XXXXX-Y', 'auto');
  ga('send', 'pageview')
</script>
<script src="https://www.google-analytics.com/analytics.js" async defer></script>

<!--====== Vendor Js ======-->
<script src="../js/vendor.js"></script>

<!--====== jQuery Shopnav plugin ======-->
<script src="../js/jquery.shopnav.js"></script>

<!--====== App ======-->
<script src="../js/app.js"></script>

<!--====== Noscript ======-->
<noscript>
	<div class="app-setting">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="app-setting__wrap">
						<h1 class="app-setting__h1">JavaScript is disabled in your browser.</h1>

						<span class="app-setting__text">Please enable JavaScript in your browser or upgrade to a JavaScript-capable browser.</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</noscript>
</body>
</html>