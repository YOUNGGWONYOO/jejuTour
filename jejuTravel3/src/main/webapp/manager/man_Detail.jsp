<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>             
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원상세 정보</title>
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

<section id="main-content" class="animated fadeInUp" style="width:1200px;margin:0 auto;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">회원정보</h3>
                            </div>
                            <div class="panel-body">
                                <form class="form-horizontal form-border" id="form" >
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">아이디</label>
                                        <div class="col-sm-6">
                                            ${mem.m_id}
                                        </div>
                                    </div>     
                                     <div class="form-group">
                                        <label class="col-sm-3 control-label">비밀번호</label>
                                        <div class="col-sm-6">
                                            ${mem_de.m_pw}
                                        </div>
                                    </div>     
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">이름</label>
                                        <div class="col-sm-6">
                                            ${mem.m_name}
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">이메일</label>
                                        <div class="col-sm-6">
                                            ${mem.m_email}
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">전화번호</label>
                                        <div class="col-sm-6">
                                            ${mem.m_phone}
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">가입날짜</label>
                                        <div class="col-sm-6">
                                            ${mem.m_date}
                                        </div>
                                    </div>                      
                                    <div class="form-group">
                                        <div class="col-sm-offset-3 col-sm-6">
                                        	<input type="button" class="btn btn-info" value="목록보기" onclick="location.href='list.do'">&nbsp;&nbsp;&nbsp;
                                            <input type="button" class="btn btn-primary" value="수정" onclick="location.href='update.do?m_id=${mem.m_id}'">&nbsp;&nbsp;&nbsp;
             								<input type="button" class="btn btn-warning" value="삭제" onclick="location.href='delete.do?m_id=${mem.m_id}'">
                                        </div>
                                    </div>
                                        <input type="hidden" name="m_id" value="${mem.m_id}">
                                </form>
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





