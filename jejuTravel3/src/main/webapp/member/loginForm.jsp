<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
    background:rgb(34,43,49,0.7);
    color:white;
    flex-basis: 35%;
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

#manager {position: absolute; float: left; bottom:0; background-color:rgba(255, 255, 255, 0.2); border:0;}

</style>

</head>
<body>
<%String location=request.getContextPath(); %>
<input id="manager" type="button" onclick="location.href='<%= location %>/manager/login.do'">
<div class="fullcontent" >
    <div class="headings">
        <h1><a style="color:white;text-decoration: none;" href="<%= location %>/search/main.do">Jeju Tour</a></h1>
        <h2>푸른바다 제주도에서 아름다운 추억만들기<br> 원하는대로 계획을 정하고 일정을 만들어 보세요!</h2>
    </div>
    <div class="formbox">
        <h3>Log In</h3>
        <form id="form" action="loginCheck.do" method="post">
            <label for="">ID</label>
            <input type="text" name="m_id" class="asd"/>
            <label for="">Password</label>
            <input type="password" id="" name="m_pw" class="asd"/>
              <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
                <c:if test="${msg == 'logout'}">
                    <div style="color: red">
                        로그아웃되었습니다.
                    </div>
                </c:if>
            <input id="btn" type="submit" name="submit" value="Log In" class="mainbox">
            <label for="">New customer?</label>
            <a href="insert.do" class="mainbox">Register Now</a>
          
        </form>	
    </div>
</div>

</body>
</html>