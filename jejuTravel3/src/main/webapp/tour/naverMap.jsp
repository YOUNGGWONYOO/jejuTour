<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
     --><title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=htmm65yl64" ></script>
</head>



<body>
<div id="map" style="width:900px;height:500px"></div>

<script>
var x = '${Mapx}'
var y = '${Mapy}'
//alert(x)
//alert(y)
   var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(x, y),
    zoom: 17
});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(x, y),
    map: map
});
</script>
</body>
</html>