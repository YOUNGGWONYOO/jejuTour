<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>검색</title>
<style>
	.lo {
		font-size: 12pt; 
		margin-left:20px;
		}
}
</style>
</head>
<body>
<%String location=request.getContextPath(); %>
	<div id="namelist" >
		<c:forEach var="re" items="${region}">
			<c:if test="${re.region=='1'}">
				<input type="button" class="lo btn" onclick="location.href='<%=location%>/tour/list.do?region=1'" value="제주시 서부" >
			</c:if>
			<c:if test="${re.region=='2'}">
				<input type="button" class="lo btn" onclick="location.href='<%=location%>/tour/list.do?region=2'" value="제주시">
			</c:if>
			<c:if test="${re.region=='3'}">
				<input type="button" class="lo btn" onclick="location.href='<%=location%>/tour/list.do?region=3'" value="제주시 동부">
			</c:if>
			<c:if test="${re.region=='4'}">
				<input type="button" class="lo btn" onclick="location.href='<%=location%>/tour/list.do?region=4'" value="우도">
			</c:if>
			<c:if test="${re.region=='5'}">
				<input type="button" class="lo btn" onclick="location.href='<%=location%>/tour/list.do?region=5'" value="서귀포시 동부">
			</c:if>
			<c:if test="${re.region=='6'}">
				<input type="button" class="lo btn" onclick="location.href='<%=location%>/tour/list.do?region=6'" value="한라산">
			</c:if>
			<c:if test="${re.region=='7'}">
				<input type="button" class="lo btn" onclick="location.href='<%=location%>/tour/list.do?region=7'" value="서귀포시">
			</c:if>
			<c:if test="${re.region=='8'}">
				<input type="button" class="lo btn" onclick="location.href='<%=location%>/tour/list.do?region=8'" value="서귀포시 서부">
			</c:if>
			<c:if test="${re.region==null}">
				
			</c:if>
		</c:forEach>
	</div>
</body>
</html>