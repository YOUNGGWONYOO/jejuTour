<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	$(function(){
		
		$('#check').click(function(){
			var m_id=$('#m_id').val()
			
			var f = document.createElement("form"); // form 엘리멘트 생성 
			f.setAttribute("method","post"); // method 속성을 post로 설정
			f.setAttribute("action","idCheck.do"); // submit했을 때 무슨 동작을 할 것인지 설정
			document.body.appendChild(f); // 현재 페이지에 form 엘리멘트 추가 

			var i = document.createElement("input"); // input 엘리멘트 생성 
			i.setAttribute("type","hidden"); // type 속성을 hidden으로 설정
			i.setAttribute("name","m_id"); // name 속성을 'm_id_check'으로 설정 
			i.setAttribute("value",m_id); // value 속성을 m_id에 담겨있는 값으로 설정 
			f.appendChild(i); // form 엘리멘트에 input 엘리멘트 추가 

			f.submit(); // form 태그 서브밋 실행

		})
		if(${id != null}){
			$('#m_id').val('${id}');
		}
	})
</script>
<style>
@import url('https://fonts.googleapis.com/css?family=Dancing+Script|Lato');
:root{
    --primaryred:#ff424f;
    --secondaryred:#f84735;
    --lightblack:#222b31;
    --darkblack:#191c1f;
    --mainfont:'Dancing Script', cursive;
    --secondfont: 'Lato', sans-serif;
}
body{
	margin: 0;
	padding: 0;
	font-size: 16px;
	line-height: 1.5;
	font-family:var(--secondfont);
}
*,*:before,*:after{
	box-sizing: border-box;
}
img{
	max-width: 100%;
	height: auto;
}
.fullcontent{
    width:100%;
    min-height: 100vh;
    height: auto;
    padding:6% 10% 5% 10%;
    background-image: url(../img/jeju.jpg);
    background:linear-gradient(rgba(0, 0, 0, 0.70), rgba(0, 0, 0, 0.70)),url(../img/jeju.jpg);
    background-size: cover;
    background-position: 50% 50%;
    display: flex;
    flex-direction: row;
}
.headings{
     /* background:red;  */
    flex-basis: 65%;
    margin-right: 5%;
}
.headings h1{
    font-size: 4rem;
    font-family:var(--mainfont);
    color:white;
    margin:3% 0% 3% 0%;
}
.headings h2{
	font-size:1.2rem;
    font-weight: 300;
    color: rgba(255, 255, 255, 0.5);
}
.formbox{
 	top:50%;
 	left:50%;
  	transform:translate(80%,0%);
    background:rgb(34,43,49,0.7);
    color:white;
    flex-basis: 40%;
    border-top: 10px solid var(--secondaryred);
    padding:2% 3%;
}
.formbox *{
    margin: 0;
}
.formbox h3{
    font-family: var(--mainfont);
    font-size: 1.5rem;
    margin-bottom: 1rem;
}
.formbox form label{
    color: rgba(255, 255, 255, 0.8);
    display: inline-block;
    max-width: 100%;
    margin-bottom: 0.3rem;
}
.formbox form .asd{
    border: 2px solid rgba(255, 255, 255, 0.2);
    box-shadow: none;
    background: transparent;
    height: 2.8rem;
    display: block;
    width: 100%;
    border-radius: 4px;
    margin-bottom: 1rem;
    color:white;
}
form .mainbox{
    color: white;
    box-shadow: none;
    background: var(--secondaryred);
    height: 2.8rem;
    display: block;
    width: 100%;
    border-radius: 4px;
    margin-bottom: 10px;
    text-align: center;
    text-decoration: none;
    border: none;
}
a .mainbox{
    margin: 0;
    padding: 2%;
}

</style>
</head>
<body>
<div class="fullcontent">
    <div class="formbox">
        <h3>Register</h3>
        <form id="form" action="insertUser.do" method="post">
            <label for="">ID</label>
            <input type="text" id="m_id" name="m_id" class="asd"/> <input type="button" id="check" value="중복체크">
             <c:if test="${msg == 'id_true'}">
		          <div style="color: green">
		               아이디를 사용 할 수 있습니다.
		          </div>
		     </c:if>
		     <c:if test="${msg == 'id_false'}">
		          <div style="color: red">
		                아이디를 사용 할 수 없습니다.
		         </div>
		     </c:if>
		    <br>
            <label for="">Password</label>
            <input type="password" id="" name="m_pw" class="asd"/>
            <label for="">Name</label>
            <input type="text" name="m_name" class="asd"/>
            <label for="">E-mail</label>
            <input type="text" id="" name="m_email" class="asd"/>
            <label for="">Phone</label>
            <input type="text" name="m_phone" class="asd"/>
       
              
            <input id="btn" type="submit" name="submit" value="Register" class="mainbox">
            <c:if test="${check == 'check'}">
		          <div style="color: red">
		                정보를 모두 입력하세요.
		         </div>
		     </c:if>
            <label for="">Do you already have an ID?</label>
            <a href="login.do" class="mainbox">Go Login</a>
          
        </form>	
    </div>
</div>
</body>
</html>