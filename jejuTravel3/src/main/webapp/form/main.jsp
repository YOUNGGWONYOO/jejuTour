<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>JejuTour</title>
	
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
<!---------------------------homepage------------------------------->
<link rel="stylesheet" href="../assets-c/css/je.css">
<!---------------------------main logo------------------------------->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Roboto:900'>
<link rel="stylesheet" href="../assets-c/css/main-logo.css">
<!---------------------------main menu------------------------------->
<link re1="stylesheet" href="../assets-c/css/main-nav-font.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="../assets-c/css/main-nav.css">
<!---------------------------main region------------------------------->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="../assets-c/css/main-region.css">

<!---------------------------UNIFY CSS  ------------------------------->
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Web Fonts -->
<link rel='stylesheet' type='text/css'
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets-c/css/style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="../assets-c/css/headers/header-default.css">
<link rel="stylesheet" href="../assets-c/css/footers/footer-v1.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="../assets-c/plugins/animate.css">
<link rel="stylesheet" href="../assets-c/plugins/line-icons/line-icons.css">
<link rel="stylesheet"
	href="../assets-c/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="../assets-c/plugins/owl-carousel/owl-carousel/owl.carousel.css">
<!-- CSS Page Style -->
<link rel="stylesheet" href="../assets-c/css/pages/page_search.css">
<!---------------------------bootstrap------------------------------->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script>
	$(function(){
		$('.region').keyup(function(){ //입력했을경우 이벤트발생처리
			var search=$('.region').val()

			$.ajax({ 
				type:'post', 
				url:'search.do',
				data:{t_keyword_main:search},
				success:function(data){
		
					$('#namelist').html(data)//태그포함한 문자열을 저장
					$('.lo').hover(function(){
						$(this).addClass('hover')
					},function(){
						$(this).removeClass('hover')
					})
				}//success
			})//$.ajax
			return false; //전송X
		})	
	})
</script>
<style>
.btn, .btn-sm, .btn-search{
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>
	<%@include file="../form/header.jsp" %><br><br>
	<div class="wrapper">

		<!--je-content-->
		<!--main slider-->
		<div class="container">

			<div class="carousel slide carousel-v1 box-shadow shadow-effect-2"
				id="myCarousel">
				<ol class="carousel-indicators">
					<li class="rounded-x active" data-target="#myCarousel"
						data-slide-to="0" class="active"></li>
					<li class="rounded-x" data-target="#myCarousel" data-slide-to="1"></li>
					<li class="rounded-x" data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img class="img-responsive" src="../assets-c/img/main/jeju1-1.jpg"
							alt="">
					</div>
					<div class="item">
						<img class="img-responsive" src="../assets-c/img/main/jeju1-2.jpg"
							alt="">
					</div>
					<div class="item">
						<img class="img-responsive" src="../assets-c/img/main/jeju1-3.jpg"
							alt="">
					</div>
				</div>
				<div class="carousel-arrow">
					<a data-slide="prev" href="#myCarousel"
						class="left carousel-control"> <i class="fa fa-angle-left"></i>
					</a> <a data-slide="next" href="#myCarousel"
						class="right carousel-control"> <i class="fa fa-angle-right"></i>
					</a>
				</div>
			</div>
			<div class="mainseach" style="padding-left:30px">
				<div class="col-xs-6 col-xs-offset-3" style="top: -150px">
					<div class="input-group" style="z-index: 9999">
						<input type="text" class="form-control region"name="t_keyword_main" placeholder="ex. 제주시, 한립읍 .." style="height: 48px;border-radius:5px; ">
							<div id="namelist" style="width:500px;margin-top:60px;"></div>
					</div>
				</div>
			</div>
			<!--main search end-->
		</div>
		<!--main slider end-->

		<!--je-regionmenu-->
		<div class="je-region">
			<main class="page-content">
				<div class="card">
					<div class="content">
						<h2 class="title">제주서부</h2>
						<p class="copy">애월 한경 한림</p>
						<form action="<%=location%>/tour/list.do">
							<input type="hidden" name="region" value="1">
							<button class="btn" type="submit">Let's Go</button>
						</form>
					</div>
				</div>
				<div class="card">
					<div class="content">
						<h2 class="title">제주</h2>
						<p class="copy">제주시</p>
						<form action="<%=location%>/tour/list.do">
							<input type="hidden" name="region" value="2">
							<button class="btn" type="submit">Let's Go</button>
						</form>
					</div>
				</div>
				<div class="card">
					<div class="content">
						<h2 class="title">제주동부</h2>
						<p class="copy">조천 구좌</p>
						<form action="<%=location%>/tour/list.do">
							<input type="hidden" name="region" value="3">
							<button class="btn" type="submit">Let's Go</button>
						</form>
					</div>
				</div>
				<div class="card">
					<div class="content">
						<h2 class="title">우도</h2>
						<p class="copy">우도면</p>
						<form action="<%=location%>/tour/list.do">
							<input type="hidden" name="region" value="4">
							<button class="btn" type="submit">Let's Go</button>
						</form>
					</div>
				</div>
				<div class="card">
					<div class="content">
						<h2 class="title">서귀포동부</h2>
						<p class="copy">남원 표선</p>
						<form action="<%=location%>/tour/list.do">
							<input type="hidden" name="region" value="5">
							<button class="btn" type="submit">Let's Go</button>
						</form>
					</div>
				</div>
				<div class="card">
					<div class="content">
						<h2 class="title">한라산</h2>
						<p class="copy">한라산국립공원</p>
						<form action="<%=location%>/tour/list.do">
							<input type="hidden" name="region" value="6">
							<button class="btn" type="submit">Let's Go</button>
						</form>
					</div>
				</div>
				<div class="card">
					<div class="content">
						<h2 class="title">서귀포</h2>
						<p class="copy">중문</p>
						<form action="<%=location%>/tour/list.do">
							<input type="hidden" name="region" value="7">
							<button class="btn" type="submit">Let's Go</button>
						</form>
					</div>
				</div>
				<div class="card">
					<div class="content">
						<h2 class="title">서귀포서부</h2>
						<p class="copy">대정 인덕</p>
						<form action="<%=location%>/tour/list.do">
							<input type="hidden" name="region" value="8">
							<button class="btn" type="submit">Let's Go</button>
						</form>
					</div>
				</div>
			</main>
		</div>
		
		<br><br><br><br>
		<%@include file="../form/footer.jsp" %>
	</div>


	<!---------------------------main menu.js------------------------------->

	<script src="../assets-c/js/main-nav.js"></script>
	<!---------------------------main menu.js------------------------------->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!---------------------------UNIFY .js------------------------------->
	<!-- JS Global Compulsory -->
	<script type="text/javascript"
		src="../assets-c/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="../assets-c/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript"
		src="../assets-c/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="../assets-c/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="../assets-c/plugins/smoothScroll.js"></script>
	<script type="text/javascript" src="../assets-c/plugins/jquery.parallax.js"></script>
	<script type="text/javascript"
		src="../assets-c/plugins/counter/waypoints.min.js"></script>
	<script type="text/javascript"
		src="../assets-c/plugins/counter/jquery.counterup.min.js"></script>
	<script type="text/javascript"
		src="../assets-c/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
	<!-- JS Customization -->

	<!-- JS Page Level -->
	<script type="text/javascript" src="../assets-c/js/app.js"></script>
	<script type="text/javascript" src="../assets-c/js/plugins/owl-carousel.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			App.init();
			App.initCounter();
			App.initParallaxBg();
			OwlCarousel.initOwlCarousel();
		});
	</script>
</body>
</html>