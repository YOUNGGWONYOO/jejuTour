<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- naver -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=htmm65yl64"></script>
<!-- maybe bootstrap -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
        <!--Global JS-->
    <!-- <script src="../assets-b/js/vendor/jquery-1.11.1.min.js"></script> -->
    <script src="../assets-b/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- 새로고침했을때 해더 쪽에 뜨는 슬라이드바?같은거 -->
    <script src="../assets-b/plugins/pace/pace.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="../assets-b/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Custom styles for this theme -->
    <link rel="stylesheet" href="../assets-b/css/main.css">
        
      <!-- datepicker -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
   <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<style>

body{
         width:1200px;
         margin:0 auto;
         margin-bottom:30px;
         background: white;
      }

.content{
      clear:both;
      border:1px solid;
        width:32%; 
        height:50px;
      display: inline-block;
}

ul{list-style:none;}
#NaverMap{
   margin-right:20px;
   float:right;
   margin-top:17px;
}

</style>
<script>
$(function(){
   
   $('#titleCheck').hide()
   $('#dateCheck').hide()
   $('#memoCheck').hide()     
   $('#modalbtn').click(function(e) {
      
         var title = $('#title').val()
         if (title.length < 1) {
            $('#titleCheck').show()
            return false
         } else {
            $('#titleCheck').hide()
         }
         var dprt = $('#dprt_date').val()
         if (dprt.length < 1) {
            $('#dateCheck').show()
            return false
         } else {
            $('#dateCheck').hide()
         }
         var arrive = $('#arrive_date').val()
         if (arrive.length < 1) {
            $('#dateCheck').show()
            return false
         } else {
            $('#dateCheck').hide()
         }

         var memo = $('#memo').val()
         if (memo.length < 1) {
            $('#memoCheck').show()
            return false
         } else {
            $('#memoCheck').hide()
         }
         
         if(dprt > arrive){
            $('#arrive_date').datepicker('setDate',new Date())
            $('#dprt_date').datepicker('setDate',new Date())
            alert('출발 날짜가 도착날짜보다 후입니다. 다시 클릭하세요.');
            return false;
         }
         
         
         $('#form').append($('<input type="hidden" value="'+old_totalday+'" name="oldtotalday">'))
         alert('일정이 수정되었습니다.')
         $('#form').submit();
      })
      
      
   var plan_id = '${plan_id}';
   var selectday = '${selectday}';
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
   //planDetailList.do,pland_id,selectday
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
      } 
   });
      
   //-----------------------------------

   var arrive_date = '${arrive_date }';
   var dprt_date = '${dprt_date }';
      var arrive_y= '20'+arrive_date.substring(0,2);
      var arrive_m= arrive_date.substring(3,5);
      var arrive_d= arrive_date.substring(6);
      
      var arrive_y2= '20'+arrive_date.substring(0,2);
      var arrive_m2= arrive_date.substring(3,5);
      var arrive_d2= arrive_date.substring(6);
      
      var dprt_y= '20'+dprt_date.substring(0,2);
      var dprt_m= dprt_date.substring(3,5);
      var dprt_d= dprt_date.substring(6);
      
      var dprt_y2= '20'+dprt_date.substring(0,2);
      var dprt_m2= dprt_date.substring(3,5);
      var dprt_d2= dprt_date.substring(6);
       //new Date(2021,04,12) 하기위해
       //21-05-12
      var result_arrive_date =arrive_date.replace(/-/gi,'');//  /-/gi 정규식
      var result_dprt_date=dprt_date.replace(/-/gi,'');
       
      //alert(result_arrive_date);//21-05-06
      //alert(result_dprt_date);//21-05-06
      
      var old_arrive_date = parseInt(result_arrive_date);
      var old_dprt_date = parseInt(result_dprt_date);
      var old_totalday = old_arrive_date - old_dprt_date+1;
      
      
      
      
      $('#dprt_date1').datepicker({
         format:'yy-mm-dd',
         language:'kr',
         todayHighlight:true,
         autoclose : true,
         constrainInput: false
         //startDate: '0d'
      }).datepicker('setDate',new Date(dprt_y,dprt_m-1,dprt_d));
      
      $('#arrive_date1').datepicker({
         format:'yy-mm-dd',
         language:'kr',
         todayHighlight:true,
         autoclose : true,
         constrainInput: false
         
      }).datepicker('setDate',new Date(arrive_y,arrive_m-1,arrive_d));

      //--------------modal datepicker
      $('#dprt_date').datepicker({
         format:'yy-mm-dd',
         language:'kr',
         todayHighlight:true,
         autoclose : true,
         startDate: 'datePickerDate'
      }).datepicker('setDate',new Date(dprt_y2,dprt_m2-1,dprt_d2))
      .on('changeDate',function(e){
         if($('#dprt_date').val() > $('#arrive_date').val()){
            alert('도착날짜보다 후입니다. 다시클릭해주세요.');
            $('#dprt_date').datepicker('setDate',new Date($('#arrive_date').val()));
         }
      });
      
      $('#arrive_date').datepicker({
         format:'yy-mm-dd',
         language:'kr',
         todayHighlight:true,
         autoclose : true,
         startDate: 'datePickerDate'
      }).datepicker('setDate',new Date(arrive_y2,arrive_m2-1,arrive_d2))
      .on('changeDate',function(){
         if($('#dprt_date').val() > $('#arrive_date').val()){
            alert('출발날짜보다 전입니다. 다시클릭해주세요.');
            $('#arrive_date').datepicker('setDate',new Date($('#dprt_date').val()));
         }
      });
})

</script>
</head>

<body>

<div id="NaverMap"> </div>
<div class="wrapper">
      <div class="form_wrapper" >
         <form class="form-horizontal" role="form1" id="form1" method="post">
            <div class="form-group" >
               <label>일정제목</label> <br> <input type="text" name="title1" id="title1" disabled value="${plancommand.title}">
            </div>
            <div class="form-group">
               <div>
                  <label>출발</label> <input type="text" name="dprt_date1"
                     id="dprt_date1" disabled>
               </div>
               <div>
                  <label>도착</label> <input type="text" name="arrive_date1"
                     id="arrive_date1" disabled>
               </div>
            </div>
            <div class="form-group">
               <br><label>메모</label> <br>
               <p>
                  <textarea cols="40" rows="10" id="memo1" name="memo1" style="resize: none;" disabled>${plancommand.memo}</textarea>
               </p>
            </div>
         </form>
         <!-- <button type="button" class="btn btn-primary" id="btn"  data-target="#formModal" >수정</button> -->
         
          <div class="breadcrumb-wrapper hidden-xs">
              <span class="label">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary"  id="btn" data-toggle="modal" data-target="#formModal" >
                       수정
                  </button>
                  <button type="button" class="btn btn-primary"  id="exitbtn" onclick="location.href='planList.do?m_id=${sessionScope.m_id}'">
                       나가기
                  </button>
            </span>
        </div>
      </div>
      
   </div>
   

   
   <!-- Form Modal -->
    <div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" id="modal_back">
            <div class="modal-content" style="margin-left:15px;">
                <div class="modal-header">
                    <!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> x표시로 모달창 끄기 -->
                    <h4 class="modal-title" id="myModalLabel">일정을 등록해주세요. </h4>
                </div>
                <div class="modal-body" style="margin-left:15px;">
                        <form class="form-horizontal" role="form" id="form" action="updatePlan.do" method="post">
                          <div class="form-group">
                             일정제목 <br>
                             <input type="text" name="title" id="title"  value="${plancommand.title}" >
                        <div id="titleCheck">필수사항입니다.</div> 
                     </div>
                     <div class="form-group">
                        <div><label>출발</label> <input type="text" name="dprt_date" id="dprt_date"></div>
                        <div><label>도착</label> <input type="text" name="arrive_date" id="arrive_date"></div>
                        <div id="dateCheck">필수사항입니다.</div>
                     </div>   
                     <div class="form-group">
                           <br>메모 <br>
                        <p>
                           <textarea cols="40" rows="10" id="memo" name="memo" style="resize: none;">${plancommand.memo}</textarea>
                        </p>
                        <div id="memoCheck">필수사항입니다.</div>
                     </div>
                     
                     <input type="hidden" name="m_id" value="test">
                     <input type="hidden" name="plan_id" value="${plan_id }">
                     <button type="button" class="btn btn-default" data-dismiss="modal" id="btnDismiss">취소</button>
                           <button type="button" class="btn btn-primary" id="modalbtn">등록</button>
                          </form>
                </div>
              
            </div>
        </div>
    </div>
    <!-- End Form Modal -->   
   
   <div id="planDetailList"></div>

   <!-- datepicker -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>





</body>
</html>