<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
  <!-- <link rel="stylesheet" href="css/style.css"> -->


   <script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
    <script src="../assets-b/js/vendor/jquery-1.11.1.min.js"></script> 
    <script src="../assets-b/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets-b/plugins/pace/pace.min.js"></script>
    <link rel="stylesheet" href="../assets-b/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets-b/css/main.css"> 
    
    
    
    <!-- datepicker -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">


<style>
/* body{
         width:1000px;
         margin:0 auto;
         border:1px solid;
         padding:15px;
      } */
#wrapper{
   
   clear:both;
   padding:15px;
   width:80%;
   border:4px solid;
}
.content,#first_plan{
      border-radius:15px;
      border:1px solid;
        width:28%; 
        height:150px;
      display: inline-block;
      margin: 15px;
}
.content{
   text-align:center;
   vertical-align: middle;
   
}
.content_header{
   width:100%;
   heigth: 50px;
   text-align:right;
}
/* .datepicker{
   margin-left: 260px;
   margin-top: 5px;
} */
</style>
<script>
$(function(){
   
   $('#titleCheck').hide()
   $('#dateCheck').hide()
   $('#memoCheck').hide()         
   $('#btn').click(function(e) {
      
         var title = $('#title').val()
         if (title.length < 1) {
            $('#titleCheck').show()
            return false
         } else {
            $('#titleCheck').hide()
         }
         
         var dprt = $('#dprt_date').val()
         if (dprt.length <1){
            $('#dateCheck').show()
            return false
         } else {
            $('#dateCheck').hide()
            
         }
         
         var arrive = $('#arrive_date').val()
         if (arrive.length <1){
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
         

         if($('#dprt_date').val() > $('#arrive_date').val()){
            alert('?????? ????????? ?????????????????? ????????????. ?????? ???????????????.');
            return false;
         }
         
         alert('????????? ?????????????????????.')
         $('#form').submit();
      })
      
//-------------??????????????? ???
      
      $('#dprt_date').datepicker({
         format:'yy-mm-dd',
         language:'kr',
         todayHighlight:true,
         autoclose : true,
         startDate: 'datePickerDate'
      }).datepicker('setDate',new Date(new Date()))
      .on('changeDate',function(selectedDate){
         if($('#dprt_date').val() > $('#arrive_date').val()){
            alert('??????????????? ???????????????. ????????????????????????.');
            $('#dprt_date').datepicker('setDate',new Date($('#arrive_date').val()));
         }
      });      
      
      $('#arrive_date').datepicker({
         format:'yy-mm-dd',
         language:'kr',
         todayHighlight:true,
         autoclose : true,
         startDate: 'datePickerDate'
      }).datepicker('setDate',new Date(new Date()))
      .on('changeDate',function(selectedDate){
         if($('#dprt_date').val() > $('#arrive_date').val()){
            alert('?????????????????? ????????????. ????????????????????????.')
         }
      });
      
//--------------------datepicker ???
   })
</script>
</head>

<body>   
<jsp:include page="../form/header.jsp" flush="true" /> <br><br><br><br><br><br><br>

   <div class="container">
    <div class="pageheader"  id="first_plan">
          <div><h1>??? ???????????????</h1></div>
          <div class="breadcrumb-wrapper hidden-xs">
              <span class="label" >
                <!-- Button trigger modal -->
                <button id="modalButton" class="btn btn-primary"data-toggle="modal" data-target="#formModal" style="border-radius:10px;">
                       +
                  </button>
            </span>
        </div>
    </div>
   
   
   
   <%-- <a href="planInsert.do?member_id=${member_id}">?????????????????????</a> --%>
      
   <!-- Form Modal -->
    <div class="modal fade" id="formModal" tabindex="-1" role="dialog" 
       aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" 
       data-keyboard="false">
        <div class="modal-dialog" id="modal_back">
            <div class="modal-content">
                <div class="modal-header">
                    <!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> x????????? ????????? ?????? -->
                    <h4 class="modal-title" id="myModalLabel4">????????? ??????????????????. </h4>
                </div>
                <div class="modal-body" style="margin-left:15px;">
                        <form class="form-horizontal" role="form" id="form" action="planInsert.do" method="post">
                          <div class="form-group">
                             <label>????????????</label> <br>
                             <input type="text" name="title" id="title">
                        <div id="titleCheck">?????????????????????.</div> 
                     </div>
                     <div class="form-group">
                        <div><label>??????</label> <input type="text" name="dprt_date" id="dprt_date"></div>
                        <div><label>??????</label> <input type="text" name="arrive_date" id="arrive_date"></div>
                        <div id="dateCheck">?????????????????????.</div>
                     </div>   
                     <div class="form-group">
                           <br><label>??????</label> <br>
                        <p>
                           <textarea cols="40" rows="10" id="memo" name="memo" style="resize: none;"></textarea>
                        </p>
                        <div id="memoCheck">?????????????????????.</div>
                     </div>
                     
                     <input type="hidden" name="m_id" value="${member_id }">
                     <button type="button" class="btn btn-default" data-dismiss="modal" id="btnDismiss">??????</button>
                           <button type="button" class="btn btn-primary" id="btn">??????</button>
                          </form>
                </div>
              
            </div>
        </div>
    </div>
    
    <!-- End Form Modal -->   
      
      
   <div>
      <c:forEach var="planList" items="${list }">
         <div class="content">
            <div class="content_header">
               <button type="button" class="btn btn-primary" onClick="location.href='planDelete.do?plan_id='+'${planList.id}'+'&member_id='+'${member_id }';" style="border-radius:10px "> X </button>
            </div>
            <a href="planDetail.do?plan_id=${planList.id} " style="font-size:17pt;">${planList.title}</a><br><br>
            ${planList.memo}<br>
            ${planList.dprt_date } ~ ${planList.arrive_date}
         </div>
      </c:forEach>
   </div>
</div>
   <br><br><br><br><br><br><br><br><br><br><br><br>
      
   <jsp:include page="../form/footer.jsp" flush="true" />
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
   

</body>
</html>