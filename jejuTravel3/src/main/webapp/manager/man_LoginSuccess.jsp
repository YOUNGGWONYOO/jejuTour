<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인성공</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Favicon -->
    <link rel="shortcut icon" href="../assets-b/img/favicon.ico" type="image/x-icon">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="../assets-b/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Fonts  -->
    <link rel="stylesheet" href="../assets-b/css/font-awesome.min.css">
    <link rel="stylesheet" href="../assets-b/css/simple-line-icons.css">
    <!-- Switchery -->
    <link rel="stylesheet" href="../assets-b/plugins/switchery/switchery.min.css">
    <!-- CSS Animate -->
    <link rel="stylesheet" href="../assets-b/css/animate.css">
    <!-- Custom styles for this theme -->
    <link rel="stylesheet" href="../assets-b/css/main.css">
    <!-- Feature detection -->
    <script src="../assets-b/js/vendor/modernizr-2.6.2.min.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="assets/js/vendor/html5shiv.js"></script>
    <script src="assets/js/vendor/respond.min.js"></script>
    <![endif]-->
<style>
	#i1,#i2 {text-align: center;}
</style>
</head>
<body>

<section id="main-content" class="animated fadeInUp" style="width:1200px;margin:0 auto;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">관리자</h3>
                            </div>
                            <div class="panel-body">
                                    <div class="form-group"  id="i1">
                                        <label class="control-label">${sessionScope.mgr_id}님의 관리자 페이지</label><br><br><br>
                                    </div>                                                 
                                    <div class="form-group">
                                        <div id="i2">
                                            <input type="button" class="btn btn-info" value="회원관리" onclick="location.href='list.do'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             								<input type="button" class="btn btn-success" value="로그아웃" onclick="location.href='logout.do'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             								<input type="button" class="btn btn-warning" value="공지사항" onclick="location.href='notice.do'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </div>
                                    </div>
                                        <c:if test="${msg == 'ok'}">
						                    <div style="color: green">
						                        회원정보 수정을 완료했습니다.
						                    </div>
						                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

<script src="../assets-b/js/vendor/jquery-1.11.1.min.js"></script>
    <script src="../assets-b/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets-b/plugins/navgoco/jquery.navgoco.min.js"></script>
    <script src="../assets-b/plugins/switchery/switchery.min.js"></script>
    <script src="../assets-b/plugins/pace/pace.min.js"></script>
      <script src="../assets-b/plugins/fullscreen/jquery.fullscreen-min.js"></script>
    <script src="../assets-b/js/src/app.js"></script>
    <script src="../assets-b/plugins/validation/js/jquery.validate.min.js"></script>
    <script>
    $(document).ready(function() {
        app.formValidation();
    });
    </script>
</body>
</html>