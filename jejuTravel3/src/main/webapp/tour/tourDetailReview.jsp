<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<title>Insert title here</title>
   <meta charset="UTF-8">

<script>
$(function(){
   $('.deleteBtn').click(function(){
      //alert( $(this).attr('name'))//리뷰 일련번호 
      var r_id=$(this).attr('name')
      var t_id = '${t_id}'
      var region = '${region}'
      var c_id='${c_id}'
      var m_id='${m_id}'
      $.ajax({
         type: 'post',
         url: 'deleteReview.do',
         data:{r_id:r_id,t_id:t_id,region:region,c_id:c_id,m_id:m_id},
         error : function(request, status, error){
            alert("통신실패");
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         },
         success : function(result){
            $('#content').empty();
            $('#content').append(result);
            //alert("통신성공");
            alert("리뷰가 정상적으로 삭제되었습니다.")
             
         }
      })
   })
})

</script>
</head>
<body>
   <c:set value="${m_id }" var="m_id" />
   <div id="wrapper">
      <div>
         <c:forEach var="review" items="${selectReview}">
            <c:set value="${review.m_id }" var="review_m_id" />

            <%-- <td>리뷰 일련번호: <c:out value="${review.r_id}" /></td>
                  <td>여행지 일련번호: <c:out value="${review.t_id}" /></td> --%>


            <section
               style="border-radius: 5px; background: #f5e9dd; margin: 7px; padding: 10px;">
               <div>

                  <div>
                     <h3>
                        <c:out value="${review.m_id}" />
                     </h3>
                  </div>
                  <p>
                     <c:out value="${review.r_content}" />
                  </p>
                  <span class="text-muted  pull-right " style="margin-top: -13px;"><c:out
                        value="${review.write_date}" /></span>

                  <c:if test="${ m_id eq review_m_id}">
                     <button type="button" class="btn btn-danger btn-trans deleteBtn"
                        name="${review.r_id }">리뷰 삭제</button>
                  </c:if>

               </div>
            </section>
         </c:forEach>
      </div>
   </div>
</body>
</html>