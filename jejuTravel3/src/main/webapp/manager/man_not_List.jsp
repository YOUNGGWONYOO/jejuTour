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
<style>
	#notice {position:absolute;top:5%; left:60%;}
	#notice_table {background-color: skyblue;}
</style>
</head>
<body>
<%-- 	<h2 align="center">회원목록</h2>
	<a href="noticeForm.do" id="notice">공지사항 작성</a>
	<c:if test="${count==0}">
	   <div align="center">출력할 리스트가 없습니다.</div>
	</c:if>
	<!-- 레코드가 한개라도 존재한다면  -->
	<c:if test="${count > 0}">
		<table width="700" border="1" align="center">
			<tr>
				<td width="100">번호</td>
				<td width="400">제목</td>
				<td width="100">아이디</td>
				<td width="100">작성일</td>
			</tr>
			<c:if test="${count_n > 0}">
				<c:forEach var="n"  items="${list_n}">
				<tr id="notice_table">
					<td width="100">공지사항</td>
					<td width="400"><a href="noticeDetail.do?n_seq=${n.n_seq}">${n.n_subject}</a></td>
					<td width="100">${n.mgr_id}</td>
					<td width="100">${n.n_write_date}</td>
				</tr>
			</c:forEach>
			</c:if> 
			<c:forEach var="q"  items="${list}">
				<tr>
					<td width="100">${q.q_seq}</td>
					<td width="400"><a href="qnaDetail.do?q_seq=${q.q_seq}">${q.q_subject}</a></td>
					<td width="100">${q.m_id}</td>
					<td width="100">${q.q_write_date}</td>
				</tr>
			</c:forEach>
		</table>
		<table width="700" align="center">
			<tr>
				<td align="center">${pagingHtml}</td>
			</tr>
		</table>
</c:if>
<center>
<input type="button" id="btn" value="뒤로가기" onclick="history.back()">
<input type="button" id="btn2" value="로그아웃" onclick="location.href='logout.do'">
</center> --%>



<div class="panel panel-default" style="width:1200px;margin:0 auto;">
      <div class="panel-heading">
          <h3 class="panel-title">공지 및 QnA</h3>      
      </div>
         <div class="panel-body">
	<c:if test="${count==0}">
		<table class="table">
				<tr>
					<td width="100">번호</td>
					<td width="400">제목</td>
					<td width="100">아이디</td>
					<td width="100">작성일</td>
				</tr>
				<c:if test="${count_n > 0}">
					<c:forEach var="n"  items="${list_n}">
					<tr class="info">
						<td width="100">공지사항</td>
						<td width="400"><a href="noticeDetail.do?n_seq=${n.n_seq}">${n.n_subject}</a></td>
						<td width="100">${n.mgr_id}</td>
						<td width="100">${n.n_write_date}</td>
					</tr>
				</c:forEach>
				</c:if> 
			</table>
			<table class="table">
				<tr>
					<td align="center">${pagingHtml}</td>
				</tr>
			</table>
	   <div align="center">출력할 qna가 없습니다.</div><br>
	</c:if>
	<!-- 레코드가 한개라도 존재한다면  -->
	<c:if test="${count > 0}">
		<table class="table">
			<tr>
				<td width="100">번호</td>
				<td width="400">제목</td>
				<td width="100">아이디</td>
				<td width="100">작성일</td>
			</tr>
			<c:if test="${count_n > 0}">
				<c:forEach var="n"  items="${list_n}">
				<tr class="info">
					<td width="100">공지사항</td>
					<td width="400"><a href="noticeDetail.do?n_seq=${n.n_seq}">${n.n_subject}</a></td>
					<td width="100">${n.mgr_id}</td>
					<td width="100">${n.n_write_date}</td>
				</tr>
			</c:forEach>
			</c:if> 
			<c:forEach var="q"  items="${list}" varStatus="i">
				<tr class="default">
					<td width="100">${q.q_seq}</td>
					<td width="400"><a href="qnaDetail.do?q_seq=${q.q_seq}">${q.q_subject}</a></td>
					<td width="100">${q.m_id}</td>
					<td width="100">${q.q_write_date}</td>
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
<input type="button" class="btn btn-warning" value="로그아웃" onclick="location.href='logout.do'">&nbsp;&nbsp;&nbsp;
<input type="button" class="btn btn-success" id="write" value="공지사항 작성" onclick="location.href='noticeForm.do'">
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







