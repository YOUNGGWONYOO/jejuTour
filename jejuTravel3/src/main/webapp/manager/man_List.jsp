<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원리스트</title>
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
	<div class="panel panel-default" style="width:1200px;margin:0 auto;">
      <div class="panel-heading">
          <h3 class="panel-title">회원목록</h3>      
      </div>
       <div class="panel-body">
	<c:if test="${count==0}">
	   <div align="center">출력할 리스트가 없습니다.</div>
	</c:if>
	<!-- 레코드가 한개라도 존재한다면  -->
	<c:if test="${count > 0}">
		<table class="table" style="text-align: center">
			<tr class="info">
				<td width="100">아이디</td>
				<td width="100">이름</td>
				<td width="100">가입일자</td>
			</tr>
			<c:forEach var="mem"  items="${list}">
				<tr>
					<td width="100"><a href="detail.do?m_id=${mem.m_id}">${mem.m_id}</a></td>
					<td width="100">${mem.m_name}</td>
					<td width="100">${mem.m_date}</td>
				</tr>
			</c:forEach>
		</table>
		<table class="table">
			<tr>
				<td align="center">${pagingHtml}</td>
			</tr>
		</table>
</c:if>
<center>
<input type="button" class="btn btn-primary" value="뒤로가기" onclick="location.href='loginCheck.do?mgr_id=${sessionScope.mgr_id}&mgr_pw=${sessionScope.mgr_pw}'">&nbsp;&nbsp;&nbsp;
<input type="button" class="btn btn-warning" value="로그아웃" onclick="location.href='logout.do'">
</center>
</div>
</div>

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







