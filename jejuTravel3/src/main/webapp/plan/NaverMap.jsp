<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=htmm65yl64"></script>
</head>
<body>
<div id="map" style="width:600px;height:450px;"></div>

<script>
var testposition = JSON.parse('${maptest}');

//testposition[0].호텔아로하[0] number
//alert("testposition[0].position "+testposition[0].position);
//결론 객체배열로 넘어옴.

//[{"day_id":1,"id":23,"seq":1,"t_name":"호텔아로하"}]
/* var  MARKER_SPRITE_POSITION = {
        "기억": [37.8595704, 126.105399],
        "니은": [37.3595704, 127.105399],
        "씨": [37.1595704, 127.905399],
        "D0": [38.3595704, 126.305399]
    };
 */
 
//alert('testposition[i][key]'+testposition[i][key][0]);
//alert('testposition[i][key]'+testposition[i][key][1]);		
//var MARKER_SPRITE_POSITION = testposition;
// alert('testpostion의길이 = '+testposition.length);
// alert('으으 testposition[i][key][0]=>'+testposition[0].position[0])


var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(33.39551580816196, 126.59234038179457),
    zoom: 10
});//지도의 기본 center 중심인곳 과 zoom크기 정해줌.

var markers = [],
    infoWindows = [];
//testposition[i].position[0],
//testposition[i].position[1]   Object.keys(testposition).length;
//alert(Object.keys(testposition[0]).length)
for(var i=0;i<Object.keys(testposition[0]).length;i++){//1   , ex)3
	//alert(testposition[i]);
	var x = Object.values(testposition[0])[i][0];
	var y = Object.values(testposition[0])[i][1];
	//alert('x=  '+x);
	//alert('y=  '+y);
	var position = new naver.maps.LatLng(
			x,
			y);

		    var marker = new naver.maps.Marker({
		        map: map,
		        position: position,
		        title: '제발',
		        //icon
		        zIndex: 100
		    });
	
	var infoWindow = new naver.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:10px;"><b>'+ Object.keys(testposition[0])[i] +'</b></div>'
    });
	markers.push(marker);
    infoWindows.push(infoWindow);
};
/* for (var key in MARKER_SPRITE_POSITION) {
	alert("naver 좌표띄울거임."+testposition[0].key[0])
	//naver 좌표띄울거임.undefined
    var position = new naver.maps.LatLng(
    	MARKER_SPRITE_POSITION[0],
    	MARKER_SPRITE_POSITION[1]);

    var marker = new naver.maps.Marker({
        map: map,
        position: position,
        title: key,
        //icon
        zIndex: 100
    }); 

    var infoWindow = new naver.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'+ key +'"</b>.</div>'
    });

    markers.push(marker);
    infoWindows.push(infoWindow);
};
*/
naver.maps.Event.addListener(map, 'idle', function() {
    updateMarkers(map, markers);
});

function updateMarkers(map, markers) {

    var mapBounds = map.getBounds();
    var marker, position;

    for (var i = 0; i < markers.length; i++) {

        marker = markers[i]
        position = marker.getPosition();

        if (mapBounds.hasLatLng(position)) {
            showMarker(map, marker);
        } else {
            hideMarker(map, marker);
        }
    }
}

function showMarker(map, marker) {

    if (marker.setMap()) return;
    marker.setMap(map);
}

function hideMarker(map, marker) {

    if (!marker.setMap()) return;
    marker.setMap(null);
}

// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
function getClickHandler(seq) {
    return function(e) {
        var marker = markers[seq],
            infoWindow = infoWindows[seq];

        if (infoWindow.getMap()) {
            infoWindow.close();
        } else {
            infoWindow.open(map, marker);
        }
    }
}

for (var i=0, ii=markers.length; i<ii; i++) {
    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
}

</script>
</body>
</html>