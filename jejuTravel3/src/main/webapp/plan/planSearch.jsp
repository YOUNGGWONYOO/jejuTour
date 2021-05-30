<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
   
</style>
<script>
$(function(){
   var zzim = JSON.parse('${zzim}');
   //alert(zzim)//[object Object],[object Object],[object Object],[object Object]
   for(var z=0;z<Object.keys(zzim).length;z++){
      console.log(zzim[z])
      var out='';
      out+='<li class="item zzimlist" ondragstart="dragStart(event);" draggable="true" ondragend="dragEnd(event)" value="'+zzim[z].t_id+'">'+'<img class="insertImg2" id="img" src="../tour_img/'+zzim[z].region+'/'+zzim[z].c_id+'/'+zzim[z].t_name+'_1.jpg" onerror="this.src=\'../tour_img/'+zzim[z].region+'/'+zzim[z].c_id+'/'+zzim[z].t_name+'_1.JPG\'"><br>'+zzim[z].t_name+'</li>'
      $('#draggable3').append(out);
   }
})
</script>
<body>
   <ul id="draggable3">
      
   </ul>
</body>
</html>