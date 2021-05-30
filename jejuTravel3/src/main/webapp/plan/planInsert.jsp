<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

	<!-- Naver -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=htmm65yl64"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!--Global JS-->
 	<script src="../assets-b/js/vendor/jquery-1.11.1.min.js"></script>
    <script src="../assets-b/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- 새로고침했을때 해더 쪽에 뜨는 슬라이드바?같은거 -->
    <script src="../assets-b/plugins/pace/pace.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="../assets-b/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Custom styles for this theme -->
    <link rel="stylesheet" href="../assets-b/css/main.css">
    
    <!-- datepicker -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">

<style>
body {
	width: 1300px;
	margin: 0 auto;
}
.container{
	padding:15px;
	background: white;
}
* {
	box-sizing: border-box;
}

body {
	font-size: 16px;
	font-family: arial;
}

.content-left {
	border: 1px solid;
	padding: 15px;
	border-color: orange;
	float: left;
}

.content-right {
	border: 1px solid;
	padding: 15px;
	border-color: orange;
	float: left;
}

.content {
	clear: both;
	border: 1px solid;
	width: 32%;
	height: 50px;
	display: inline-block;
}

ul {
	list-style: none;
}

#NaverMap {
	float: right;
	margin-right: 15px;
}

#insertList{
	clear: both;
}

.form_wrapper {
	border: 3px solid;
	float: left;
	width: 38%;
	height: 40%;
	padding: 15px;
}
.form-horizontal{
	
}


</style>
<script>
$(function(){
	
	var plan_id='${plan_id}';
	var selectday= '${selectday}';
	var totalday = '${totalday}';
	var m_id = '${sessionScope.m_id}';
 	$.ajax({
		type: 'POST',
		url: 'NaverMap.do',
		traditional : true,
		data:{'selectday':selectday,'plan_id':plan_id},
		error : function(request, status, error){
			alert("통신실패");
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success : function(result){
			//alert("통신성공");
			$('#NaverMap').empty();
			$('#NaverMap').append(result);
		} 
	});
	$.ajax({
		type: 'POST',
		url: 'planInsertList.do',
		traditional : true,
		data:{'selectday':selectday,'plan_id':plan_id,'totalday':totalday,'m_id':m_id},
		error : function(request, status, error){
			alert("통신실패");
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success : function(result){
			//alert("통신성공");
			$('#insertList').empty();
			$('#insertList').append(result);
		} 
	});
//--------------처음 ajax  끝
	

//--------------insertList 가 바뀌었을 때.
	$('#titleCheck').hide()
	$('#dateCheck').hide()
	$('#memoCheck').hide()	   	
	
	/* $('#btn').click(function(e) {
		
			var title = $('#title').val()
			if (title.length < 1) {
				$('#titleCheck').show()
				return false
			} else {
				$('#titleCheck').hide()
			}

			var memo = $('#memo').val()
			if (memo.length < 1) {
				$('#memoCheck').show()
				return false
			} else {
				$('#memoCheck').hide()
			}
			
			alert('일정이 생성되었습니다.')
			$('#form').submit();
		}) */
		
//-------------유효성검사 끝
		var arrive_date = '${planinsertcommand.arrive_date }';
		var dprt_date = '${planinsertcommand.dprt_date }';
		var arrive_y= '20'+arrive_date.substring(0,2);
		var arrive_m= arrive_date.substring(3,5);
		var arrive_d= arrive_date.substring(6);
		
		var dprt_y= '20'+dprt_date.substring(0,2);
		var dprt_m= dprt_date.substring(3,5);
		var dprt_d= dprt_date.substring(6);

		 //new Date(2021,04,12) 하기위해
		 //21-05-12
		var result_arrive_date =arrive_date.replace(/-/gi,'');//  /-/gi 정규식
		var result_dprt_date=dprt_date.replace(/-/gi,'');
		 
		//alert(result_arrive_date);//21-05-06
		//alert(result_dprt_date);//21-05-06
		$('#dprt_date').datepicker({
			format:'yy-mm-dd',
			language:'kr',
			todayHighlight:true,
			autoclose : true,
			constrainInput: false
			//startDate: '0d'
		}).datepicker('setDate',new Date(dprt_y,dprt_m-1,dprt_d))
		.on('changeDate',function(selectedDate){
			if($('#dprt_date').val() > $('#arrive_date').val()){
				alert('도착날짜를 넘었습니다.');
				$('#dprt_date').datepicker('setDate',new Date($('#arrive_date').val()));
			}/* else{
				$.ajax({
					type: 'POST',
					url: 'planInsertList.do',
					traditional : true,
					data:{'selectday':selectday,'plan_id':plan_id,'totalday':totalday},
					error : function(request, status, error){
						alert("통신실패");
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					success : function(result){
						alert("통신성공");
						$('#insertList').empty();
						$('#insertList').append(result);
					} 
				});
				
			} */
				
		});		
		
		$('#arrive_date').datepicker({
			format:'yy-mm-dd',
			language:'kr',
			todayHighlight:true,
			autoclose : true,
			constrainInput: false
			
		}).datepicker('setDate',new Date(arrive_y,arrive_m-1,arrive_d))
		.on('changeDate',function(){
			if($('#dprt_date').val() > $('#arrive_date').val()){
				$('#arrive_date').datepicker('setDate',new Date($('#dprt_date').val()));
			}
		});//datepicker 끝
	
		
	})//전체 function
</script>
</head>
<body>
	<div class="container">
	
		<div class="form_wrapper" >
			<form class="form-horizontal" role="form" id="form"
				action="planUpdate.do" method="post">
				<div class="form-group" style="margin-left:5px;">
					일정제목 <br> <input type="text" name="title" id="title" disabled value="${planinsertcommand.title}">

					<div id="titleCheck">필수사항입니다.</div>
				</div>
				<div class="form-group" style="margin-left:5px;">
					<div>
						<label>출발</label> <input type="text" name="dprt_date"
							id="dprt_date" disabled>
					</div>
					<div>
						<label>도착</label> <input type="text" name="arrive_date"
							id="arrive_date" disabled>
					</div>
				</div>
				<div class="form-group" style="margin-left:5px;">
					<br>메모 <br>
					<p>
						<textarea cols="40" rows="10" id="memo" name="memo" disabled style="resize: none;">${planinsertcommand.memo}</textarea>
					</p>
					<div id="memoCheck">필수사항입니다.</div>
				</div>

				<input type="hidden" name="m_id" value="${sessionScope.m_id }">
			</form>
		</div>
		<div id="NaverMap"></div>
		<div id="insertList"></div>
		
	
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
	
</body>
</html>