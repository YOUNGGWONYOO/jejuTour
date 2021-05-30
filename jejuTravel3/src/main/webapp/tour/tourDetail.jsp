<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

   <!---->
<!-- <link rel="stylesheet" href="../css/tourDetail.css"> --> 

    <!-- Custom styles for this theme -->
    <link rel="stylesheet" href="../assets-b/css/main.css">
    <link rel="stylesheet" href="../assets-b/fonts/Simple-Line-Icons">
    <link rel="stylesheet" href="../assets-b/css/simple-line-icons.css">
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=htmm65yl64"></script>
   <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="../assets/js/plugins/bootstrap/css/bootstrap.min.css">
    <!-- CSS Animate -->
    <link rel="stylesheet" href="../assets/css/animate.css">
    <!-- Carousel -->
    <link rel="stylesheet" href="../assets/js/plugins/carousel/owl.carousel.css">
    <!-- Custom styles for this theme -->
    <link rel="stylesheet" href="../assets/css/main.css">
    <!-- Feature detection -->
    <script src="../assets/js/vendor/modernizr-2.6.2.min.js"></script>
<style type="text/css">
   .t_content{
      background:#f1f3f3; 
      width:100%;
      
   }
   .content{
      /* border:solid black; */
      width:1150px; background:#ffffff; 
      margin:auto;
      padding:120px;
   }

    #review_header{
         height:60px;
         background:rgb(255,153,1,0.8)
   }
   #review_btn{
      background:#242830;
      color:white;
   }
   #review_txt{
      font-size:25px;
      font-weight:bold;
      margin-top:-20px;
      margin-left:20px;
   }

   #modal_back{
      background:#fbba84;
   }
   .icon-heart{
      color:red;
   }
   .icon-plus{
      color:white;
   }
   
   #good, #zzim, #goBack{
      background:#242830;
   }
   #naverMap{
      margin-left:5px;
   }
   
   #t_name{
      font-size:30px;
      font-weight:bold;
      color:black;
   }
   #t_addr{
      font-size:20px;
   }
   #t_det{
      font-size:20px;
      color:black;
   
   }
   
   .container{
      background: rgb(178,196,196,0.3);
      padding-top:30px;
      height:410px;
      width:900px;
   }
</style> 
 
<script>
$(function(){
   var m_id = '${m_id}'
   var t_id = '${detailList[0].t_id}'
   var region = '${region}'
   var c_id='${c_id}'
   var x='${detailList[0].x}'
   var y='${detailList[0].y}'
   //alert(m_id);
   //alert(t_id);
   
   //네이버
    $.ajax({
      type: 'post',
      url: 'naver.do',
      data:{'x':x,'y':y},
      error : function(request, status, error){
         alert("통신실패");
         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      },
      success : function(result){
         //alert("통신성공");
         $('#naverMap').empty();
         $('#naverMap').append(result);
      } 
    });
   
   //현재 리뷰 조회
   $.ajax({
      type: 'get',
      url: 'selectReview.do',
      data:{'t_id':t_id,'m_id':m_id,'region':region,'c_id':c_id},
      error : function(request, status, error){
         alert("통신실패");
         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      },
      success : function(result){
         //alert("통신성공");
         $('#content').empty();
         $('#content').append(result);
      } 
    });
   
   //alert('${ck_good}') //좋아요 체크 유무(1:누름, 0:안누름)
    if(${ck_good}){//1일 때만 실행
       var btnGood = document.getElementById('good');
       btnGood.innerText = '좋아요 취소하기';//좋아요를 이미 누른 회원일 경우 좋아요 취소 버튼으로 보임       
    }
   //alert('${ck_zzim}') //찜 체크 유무(1:누름, 0:안누름)
    if(${ck_zzim}){//1일 때만 실행
       var btnZZim = document.getElementById('zzim');
       btnZZim.innerText = '찜 취소하기';//찜하기를 누른 여행지일 경우 찜 취소 버튼으로 보임       
    }
   
   
   $('#review_btn').click(function(){
      if(m_id==""){ 
    	  if(confirm("로그인 먼저 해주세요 로그인 하시겠습니까?")==true )
				location.href='${pageContext.request.contextPath}/member/login.do';
    	  else 
				event.stopImmediatePropagation();//로그인 안되어 있으면 모달창 안띄움
      }
   })
   
   $('#insertReview').click(function(){
      //var review = $('#reviewContent').val()
      //alert(review);
      //tourReview.do로 보내기(${detailList[0].t_id}, 리뷰내용, m_id)-post로!!
      $('form[name=review]').attr({action:'insertReview.do?value='+$(this).val(),method:'post'})
      .append($('<input type="hidden" value="'+m_id+'" name="m_id">')).append($('<input type="hidden" value="'+t_id+'" name="t_id">'))
      .append($('<input type="hidden" value="'+region+'" name="region">')).append($('<input type="hidden" value="'+c_id+'" name="c_id">')).submit();
      //.append($('<input type="hidden" value="'+${sessionScope.m_id}+'" name="m_id">'))//나중에 세션 아이디로 바꾸기
   })   
   
   <%-- var m_id = '<%=(String)session.getAttribute("m_id")%>' --%>
   //좋아요 버튼 클릭시
    $('#good').click(function(){
      //alert(m_id)
      //alert(t_id)//14
      
      if(m_id==""){
    	  if(confirm("로그인 먼저 해주세요 로그인 하시겠습니까?")==true )
			location.href='${pageContext.request.contextPath}/member/login.do';
      }else if(document.getElementById('good').innerText == '좋아요'){
         //여행지 일련번호, 회원아이디 보내기
         $.ajax({
            type: 'post',
            url: 'insertGood.do',
            data:{m_id:m_id, t_id:t_id},
            error : function(request, status, error){
               alert("통신실패");
               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },
            success : function(result){
               //alert("통신성공");
                var btnGood = document.getElementById('good');
               btnGood.innerText = '좋아요 취소하기';
               alert("좋아요 여행지로 등록되었습니다");
               }
         })
      }else{
         $.ajax({
            type: 'post',
            url: 'deleteGood.do',
            data:{m_id:m_id, t_id:t_id},
            error : function(request, status, error){
               alert("통신실패");
               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },
            success : function(result){
               //alert("통신성공");
               var btnGood = document.getElementById('good');
               var txt='<i class="icon-heart"></i>';
               txt+='좋아요';  
               btnGood.innerHTML= txt;
               alert("좋아요가 정상적으로 취소되었습니다");
            } 
         })//ajax end
      }
   }) 
   
   //찜하기 버튼 클릭시
    $('#zzim').click(function(){
       //alert(m_id)
       //alert(t_id)//14
         
      if(m_id==""){
    	  if(confirm("로그인 먼저 해주세요 로그인 하시겠습니까?")==true )
  			location.href='${pageContext.request.contextPath}/member/login.do';
      }else if(document.getElementById('zzim').innerText == '찜 취소하기'){ 
         //찜취소하기버튼을 누른 경우
         $.ajax({
            type: 'post',
            url: 'deleteZZim.do',
            data:{m_id:m_id, t_id:t_id},
            error : function(request, status, error){
               alert("통신실패");
               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },
            success : function(result){
               //alert("통신성공");
               var txt=' <i class="icon-plus"></i>';
               txt+='찜하기';  
               document.getElementById('zzim').innerHTML=txt;
               alert("찜목록에서 정상적으로 삭제되었습니다.");
               } 
            })
         }else{//찜하기버튼을 누른 경우
            $.ajax({
               type: 'post',
               url: 'insertZZim.do',
               data:{m_id:m_id, t_id:t_id},
               error : function(request, status, error){
                  alert("통신실패");
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
               },
               success : function(result){
                  //alert("통신성공");
                  document.getElementById('zzim').innerText = '찜 취소하기';
                  alert("찜목록에 정상적으로 추가되었습니다.");               
               }
            })
           }    
       })    
});

</script>      
</head>
<body>
<div class="t_content">
<div class="content">
<!-- 좋아요/좋아요 취소 -->
<button type="button" class="btn btn-default" id="good"> <i class="icon-heart"></i>좋아요</button>
<!-- 찜하기/ 찜취소하기 -->
<button type="button" class="btn btn-default" id="zzim" > <i class="icon-plus"></i>찜하기</button>

<!-- 나가기 -->
<button type="button" class="btn btn-default pull-right" id="goBack" onclick="location.href='list.do?region=${region}'"> 목록으로 나가기 </button>



<div class="r_container">
<div>
   <%-- 여행지 일련번호: ${detailList[0].t_id}<br><br> --%>
   <div id="t_name">${detailList[0].t_name}</div>

   <div id="t_addr"><i class="icon-pointer"></i> ${detailList[0].t_addr}</div><br><br>
   <div id="t_det"><p>${detailList[0].t_content}</p></div><br><br>
</div>

<!--===========사진======================================= -->
      <div class="inner">
         <div class="container">
            <div class="row">
               <div class="col-lg-12 text-center">
                  <div id="testimonial-wrapper">

                     <c:forEach var="i" begin="1" end="${detailList[0].t_img}">
                        <div class="item">
                           <img src="${pageContext.request.contextPath}/tour_img/${region}/${c_id}/${detailList[0].t_name}_${i}.jpg" 
                           onerror="this.src='${pageContext.request.contextPath}/tour_img/${region}/${c_id}/${detailList[0].t_name}_${i}.JPG'"  
                           style="height: 350px; width: 600px">
                        
                        </div>
                     </c:forEach>
                  </div>
               </div>
            </div>
         </div>
      </div>


<!--===========사진======================================= -->
 
 <!-- naver 맵 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <div id="naverMap"></div>
 
 


    
<hr/>
 <div class="pageheader"  id="review_header">
          <div  id="review_txt"><h1>리뷰</h1></div>
          <div class="breadcrumb-wrapper hidden-xs">
              <span class="label">
                <!-- Button trigger modal -->
                <button  class="btn btn-md" data-toggle="modal" data-target="#formModal" id="review_btn">
                       리뷰 등록하기
                  </button>
            </span>
        </div>
 </div>

    <!-- Form Modal -->
   <div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               
               <h4 class="modal-title" id="myModalLabel">리뷰를 작성해주세요</h4>
            </div>
                <!-- 폼 시작 -->
                <div class="modal-body">
                    <form class="form-horizontal" role="form" name="review">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">내용</label>
                            <div class="col-sm-10">
                                <!-- <input type="text" class="form-control" name="reviewContent" placeholder="Content"> -->
                                <p><textarea cols="50" rows="7"  name="reviewContent" placeholder="Content" style="resize: none;"></textarea></p>
                            </div>
                        </div>
                    </form> 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"data-dismiss="modal" id="btnDismiss" style="margin-top:5px;">취소</button>
                    <button type="button" class="btn btn-primary" id="insertReview">등록</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Form Modal -->

    
    <!-- product ui 리뷰 부분 -->
    <!-- t_id 일때, 시간 순서대로 리뷰 select 하는 페이지 append -->
    <div id="content">
   </div>
   
   </div>
      </div>

   </div><!-- t_content end -->
   

    <!--Global JS-->
    <script src="../assets-b/js/vendor/jquery-1.11.1.min.js"></script>
    <script src="../assets-b/plugins/bootstrap/js/bootstrap.min.js"></script>

    <!-- 새로고침했을때 해더 쪽에 뜨는 슬라이드바?같은거 -->
    <script src="../assets-b/plugins/pace/pace.min.js"></script>
    
        <!--Global JS-->
    <script src="../assets/js/vendor/jquery-1.11.1.min.js"></script>
    <script src="../assets/js/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/js/plugins/nav/jquery.nav.js"></script>
    <script src="../assets/js/plugins/sticky/jquery.sticky.js"></script>

    <script src="../assets/js/plugins/wow/wow.min.js"></script>
    <script src="../assets/js/plugins/parallax/jquery.parallax-1.1.3.js"></script>
    <script src="../assets/js/plugins/carousel/owl.carousel.js"></script>
    <script src="../assets/js/src/app.js"></script>

</body>
</html>