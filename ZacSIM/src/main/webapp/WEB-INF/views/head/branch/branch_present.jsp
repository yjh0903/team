<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/head/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/head/css/templatemo-style.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/templatemo-style.css" rel="stylesheet">

</head>
<body>
	<!-- Left column -->
	<c:import url="../module/left.jsp" />
	<!-- top column -->
	<c:import url="../module/top.jsp" />

	<div class="templatemo-content-container row"
		style="min-height: 700px;">
		<div class="templatemo-content-widget white-bg">
			<div class="row">

				<!--      <h2 class="media-heading text-uppercase blue-text">본사</h2>
                         
              <div class="table-responsive">
                <table class="table">
                  <tbody>
                    <tr>
                      <td><div class="circle green-bg"></div></td>
                      <td>주소</td>
                      <td>전라북도 전주시 완산구</td>                    
                    </tr> 
                    <tr>
                      <td><div class="circle pink-bg"></div></td>
                      <td>전화번호</td>
                      <td>063-123-4567</td>                    
                    </tr>  
                    <tr>
                      <td><div class="circle blue-bg"></div></td>
                      <td>사업자번호</td>
                      <td>111-2222-33333</td>                    
                    </tr>                                       
                  </tbody>
                </table> -->
				<!-- <div class="templatemo-content-widget white-bg"> -->

				<h1 class="margin-bottom-10">지점 현황</h1>
				<hr>
				<div class="col-sm-7">
					<c:forEach var="l" items="${list}">
						<div class="table-responsive">
							<h3>${l.branch_nm}</h3>
							<table class="table">
								<tbody>
									<tr>
										<td><div class="circle green-bg"></div></td>
										<td><label>주소: ${l.branch_addr}</label></td>
									</tr>
									<tr>
										<td><div class="circle pink-bg"></div></td>
										<td><label>전화번호: ${l.branch_tel}</label></td>
									</tr>
									<tr>
										<td><div class="circle blue-bg"></div></td>
										<td><label>사업자번호: ${l.owner_num}</label><td>
									</tr>
								</tbody>
							</table>
							<br>
						</div>
					</c:forEach>
				</div>
				<div class="col-sm-5" id="map" style="width: 40%; height: 600px;"></div>
			</div>
		</div>

		<!-- <div class="templatemo-content-widget white-bg">
                <i class="fa fa-times"></i>
                <div class="media">
                  <div class="media-left">
                jj
                  </div>
                  <div class="media-body">
                    <h2 class="media-heading text-uppercase">Consectur Fusce Enim</h2>
                    <p>Phasellus dapibus nulla quis risus auctor, non placerat augue consectetur.</p>  
                  </div>
                </div>                
              </div>    -->
		<c:import url="../module/footer.jsp" />
	</div>



	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=0536ec56a5a535f962f3a6c98aa6d73a"></script>
	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(35.843435, 127.130736), // 지도의 중심좌표
        level: 13 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
    {
        content: '<div>전주점</div>', 
        latlng: new daum.maps.LatLng(35.850013, 127.161777)
    },
    {
        content: '<div>신림점</div>', 
        latlng: new daum.maps.LatLng(37.460450, 126.953609)
    },
    {
        content: '<div>가양점</div>', 
        latlng: new daum.maps.LatLng(36.341096, 127.442456)
    }
];

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new daum.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

/* 아래와 같이도 할 수 있습니다 */
/*
for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new daum.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    (function(marker, infowindow) {
        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
        daum.maps.event.addListener(marker, 'mouseover', function() {
            infowindow.open(map, marker);
        });

        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
        daum.maps.event.addListener(marker, 'mouseout', function() {
            infowindow.close();
        });
    })(marker, infowindow);
}
*/
</script>

	<!-- JS -->
	<!-- jQuery -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/head/js/jquery-1.11.2.min.js"></script>
	<!-- http://markusslima.github.io/bootstrap-filestyle/ -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/head/js/bootstrap-filestyle.min.js"></script>
	<!-- Templatemo Script -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/head/js/templatemo-script.js"></script>
</body>
</html>
