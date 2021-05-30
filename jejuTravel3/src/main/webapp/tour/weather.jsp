<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link rel="stylesheet" href="../assets-b/plugins/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>

#tot{
   height: 350px; 
   background:#337ab7;
   color:white;
   font-size:large;
   padding:30px;
   border-radius:3px;
}

.CurrentIcon{
    margin-left:30px;
}
.pull-right{
   margin-top:15px;
   text-align:right;

}
 #days{
    clear:both;
    height: 150px; 
    margin-bottom:20px;
    width: 520px;
   background:white;
   border: solid 5px #337ab7;
   margin-left: -20px;
   color:#337ab7;
}

#icon1, #icon2, #icon3, #icon4, #icon5, #icon6{
   position:absolute; 
   left:23%; 
   margin-top:20px;
}

.tem{
   margin-top:100px;
   margin-left:13px;
   color:#71767b;
   font-size:16px; 
   font-weight: bold;
}

</style>
  <script>
   $(document).ready(function() {
           /* 
              https://uxgjs.tistory.com/186
              아이콘 사이즈 조절 : fa-3x 
           */
        let weatherIcon ={
                 '1' : 'fas fa-sun  fa-pulse', 
                 '2' : 'fas fa-cloud-sun', 
                 '3' : 'fas fa-cloud', 
                 '4' : 'fas fa-cloud-meatball ', 
                 '9' : 'fas fa-cloud-sun-rain',  
                 '10' : 'fas fa-cloud-showers-heavy ', 
                 '11' : 'fas fa-poo-storm', 
                 '13' : 'fas fa-snowflake fa-pulse ', 
                 '50' : 'fas fa-smog'    
              };
         //alert(${jsonWeather[0].icon})


           var $icon = ${jsonWeather[0].icon};
           $('.CurrentIcon').append('<i class="'+weatherIcon[$icon] + ' fa-7x "></i>')
           
           var $icon1 =${jsonWeather[1].icon};
           $('#icon1').append('<i class="'+weatherIcon[$icon1] + ' fa-3x"></i>')
           
           var $icon2 =${jsonWeather[2].icon};
           $('#icon2').append('<i class="'+weatherIcon[$icon2] + ' fa-3x"></i>')
      
           var $icon3 =${jsonWeather[3].icon};
           $('#icon3').append('<i class="'+weatherIcon[$icon3] + ' fa-3x"></i>')
      
           var $icon4 =${jsonWeather[4].icon};
           $('#icon4').append('<i class="'+weatherIcon[$icon4] + ' fa-3x"></i>')
           
           var $icon5 =${jsonWeather[5].icon};
           $('#icon5').append('<i class="'+weatherIcon[$icon5] + ' fa-3x"></i>')
   
           var $icon6 =${jsonWeather[6].icon};
           $('#icon6').append('<i class="'+weatherIcon[$icon6] + ' fa-3x"></i>')   

    });
    
    </script>
    </head>
<body>   

<div id="tot">
<div>
   <div class="col-sm-6" style=" margin-bottom:25px;">
      <div class="CurrentIcon">
      <!-- 아이콘 -->
      </div>  
   </div>
   
   <div  class="col-sm-6  pull-right">
      <div class="CurrentTemp" style=" font-size:35px;">
         ${jsonWeather[0].temp}
      </div>                     
      <div class="CurrentDes" style=" font-size:25px;">
         ${jsonWeather[0].des}
      </div>
      <small style="font-style:italic; font-size:15px; font-weight: lighter;">Jeju</small>
   </div>
</div>


<div  id="days">
   <div class="col-sm-2">
      <div id="icon1">
      <!-- 아이콘 -->
      </div>
      <div class="tem">
      ${jsonWeather[1].temp}
      </div>  
   </div>
   
   <div class="col-sm-2">
      <div id="icon2">
      <!-- 아이콘 -->
      </div>  
      <div class="tem">
      ${jsonWeather[2].temp}
      </div>
   </div>
   
   <div class="col-sm-2">
      <div id="icon3">
      <!-- 아이콘 -->
      </div>
      <div class="tem">
      ${jsonWeather[3].temp}
      </div>  
   </div>
   
   <div class="col-sm-2">
      <div id="icon4">
      <!-- 아이콘 -->
      </div>  
      <div class="tem">
      ${jsonWeather[4].temp}
      </div>  
   </div>
   
   <div class="col-sm-2">
      <div id="icon5">
      <!-- 아이콘 -->
      </div> 
      <div class="tem">
      ${jsonWeather[5].temp}
      </div>   
   </div>
   
   <div class="col-sm-2">
      <div id="icon6">
      <!-- 아이콘 -->
      </div> 
      <div class="tem">
      ${jsonWeather[6].temp}
      </div>   
   </div>
   
</div>
</div>

</body>

</html>