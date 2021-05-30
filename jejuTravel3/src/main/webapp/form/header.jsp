<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>Header</title>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>JejuTour</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="../assets/js/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Fonts -->
    <link rel="stylesheet" href="../assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/css/simple-line-icons.css">
    <!-- CSS Animate -->
    <link rel="stylesheet" href="../assets/css/animate.css">
    <!-- Carousel -->
    <link rel="stylesheet" href="../assets/js/plugins/carousel/owl.carousel.css">
    <!-- Custom styles for this theme -->
    <link rel="stylesheet" href="../assets/css/main.css">
    <!-- Feature detection -->
    <script src="../assets/js/vendor/modernizr-2.6.2.min.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="assets/js/vendor/html5shiv.js"></script>
    <script src="assets/js/vendor/respond.min.js"></script>
    <![endif]-->
    <style>
	#main-menu{
		margin-left:200px;
		font-size:25px
	}
	#main-menu li{
		padding-left:20px;
	}
</style>
</head> 
  <body>
  <%String location=request.getContextPath(); %>
  <!-- NAVBAR
  ================================================== -->
  <header class="navbar-wrapper">
      <div class="navbar navbar-default navbar-static-top home-navbar" role="navigation">
          <div class="container">
              <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                  </button>
                  <!--logo start-->
                  <div class="brand">
                      <a href="<%= location %>/search/main.do" class="logo">
                          <i class="fa  fa-plane"></i>
                          <span>Jeju</span>Tour</a>
                  </div>
                  <!--logo end-->
              </div>
              <div class="navbar-collapse collapse">
                  <ul class="nav navbar-nav" id="main-menu" >
                        <li><a href="#" onclick="location.href='<%= location %>/search/main.do'">Home</a>
                        </li>
                        <li><a href="#" onclick="location.href='<%= location %>/tour/list.do'">Search</a>
                        </li>
                        <li><a href="#" onclick="location.href='<%= location %>/plan/planList.do?m_id=${sessionScope.m_id}'" >MyPlan</a>
                        </li>
                        <li><a href="#" onclick="location.href='<%= location %>/member/qna.do'" > Q&A</a>
                     	</li>
                   </ul>
                   <ul class="nav navbar-nav pull-right"> 
                  	<c:if test="${sessionScope.m_id == null}">
                  		<li><a href="<%= location %>/member/login.do">Login</a>
                  		</li>
                  		<li><a href="<%= location %>/member/insert.do">SignUp</a>
                  		</li>
                  	</c:if>
                  	<c:if test="${sessionScope.m_id!=null}">
                  		<li><a href="<%= location %>/member/passwordConfirm_Form.do">MyPage</a>
                  		</li>
                  		<li><a href="<%= location %>/member/logout.do">Logout</a>
                  		</li>	
                  	</c:if>	
                  
                  <li>
                  <form action="<%= location %>/search/content.do" method="post" style="margin-left:10px;">
	                    	<input type="text" class="search" name="t_keyword" placeholder="keyword" size="6px">
	                    			<button type="submit" class="btn btn-sm btn-search" ><i class="fa fa-search"></i>
	                   				</button>
	                   		
	                   	</form>
             	 </li>
             	 </ul>
             	
              </div>
                <c:if test="${msg == 'ok'}">
						    <div style="color: green;float:right;">
						            회원정보 수정을 완료했습니다.
						      </div>
				</c:if>
          </div>
      </div>
  </header>



    <!--Global JS-->
    <script src="../assets/js/vendor/jquery-1.11.1.min.js"></script>
    <script src="../assets/js/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/js/plugins/nav/jquery.nav.js"></script>
    <script src="../assets/js/plugins/sticky/jquery.sticky.js"></script>
    <script src="../assets/js/plugins/scrollTo/jquery.scrollTo.js"></script>
    <script src="../assets/js/plugins/wow/wow.min.js"></script>
    <script src="../assets/js/plugins/parallax/jquery.parallax-1.1.3.js"></script>
    <script src="../assets/js/plugins/carousel/owl.carousel.js"></script>
    <script src="../assets/js/src/app.js"></script>
  </body>
</html>