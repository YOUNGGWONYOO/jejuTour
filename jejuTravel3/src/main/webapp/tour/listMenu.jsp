<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="../assets-b/plugins/bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="../css/listMenu.css">
<script>
$(function(){
        $.ajax({
         url:'https://api.openweathermap.org/data/2.5/onecall?lat=33.495155&lon=126.537470&units=metric&lang=kr&exclude=current,minutely,hourly,alert&appid=09c5db92d02778bbd4146cff892b7cf8',
         //당일날부터 앞으로 7일치 예상 날씨 
         dataType:'json',
         type:'GET',
         success: function(data){               
            var weatherList = new Array();

            for(var i=0;i<=6;i++){
                var weather= new Object();
                weather.temp = Math.floor(data.daily[i].temp.day)+' ºC';//날씨
                weather.icon = (data.daily[i].weather[0].icon).substr(0,2);//아이콘
                weather.des = data.daily[i].weather[0].main
                weatherList.push(weather);
             }
             var jsonWeather = JSON.stringify(weatherList);
             //alert(jsonWeather); 
             
             $.ajax({
                type: 'POST',
                url: 'weather.do',
                traditional : true,
                data:{'jsonWeather':jsonWeather},
                error : function(request, status, error){
                     alert("통신실패");
                     alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                  },
                success : function(result){
                     //alert("통신성공1");
                     $('#weather').append(result);
                  }
             })
         }
      }) //날씨 ajax end   

      var region='${region}';
      var c_subid='${c_subid}';
      var c_tourid='${c_tourid}';
      var pageNum='${currentPage}';
      
      //초기에 띄울 여행지
      if(c_tourid==5){
         $.ajax({
            type: 'get',
            url: 'popListContent.do',
            data:{region:region,pageNum:pageNum},
            error : function(request, status, error){
               alert("통신실패");
               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },
            success : function(result){
               //alert("통신성공1");
               $('#content').empty();
               $('#content').append(result);
            } 
          });      
      }else{
         $.ajax({
            type: 'get',
            url: 'listContent.do',
            data:{region:region,pageNum:pageNum,c_tourid:c_tourid,c_subid:c_subid},
            error : function(request, status, error){
               alert("통신실패");
               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },
            success : function(result){
               //alert("통신성공1");
               $('#content').empty();
               $('#content').append(result);
            } 
          });
         
         //초기 메뉴 선택
         $('#region li a').removeClass('selected')
         $('#region li a[href='+region+']').addClass('selected')

         var s_id=$('#c_tourid li a[target='+c_tourid+']').attr('href')//#c_tourid1
         $(s_id+' li a').removeClass('selected')
         $(s_id+' li a[target='+c_subid+']').addClass('selected')
     
      }
      
      $('#c_tourid li a').removeClass('selected')
      $('#c_tourid li a[target='+c_tourid+']').addClass('selected')
      /* 지역이름, 지역별 사진  */
      $('#regionName > h2').append($('#region li a[class=selected]').text())
      $.ajax({
            type: 'get',
            url: 'regionImg.do',
            data:{region:region},
            error : function(request, status, error){
               alert("통신실패");
               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },
            success : function(result){
               //alert("통신성공1");
               $('#regionImg').append(result);
            } 
      });
      
      
      //지역 클릭
      $('#region li a').click(function(){
         $('#region li a').removeClass('selected')
         $(this).addClass('selected')
         region=$(this).attr('href')//지역번호(전역변수 값 변경)
         c_tourid=1
         c_subid=1
         event.preventDefault()
         $('#c_tourid li a').removeClass('selected')
         $('#c_tourid li a[href="#c_tourid1"]').addClass('selected')
         $('#c_subid div').hide()
         $('#c_tourid1').show()
         $('#c_tourid1 li a').removeClass('selected')
         $('#c_tourid1 li a[href="#c_subid1"]').addClass('selected')
         
         //alert($(this).text())//지역 이름
         $('#regionName > h2').empty()
         $('#regionName > h2').append($(this).text())   
         
       $.ajax({
           type: 'get',
           url: 'regionImg.do',
           data:{region:region},
           error : function(request, status, error){
              alert("통신실패");
              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           },
           success : function(result){
              //alert("통신성공1");
              $('#regionImg').empty();
              $('#regionImg').append(result);
           } 
      });
      
      
      })
      
      //카테고리 클릭
      $('#c_subid div:not('+$('#c_tourid li a.selected').attr('href')+')').hide();

        $('#c_tourid li a').click(function(){
           //alert('click')
         $('#c_tourid li a').removeClass('selected')//모든 a태그에 대해서 selelcted클래스 선택자 해제
         $(this).addClass('selected')//클릭한 태그에 대해 클래스 선택자 추가
         $('#c_subid div').hide()//전의 내용 감추기
         //alert($(this).attr('href'));// #c_tourid1
         $($(this).attr('href')).show();
         $('#c_subid li a').removeClass('selected')
         $('#c_subid li a[target=1]').addClass('selected')
         
         
         region=$('#region li a[class=selected]').attr('href')
         c_tourid=$(this).attr('target')
         c_subid=1
         //alert(c_tourid)
         //alert(region)
         event.preventDefault()      
      })
      
      //서브 카테고리 클릭
       $('#c_subid li a').click(function(){
         //alert('sub - click');
          $('#c_subid li a').removeClass('selected')
         $(this).addClass('selected')
         region=$('#region li a[class=selected]').attr('href')
         c_tourid=$('#c_tourid li a[class=selected]').attr('target')
         c_subid=$(this).attr('target')
         //alert(c_subid)
         //alert(c_tourid)
         //alert(region)
         event.preventDefault() 
      }) 
      
/*        function vali(param){    
              if (param === undefined) return true; 
              return false;
          } */
        
          //메뉴 클릭했을때 ajax
        $('#region li a, #c_tourid li a, #c_subid li a').click(function(){
           //if(vali(region)) region=1
           //if(vali(c_tourid)) c_tourid=1
           //if(vali(c_subid)) c_subid=1
           
           //console.log(region)
           //console.log(c_tourid)
           //console.log(c_subid)
           
           if(c_tourid==5){
              $.ajax({
                 type: 'get',
                 url: 'popListContent.do',
                 data:{region:region},
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
           }
           else{
              $.ajax({
                 type: 'get',
                 url: 'listContent.do',
                 data:{region:region,c_tourid:c_tourid,c_subid:c_subid},
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
           }
        })   
})
</script>
</head> 
<body>
<%@ include file="../form/header.jsp"%><br>
   <!--=== Content-menu ===-->
   <div class="content" >
   <div class="container">
      <div id="region">
         <ul>
            <li><a href="1" class="selected">제주시 서부</a></li>
            <li><a href="2">제주 시내</a></li>
            <li><a href="3">제주시 동부</a></li>
            <li><a href="5">서귀포시 동부</a></li>
            <li><a href="7">서귀포 시내</a></li>
            <li><a href="8">서귀포시 서부</a></li>
            <li><a href="4">우도</a></li>
            <li><a href="6">한라산</a></li>
         </ul>
      </div>


      <div id="regionName">
         <h2></h2>
      </div>


      <div>
         <div class="col-sm-6 md-margin-bottom-40" id="regionImg" style="margin-top: 20px; margin-bottom: 20px;">
            <!-- 지역 사진 -->
         </div>
         
         <div class="col-sm-6 md-margin-bottom-40" id="weather" style="margin-top: 20px; margin-bottom: 20px;">
            <!-- 날씨 -->
         </div>
      </div>

   </div>

<hr>
   <div class="container" >
   <div id="category">
      <div  id="c_tourid" >
         <ul>
         <!-- #키워드명을 찾아갈 수 있도록 설계 -->
            <li><a href="#c_tourid1" target="1" class="selected">숙박</a></li>
            <li><a href="#c_tourid2" target="2">관광지</a></li>
            <li><a href="#c_tourid3" target="3">음식점</a></li>
            <li><a href="#c_tourid4" target="4">카페</a></li>
            <li><a href="#c_tourid5" target="5">인기여행지10</a></li>
         </ul>
      </div>   
      
      <!-- 선택된 탭에 따라서 내용이 나오는 부분 -->
      <div id="c_subid"  >
         <div id="c_tourid1">
            <ul >
               <li><a href="#c_subid1" target="1" class="selected">호텔</a></li>
               <li><a href="#c_subid2" target="2">호스텔</a></li>
               <li><a href="#c_subid3" target="3">콘도</a></li>
            </ul>
         </div>
         
         <div id="c_tourid2">
            <ul>
               <li><a href="#c_subid1" target="1" class="selected">자연/공원</a></li>
               <li><a href="#c_subid2" target="2" >문화체험</a></li>
               <li><a href="#c_subid3" target="3" >레져스포츠</a></li>
            </ul>
         </div>
         <div id="c_tourid3">
            <ul>
               <li><a href="#c_subid1" target="1" class="selected">한식</a></li>
               <li><a href="#c_subid2" target="2">양식/중식</a></li>
               <li><a href="#c_subid3" target="3">해산물,회</a></li>   
               <li><a href="#c_subid4" target="4">분식</a></li>   
            </ul>
         </div>
         <div id="c_tourid4">
            <ul>
            </ul>
         </div>
         <div id="c_tourid5">
            <ul>
            </ul>
         </div>
         
      </div>   
   </div>
   </div>

<!---------------------------------------------------------------------------------->
   <div id="content"> </div> 
            



   <br><br>
   </div>
<%@ include file="../form/footer.jsp"%>
</body>
</html>