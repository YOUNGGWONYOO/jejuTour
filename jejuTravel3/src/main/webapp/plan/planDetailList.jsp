<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Draggable - Default functionality</title>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <style>

/* ------------------------------ */
.left{
			width:120px;
			float:left;
		}
		.left table{
			background:#E0ECFF;
		}
		.left td{
			background:#eee;
			
		}
		
		.right{
			float:left;
			width:1080px;
		}
		.right table{
			border:1px solid;
			/* background:#d3d3d3; */
			width:100%;
		}
		#right_table{
			height:530px;
			
		}
		.right td{
			background:#ffffff;
			text-align:center;
			padding:2px;
			border:1px solid;
		}

		.right td.drop{
			background:#fafafa;
			width:70%;
		}
		.right td.over{
			background:#FBEC88;
		}
		.item{
			text-align:center;
			border:1px solid #499B33;
			background:#fafafa;
			width:100px;
		}
		.assigned{
			border:1px solid #BC2A4D;
		}
		.title{
			font-size:20px;
		}
		.time{
			color:#808080;
		}
.right_table_time{
	background:#222222;
}
.wrapper{
float:left;
	border:3px solid rgb(255,152,3,0.7);
width:400px;
height:510px;
margin:20px;
padding:30px;
margin-left:100px; 
top:50px;

}
</style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    
  <script type="text/javascript">
  $( function() {//Ajax 6번
	    
	    var totalDay = ${totalDay};
	    var selectDay = ${selectDay};
	   	var plan_id = ${plan_id};
	   // alert('${selectDayPlan}');
	    var selectDayPlan=JSON.parse('${selectDayPlan}');
	  // alert(selectDayPlan)
	   // alert(selectDayPlan[0].day_id);
	    
	    insertTable(totalDay,15,selectDay,selectDayPlan);//day,time은 고정
	    
	    $('#day').change(function(){
	    	var selectday = $(this).val();
	    	//alert('마지막 selectday'+selectday);
	    	$.ajax({
	    		type: 'POST',
	    		url: 'planDetailList.do',
	    		traditional : true,
	    		data:{'selectday':selectday,'plan_id':plan_id},
	    		error : function(request, status, error){
	    			alert("통신실패");
	    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		},
	    		success : function(result){
	    			//alert("통신성공");
	    		 	$('#planDetailList').empty();
	    			$('#planDetailList').append(result);
	    			
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
	    			
	    		} 
	    	});
	    })
	/*   $( ".right_table_time" ).sortable().disableSelection();
	    $('.right_table_time').sortable({
			  connectWith:".right_table_time"  
		})  임시*/
	    
	    //select 의 값에 따라 ajax로 페이지 변경
	    //$()
  });//function({}) end	//객체 -> 1일째의 일정들(여행지이름,시간 ,)
 function insertTable(totalDay,time,selectday,selectDayPlan){	//여기에서 selectday = day_id(몇일쨰인지) 에따라 나와줘야함.
	  									//select day를 가져오면 
	  	//var time_count=8;
	  	//if(selectday = 3(변수로받아))
		insertDay(totalDay,selectday);//1은 selectday	
		
		
		for(var t=0;t<selectDayPlan.length;t++){
			$('#right_table td.drop').eq(selectDayPlan[t].seq-1).append(selectDayPlan[t].t_name)

		}
	}

			function insertDay(day, selectday) {//타이틀과  select
				var output = '';
				output += '<tr><td class="blank"></td><td class="title">Day'
						+ selectday + '     <select id="day">';
				for (var i = 1; i <= day; i++) {//day= 3
					if(i==selectday){
						output+='<option value="'+i+'" selected>Day' + i + '</option>';
					}else{
						output+='<option value="'+i+'">Day' + i + '</option>';
					}
				}
				output += '</select></td></tr>';
				$('#right_table').prepend(output);
			}
			
		</script>
</head>
<body>
	<div id="container" style="position: relative;margin-top:20px;margin-left:100px;clear:both;">
	
			<div class="right">
				<table id="right_table">
					<tr class="right_table_time">
						<td class="time">08:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">09:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">10:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">11:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">12:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">13:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">14:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">15:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">16:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">17:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">18:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">19:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">20:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">21:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">22:00</td>
						<td class="drop"></td>
					</tr>
					<tr class="right_table_time">
						<td class="time">23:00</td>
						<td class="drop"></td>
					</tr>
				</table>
			</div>
		</div>
		
		
</body>
</html>