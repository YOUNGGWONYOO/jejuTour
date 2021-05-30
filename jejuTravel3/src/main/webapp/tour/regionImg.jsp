<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</head>
<body>

<!--===========사진======================================= -->
      <div class="inner">
         <div>
            <div class="row">
               <div class="col-lg-12 text-center">
                  <div id="testimonial-wrapper">

                     <c:forEach var="i" begin="1" end="3">
                        <div class="item">
                           <img src="${pageContext.request.contextPath}/reg_img/region${region}_${i}.jpg" 
                           
                           style="height: 350px; width: 600px">
                        
                        </div>
                     </c:forEach>
                  </div>
               </div>
            </div>
         </div>
      </div>


<!--===========사진======================================= -->
 
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