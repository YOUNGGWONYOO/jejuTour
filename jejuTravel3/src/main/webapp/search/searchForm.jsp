<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>검색</title>
<script>
	$(function(){
		$('.region').keyup(function(){ //입력했을경우 이벤트발생처리
			var search=$('.region').val()

			$.ajax({ 
				type:'post', 
				url:'search.do',
				data:{t_keyword:search},
				success:function(data){
		
					$('#namelist').html(data)//태그포함한 문자열을 저장
					$('a').hover(function(){
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
</head>
<body>
		<h1>검색할 지역명을 입력하세요</h1> 
		검색어:<input type="text" name="t_keyword" class="region"><br><br>
		<div id="namelist"></div>
</body>
</html>