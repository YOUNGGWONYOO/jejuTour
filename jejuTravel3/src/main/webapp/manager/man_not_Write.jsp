<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
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
                                <h3 class="panel-title">QnA작성</h3>           
                            </div>
                            <div class="panel-body">
                                <form class="form-horizontal form-border" id="form" action="noticeWrite.do" method="post">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">제목</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="n_subject" id="input2">
                                        </div>
                                    </div>        
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">내용</label>
                                        <div class="col-sm-6">                                      
                                            <pre><textarea class="form-control" rows="20" cols="50" name="n_content"></textarea></pre>
                                        </div>
                                    </div>
                                                      
                                    <div class="form-group">
                                        <div class="col-sm-offset-3 col-sm-6">	    
             							     <input type="submit" class="btn btn-primary" value="확인">&nbsp;&nbsp;&nbsp;
              								 <input type="button" class="btn btn-active" value="재작성" onclick="location.reload()">&nbsp;&nbsp;&nbsp;
              								 <input type="button" class="btn btn-warning" value="취소" onclick="location.href='notice.do'">
                                        </div>
                                    </div>
                                        <input type="hidden" name="mgr_id" value="${sessionScope.mgr_id}">
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