<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>전체검색</title>
</head>
<body>
	<form action="content.do" method="post">
		<h1>검색할 키워드를 입력하세요</h1> 
		검색어:<input type="text" name="t_keyword">&nbsp;&nbsp;
		<input type="submit" value="검색">
	</form>
</body>
</html>