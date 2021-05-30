<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색내용</title>
<!-- Meta -->
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    Favicon
    <link rel="shortcut icon" href="favicon.ico">

    Web Fonts
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    CSS Global Compulsory
    <link rel="stylesheet" href="../assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">

    CSS Header and Footer
    <link rel="stylesheet" href="../assets/css/headers/header-default.css">
    <link rel="stylesheet" href="../assets/css/footers/footer-v1.css">

    CSS Implementing Plugins
    <link rel="stylesheet" href="../assets/plugins/animate.css">
    <link rel="stylesheet" href="../assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="../assets/plugins/font-awesome/css/font-awesome.min.css">

    CSS Customization
    <link rel="stylesheet" href="../assets/css/custom.css"> -->
   
<style type="text/css"> 
.icon-heart{
color:red;
margin-right:5px;
}
#pricing{
   margin-top:-80px;
}
.tourInfo{
   max-width:400px;
}
</style>
 <link rel="stylesheet" href="../css/listMenu.css">
</head>
 <body>
<%@ include file="../form/header.jsp" %><br><br>
<%--   <div class="container">
        <div class="headline-center margin-bottom-60" style="text-align: center;">
            <h1>전체검색</h1><br><br><br><br>
            <h3>관련키워드 수: ${count}</h3>
        </div>
        
		<button class="btn btn-primary" onclick="history.back()">홈</button><br><br>
        <div class="row team-v6 margin-bottom-60">
        <c:forEach var="c"  items="${content}" >
            <div class="col-md-3 col-sm-6 md-margin-bottom-50" onclick="location.href='<%=location%>/tour/detailList.do?t_id=${c.t_id}&region=${c.region}&c_id=${c.c_id}&m_id=${sessionScope.m_id}'" style="cursor:pointer;text-align: center;">
	  			<img class="img-responsive" id="img" src="../tour_img/${c.region}/${c.c_id}/${c.t_name}_1.jpg" 
	  																	onerror="this.src='../tour_img/${c.region}/${c.c_id}/${c.t_name}_1.JPG'">
                <span>${c.t_name}</span><br>
                <small>${c.t_keyword}</small>
            </div>
            </c:forEach>
        </div><!--/end team v6-->
      </div> --%>
      
         <div class="headline-center margin-bottom-60" style="text-align: center;">
            <h1>전체검색</h1><br><br><br><br>
            <h3>관련키워드 수: ${count}</h3>
        </div>
        
      <section id="pricing">
      <div class="container">
         <div class="row">
            <div id="pricePlans">
			<button class="btn btn-primary" onclick="location.href='main.do'" style="margin-left:15px;">Home</button><br><br>
               <c:forEach var="tourlist" items="${content}" varStatus="status">
                  <div class="col-xs-4" style="cursor: pointer;"
                     onclick="location.href='<%=location%>/tour/detailList.do?t_id=${tourlist.t_id}&region=${tourlist.region}&c_id=${tourlist.c_id}&m_id=${sessionScope.m_id}'"  class="tourInfo">
                     <ul id="plan1" >
                        <li class="plan ">
                           <ul class="planContainer" >
                              <li class="title"><img class="img-responsive" id="img" src="../tour_img/${tourlist.region}/${tourlist.c_id}/${tourlist.t_name}_1.jpg" 
	  																	onerror="this.src='../tour_img/${tourlist.region}/${tourlist.c_id}/${tourlist.t_name}_1.JPG'" style="height: 250px;width:400px;">
                              </li>
                              <li>
                                 <h2 class="title">
                                     <br>
                                    <c:out value="${tourlist.t_name}" />
                                 </h2>
                              </li>

                              <li>
                                 <ul class="options">
                                    <li><span><c:out value="${tourlist.t_keyword}" /></span>
                                    </li>
                                    <li>
                                    
                                    <small>  <i class="icon-heart"></i> <c:out value="${tourlist.like_cnt}" /></small>
                                    </li>
                                 </ul>
                              </li>
                           </ul>
                        </li>
                     </ul>
                  </div>
               </c:forEach>
            </div>
         </div>
      </div>
   </section>
      
      
<!-- <!-- JS Global Compulsory			
<script type="text/javascript" src="../assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
JS Implementing Plugins
<script type="text/javascript" src="../assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="../assets/plugins/smoothScroll.js"></script>
JS Customization
<script type="text/javascript" src="../assets/js/custom.js"></script>
JS Page Level           
<script type="text/javascript" src="../assets/js/app.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        }); 
</script>
[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif] --> -->

<br><br>
<%@ include file="../form/footer.jsp" %>
</body>
</html>







