<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
<head>
    <title>비밀번호 확인</title>
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
</head>

<body>
<%String location=request.getContextPath(); %>
    <section class="container animated fadeInUp">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div id="login-wrapper">
                    <header>
                        <div class="brand">
                            <a href="loginSuccess.do" class="logo">
                                <i class="icon-layers"></i>
                                <span>Jeju</span>Travel</a>
                        </div>
                    </header>
                    <div class="panel panel-primary" id="locked-screen">
                        <div class="panel-heading">
                            <h3 class="panel-title">     
                          비밀번호 확인
                        </h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form" action="passwordConfirm.do" method="post">
                              <div class="profile-pic text-center">
                                        <img src="../img/jeju.jpg" alt="" class="img-circle" style="width:200px;height:200px">
                                    </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="password" class="form-control" id="password" name="m_pw" placeholder="Password">
                                        <i class="fa fa-lock"></i>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="submit" class="btn btn-primary btn-block" value="확인">
                                        <input type="button" class="btn btn-warning btn-block" value="취소" onclick="location.href='<%=location%>/search/main.do'">
                                         <c:if test="${msg == 'password'}">
						                    <div style="color: red">
						                        비밀번호를 확인하세요
						                    </div>
						                </c:if>
                                    </div>
                                </div>
                                <input type="hidden" name="m_id" value="${sessionScope.m_id}">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!--Global JS-->
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
