<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon.ico 404 Not found 에러 -->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
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

</head>
<body>
<c:if test="${cnt==0}">
<br><br>
      <div align="center">검색 결과가 없습니다.</div>
<br><br>
</c:if>
<c:if test="${cnt>0}"> 

   <section id="pricing">
      <div class="container">
         <div class="row">
            <div id="pricePlans">

               <c:forEach var="tourlist" items="${list}" varStatus="status">
                  <div class="col-xs-4" style="cursor:pointer;"
                     onclick="location.href='detailList.do?t_id=${tourlist.t_id}&region=${tourlist.region}&c_id=${tourlist.c_id}&m_id=${sessionScope.m_id}'"  class="tourInfo">
                     <ul id="plan1">
                        <li class="plan ">
                           <ul class="planContainer">
                              <li class="title"><img
                                 src="${pageContext.request.contextPath}/tour_img/${tourlist.region}/${tourlist.c_id}/${tourlist.t_name}_1.jpg"
                                 onerror="this.src='${pageContext.request.contextPath}/tour_img/${tourlist.region}/${tourlist.c_id}/${tourlist.t_name}_1.JPG'"
                                 height="250px;" width="400px">
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
</c:if>



<div align="center" >${pagingHtml}</div>

   
<!-- </table> -->

</body>
</html>