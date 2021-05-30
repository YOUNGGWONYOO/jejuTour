<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Draggable - Default functionality</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>Insert title here</title>
<style>

.left{
         height:600px;
         width:38%;
         float:left;
         border:1px solid black;
         margin-top: 12px;
         
}
ul{list-style:none;
}

#draggable li,#draggable2 li{
   height:100px;
   width:100%;
   
}
#draggable{
         height:100%;
         width:50%;
         float:left;
         border:1px solid black;
         padding:0px;
         overflow:hidden;
         text-overflow:ellipsis;
}
#draggable5{
   overflow:auto;
    width:100%;
   height:500px;
}
#draggable2{
         height:100%;
         width:50%;
         float:left;
         border:1px solid black;
         padding:0px;
         
}
#draggable2 #abc{
   border:1px solid;
   
}
.right {
   float: right;
   width: 600px;
   margin:10px;
  
}

.right table {
   width: 100%;
   border:1px solid;
}

#right_table tr td.drop {
   background-color: white;
   border:1px solid;
} 

#right_table td{
   border:1px solid;
   text-align:center;
}
#right_table tr td.over {
   background-color: white;
} 

.item {
   text-align: center;
   border: 1px solid black;
   background: #fafafa;
   width: 100%;
   height:100%;
   list-style:none;
   font-size: 12px;
   font-weight: bold;
   padding-top: 5px;
   
}
#right_table .item{
   border:1px solid;
   text-align:center;
    
}
 .assigned {
   border: 1px solid;
   width:550px;
   list-style:none;
}

.time {
   color: #808080;
   border: 1px solid black;
}
.drop{
   color: #808080;
   width:100%;
   height:35px;
   border:1px solid #d3d3d3;
   background-color: rgb(85,107,141,0.3);
}
.title{
   text-align: center;
   color: black;
}
#savebtn,#cancelbtn{
   width: 60px;
   border:1px solid;

   
}
.btn{
   clear:both;
      display:block;
      background: rgb(255,153,1);
}

.zzim-header{
   text-align: center;
   padding-top: 15px;
   background-color: #FFA500;
   font-weight: bolder;
   color: white;
   width:100%;
   font-size:14pt;
}
.search{
   color:black;
   padding-left: 10px;
   padding-top: 25px;
}
#draggable3{
   
   margin:0px;
   padding:0px;
   
}
#draggable4{

   width:100%;
   height:390px;
   overflow:auto;
}
.total, .total2{
   width:100%;
   height:100%;
   
   margin:0px;
   padding:0px;
}
.insertImg{
   
   width:75%;
   height:70px;
   pointer-events:none;
}
.insertImg2{
   width:75%;
   height:70px;
   pointer-events:none;
}

</style>
  <script>
     var isRevert=true;
     $(function() { 
      //-----------------------찜하기
      var zzim = JSON.parse('${zzim}');
      //alert(zzim)//[object Object],[object Object],[object Object],[object Object]
      for(var z=0;z<Object.keys(zzim).length;z++){
         console.log(zzim[z])
         var out='';
         out+='<li class="item zzimlist" ondragstart="dragStart(event);" draggable="true" ondragend="dragEnd(event)" value="'+zzim[z].t_id+'">'+'<img class="insertImg" id="img" src="../tour_img/'+zzim[z].region+'/'+zzim[z].c_id+'/'+zzim[z].t_name+'_1.jpg" onerror="this.src=\'../tour_img/'+zzim[z].region+'/'+zzim[z].c_id+'/'+zzim[z].t_name+'_1.JPG\'"><br>'+zzim[z].t_name+'</li>'
         $('#draggable5').append(out);
         //<img class="img-responsive" id="img" src="../tour_img/${c.region}/${c.c_id}/${c.t_name}_1.jpg" 
            //onerror="this.src='../tour_img/${c.region}/${c.c_id}/${c.t_name}_1.JPG'">
      }
      
      //----------------------------전체다.
      
      
      
      //----------------------------------
      
      //----------------------- drag& drop
      allowDrop = function() {
         event.preventDefault();
      };
 
      dragStart = function() {
         var _thisEle = event.target;
         _thisEle.classList.add('is-dragging');
         _thisEle.id='ing';
         
         event.dataTransfer.setData('text',_thisEle.id);//li태그
         
      };

      dragEnd = function() {
         var _thisEle = event.target;
         _thisEle.classList.remove('is-dragging');
      };
      
      drop = function(event) {
         var _targetEle = event.target;
         if(_targetEle.classList=='item zzimlist'){
            alert('같은 시간대에 두개의 일정은 안됩니다.');
         }else{
            event.preventDefault();
            var data=event.dataTransfer.getData('text');//data=Elelment
            _targetEle.appendChild(document.getElementById(data))
            _targetEle.classList.add('over');
            document.getElementById(data).removeAttribute('id');
            if(_targetEle.firstChild.childElementCount==2){
               _targetEle.firstChild.innerHTML+='<button type="button" class="removeButton" name="removebtn"> X </button>';
               _targetEle.firstChild.removeChild(_targetEle.firstChild.childNodes[0]);
               _targetEle.firstChild.removeChild(_targetEle.firstChild.childNodes[0]);
            }
         
            

            /* _targetEle.classList.deta */
            //insertImg
         }
      };
      dragLeave=function(event){
         var _targetEle = event.target;
         //_targetEle.innerHTML='';
         _targetEle.classList.remove('over');
      }
      
      
            //-------날짜
            var totalDay = '${totalday}';//1
            var selectDay = '${selectday}';
            var plan_id = '${plan_id}';
            var m_id = '${m_id}';
            var selectDayPlan=JSON.parse('${selectDayPlan}');
            //alert('selectDayPlan->'+selectDayPlan)
            
            //-------------------plansavebtn() 전체 저장 버튼
            $('#savebtn').click(function(){
               if(confirm('현재 페이지가 저장이 되고 나가집니다. 나가시겠습니까?')==true){
                  
                  var sendArr = new Array();
                  var oldselectday=selectDay;
                  //여기서 저장.
                  for(var k=0;k<16;k++){
                     if($('#right_table td.preDrop').eq(k).find('li').length > 0){   
                        var sendObject= new Object();
                        sendObject.t_id=$('#right_table td.preDrop').eq(k).find('li').attr('value');//t_id
                        sendObject.seq=k+1;               
                        sendArr.push(sendObject);//배열에 객체 넣기
                     }
                  }
                  //alert(sendArr)
                  $.ajax({
                     type: 'POST',
                     url: 'planSave.do',
                     traditional : true,
                     data:{'oldselectday':oldselectday,'plan_id':plan_id,'m_id':m_id,'sendArr':JSON.stringify(sendArr)},
                     error : function(request, status, error){
                        alert("통신실패");
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                     },
                     success : function(result){
                           //alert("통신성공");
                           location.href='planList.do?m_id='+m_id;
                        //페이지이동
                        //location.href='planList.do?m_id='m_id
                     }
                  
                  });
               }
            })   
            
            //-------------------------------취소 버튼
            $('#cancelbtn').click(function(){
               if(confirm('수정된 데이터가 저장되지 않고 나가집니다. 나가시겠습니까?')==true){
                  location.href='planList.do?m_id='+m_id;
               }
            })
            //-------------------------------
            
            insertTable(totalDay, 15, selectDay,selectDayPlan);
            
            $('#day').change(function(){
               if(confirm('현재 페이지를 먼저 저장하셔야 합니다. 저장하시겠습니까?')==true){
                  
                  var sendArr = new Array();
                  var oldselectday=selectDay;
                  //여기서 저장.
                  for(var k=0;k<16;k++){
                     if($('#right_table td.preDrop').eq(k).find('li').length > 0){   
                        var sendObject= new Object();
                        sendObject.t_id=$('#right_table td.preDrop').eq(k).find('li').attr('value');//t_id
                        sendObject.seq=k+1;
                        //alert("seq======"+sendObject.seq);
                        //alert(sendObject.t_id+'  '+sendObject.seq)//리스트안에 보내는값 확인
                        sendArr.push(sendObject);//배열에 객체 넣기
                     }
                  }
                  //alert('sendArr = '+sendArr);
                  //------------db에 저장하기위해 객체배열로 묶어주는 역할 끝.
                  var selectday = $(this).val();//선택한 날짜로 넘어가기위해 클릭한 값으로 바꿈.
                  $.ajax({
                     type: 'POST',
                     url: 'planInsertList.do',
                     traditional : true,
                     data:{'oldselectday':oldselectday,'selectday':selectday,'plan_id':plan_id,'totalday':totalDay,'m_id':m_id,'sendArr':JSON.stringify(sendArr)},
                     error : function(request, status, error){
                        alert("통신실패");
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                     },
                     success : function(result){
                        //alert("통신성공");
                        $('#insertList').empty();
                        $('#insertList').append(result);
                     }
                  
                  });//ajax List end
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
                  });//ajax Naver end
               }else{
                  //alert(selectDay)
                  $("#day").val(selectDay).prop("selected", true);//취소시 현재 day selected
               }
            })// day change end */
            
            
            $('table').bind('DOMNodeInserted', function(event) {
               var _thisEle = event.target;
               var nArr1 = new Array();
               
               for(var k=0;k<16;k++){ 
                  if($('#right_table td.preDrop').eq(k).find('li').length > 0){   
                     var t_id=$('#right_table td.preDrop').eq(k).find('li').attr('value');//t_id
                     nArr1.push(t_id);//
                  }
               }
               
                $.ajax({
                  type: 'POST',
                  url: 'NaverInsertMap.do',
                  traditional : true,
                  data:{'nArr':nArr1},
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
               
            });   //table Inserted
            
         });//function() end
         $(document).on("click","button[name='searchbtn']",function(){
            var totalsearch =  $('.totalsearch').val()
            
            
            $.ajax({
               type: 'POST',
               url: 'planSearch.do',
               traditional : true,
               data:{'search':totalsearch},
               error : function(request, status, error){
                  alert("통신실패");
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
               },
               success : function(result){
                  //alert("통신성공");
                  $('#draggable4').empty();
                  $('#draggable4').append(result);
               } 
            });//ajax Naver end
            
         })
         
         
         $(document).on("click","button[name='removebtn']",function(){
   
               $(this).parent().remove();
               var nArr2 = new Array();
               for(var k=0;k<16;k++){ 
                  if($('#right_table td.preDrop').eq(k).find('li').length > 0){   
                     var t_id=$('#right_table td.preDrop').eq(k).find('li').attr('value');//t_id
                     nArr2.push(t_id);//
                  }// if end
               }//for end 
            if(nArr2!=''){
               //alert(nArr2);  
               $.ajax({
                  type: 'POST',
                  url: 'NaverInsertMap.do',
                  traditional : true,
                  data:{'nArr':nArr2},
                  error : function(request, status, error){
                     alert("통신실패");
                     alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                  },
                  success : function(result){
                     //alert("통신성공");
                     $('#NaverMap').empty();
                     $('#NaverMap').append(result);

                  } 
               });//ajax end    
            }else{
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
               });//ajax Naver end
            }//else end
            
            
         });
            
      
         //---------------------------------------------------
         function insertTable(totalDay, time, selectday, selectDayPlan) { //여기에서 selectday = day_id(몇일쨰인지) 에따라 나와줘야함.
            //select day를 가져오면 
            //var time_count=8;
            //if(selectday = 3(변수로받아))
            insertDay(totalDay, selectday);//1은 selectday   

            for (var t = 0; t < selectDayPlan.length; t++) {
               //alert('a');
               $('#right_table td.preDrop')
                     .eq(selectDayPlan[t].seq - 1)
                     .children()
                     .append(
                           '<li class="item zzimlist" ondragstart="dragStart(event);" draggable="true" ondragend="dragEnd(event)" value="'
                                 + selectDayPlan[t].t_id
                                 + '" >'
                                 + selectDayPlan[t].t_name
                                 + '<button type="button" class="removeButton" name="removebtn"> X </button></li>')
               $('#right_table td.preDrop').eq(selectDayPlan[t].seq - 1)
                     .children().addClass("over");
               //drop에다가 class값 줘서 접근하고 추가하기.
            }
         }

         function insertDay(day, selectday) {//타이틀과  select
            var output = '';
            output += '<tr><td class="blank"></td><td class="title">Day'
                  + selectday + '     <select id="day">';
            for (var i = 1; i <= day; i++) {//day= 3
               if (i == selectday) {
                  output += '<option value="'+i+'" selected>Day' + i
                        + '</option>';
               } else {
                  output += '<option value="'+i+'">Day' + i + '</option>';
               }
            }
            output += '</select></td></tr>';
            $('#right_table').prepend(output);
         }
      </script>
</head>
<body>
<div id="container">
      
      <div class="left">
         
         <ul id="draggable">
            <li class="zzim-header">찜목록</li>
            <li class="total2"><div id="draggable5"></div></li>
         </ul>
         <ul id="draggable2">
            <li class="zzim-header">전체(키워드)</li>
            <li id="abc">
               <div class="search">
                  <input type="text" name="t_keyword" class="totalsearch" style="width:65%;height:22px;font-size:12px;">
                  <button class="searchbtn" name="searchbtn">검색</button>
               </div>
            </li>

            <li class="total"><div id="draggable4"></div></li>
         
         </ul>
         
      </div>

         <div class="right">
            <table id="right_table">
               <tr class="right_table_time">
                  <td class="time">08:00</td>
                  <!-- <td><div class="drop" id="test"></div></td> -->
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">09:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">10:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">11:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">12:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">13:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">14:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">15:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">16:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">17:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">18:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">19:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">20:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">21:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">22:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
               <tr class="right_table_time">
                  <td class="time">23:00</td>
                  <td class="preDrop"><div class="drop" ondragover="allowDrop();" ondrop="drop(event)" ondragleave="dragLeave(event)"></div></td>
               </tr>
            </table>
         </div>

</div>
   <div class="btn">
         <button type="button" id="savebtn" class="btn-info">저장</button><!-- 현재페이지 저장하고 나가기 -->&nbsp;&nbsp;&nbsp;&nbsp;
         <button type="button" id="cancelbtn" class="btn-danger">취소</button><!-- 저장안하고 나가기 -->
 </div>
 </body>
</html>