<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>ZacSIM Dashboard</title>
  <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
  <!-- Bootstrap 3.3.2 -->
  <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <!-- Font Awesome Icons -->
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <!-- Ionicons -->
  <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
  <!-- Morris charts -->
  <link href="${pageContext.request.contextPath}/resources/plugins/morris/morris.css" rel="stylesheet" type="text/css" />
  <!-- Theme style -->
  <link href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
  <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
  <link href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
  <!-- DATA TABLES -->
  <link href="${pageContext.request.contextPath}/resources/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
  
</head>
<body class="skin-blue">
    <div class="wrapper">
      <!-- 상단 -->
      <c:import url="../module2/top.jsp"/>
      <!-- 왼쪽 -->
 	  <c:import url="../module2/left.jsp" />
      
	  <!-- ---------------------내용 바로 위----------------------------- -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1> 오늘의 현황
            <small>(${today})</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
            <li class="active">오늘의 현황</li>
          </ol>
        </section>

		<!-- -----------------------내용!!!------------------------------ -->	
		<!-- http://ionicons.com/ -->
        <section class="content">
  
           <div class="row">
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3>${todayMemberNo}</h3>
                  <p>금일 등록 회원</p>
                </div>
                <div class="icon">
                  <i class="ion ion-person-add"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3>${useMemberNo}</h3>
                  <p>이용중 열람석</p>
                </div>
                <div class="icon">
                  <i class="ion ion-android-checkbox-outline"></i>
                </div>
                <a href="#example1" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3>${absenceMemberNo}</h3>
                  <p>부재중 열람석</p>
                </div>
                <div class="icon">
                  <i class="ion ion-coffee"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3>${unpaidMemberNo}</h3>
                  <p>미결제 열람석</p>
                </div>
                <div class="icon">
                  <i class="ion ion-social-usd"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
          </div><!-- /.row -->
  		  
  		  <div class="row">
            <div class="col-md-6">
              <!-- DONUT CHART 1 -->
              <div class="box box-danger">
                <div class="box-header">
                  <h3 class="box-title"><b>열람실 이용자 비율</h3>
                </div>
                <div class="box-body chart-responsive">
                  <div class="chart" id="now-room-num" style="height: 300px; position: relative;"></div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col (LEFT) -->
            
            <div class="col-md-6">
			 <!-- BAR CHART -->
              <div class="box box-success">
                <div class="box-header">
                  <h3 class="box-title"><b>현재 연령대별(성별) 이용자</b></h3>
                </div>
                <div class="box-body chart-responsive">
                  <div class="chart" id="bar-chart" style="height: 300px;"></div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col (RIGHT) -->
            
          </div><!-- /.row -->
          
          <div class="row">
            <div class="col-xs-12">
           	  <div class="box">
                <div class="box-header">
                  <h3 class="box-title"><b>현재 이용자</b></h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
	                      <th>열람실</th>
	                      <th>열람석</th>
	                      <th>이름</th>
	                      <th>성별</th>
	                      <th>입실 시간</th>
	                      <th>호출 메세지</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="m" items="${useMemberList}">
	                    <tr>
	                      <td>${m.room_nm}</td>
	                      <td>${m.seat_cd}</td>
	                      <td>${m.member_nm}</td>
	                      <td>${m.member_sex}</td>
	                      <td>${m.in_time}</td>
	                      <td><a href="#"><span class="label label-warning">Calling</span></a></td>
	                    </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
          
        </section><!-- /.content -->

      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
      </footer>
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='${pageContext.request.contextPath}/resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/demo.js" type="text/javascript"></script>
    <!-- Morris.js charts -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/morris/morris.min.js" type="text/javascript"></script>
    <!-- SlimScroll -->
    <script src="${pageContext.request.contextPath}/resources/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<!-- DATA TABES SCRIPT -->
    <script src="${pageContext.request.contextPath}/resources/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
    <!-- 페이지 내 href 경로 이동-->
    <script src="${pageContext.request.contextPath}/resources/js/templatemo-script.js"></script>
    
    <script>
    //메뉴 고정
    	$(function(){
    		console.log('하이');
    		$('#dashboard_menu').addClass('active');
    		$('#dashboard01').addClass('active');
    	});
    </script>
    
    <!-- Page script -->
     <script type="text/javascript">
      $(function () {
        "use strict";
      
      	//DONUT CHART
		  var donut = new Morris.Donut({
		    element: 'now-room-num',
		    resize: true,
		    colors: ["#3c8dbc", "#f56954", "#00a65a"],
		    data: [
		    	//ajax 
		      {label: "201호", value: 12},
		      {label: "202호", value: 30},
		      {label: "203호", value: 20}
		    ],
		    hideHover: 'auto'
		  });
		 
	  	  //BAR CHART
         // 연령대 변수
	     var useTeensWomanMemberNo = '<c:out value='${useAgeGroupW.teens}'/>';
	     useTeensWomanMemberNo *= 1; // int변환
         var useTeensMenMemberNo = '<c:out value='${useAgeGroupM.teens}'/>';
         useTeensMenMemberNo *= 1;
         var useTwentyWomanMemberNo = '<c:out value='${useAgeGroupW.twenty}'/>';
         useTwentyWomanMemberNo *= 1;
         var useTwentyMenMemberNo = '<c:out value='${useAgeGroupM.twenty}'/>';
         useTwentyMenMemberNo *= 1;
         var useThirtyWomanMemberNo = '<c:out value='${useAgeGroupW.thirty}'/>';
         useThirtyWomanMemberNo *= 1;
         var useThirtyMenMemberNo = '<c:out value='${useAgeGroupM.thirty}'/>';
         useThirtyMenMemberNo *= 1;
         var useFortyWomanMemberNo = '<c:out value='${useAgeGroupW.forty}'/>';
         useFortyWomanMemberNo *= 1;
         var useFortyMenMemberNo = '<c:out value='${useAgeGroupM.forty}'/>';
         useFortyMenMemberNo *= 1;
         var useEtcWomanMemberNo = '<c:out value='${useAgeGroupW.etc}'/>';
         useEtcWomanMemberNo *= 1;
         var useEtcMenMemberNo = '<c:out value='${useAgeGroupM.etc}'/>';
         useEtcMenMemberNo *= 1;	   
	   
	     var bar = new Morris.Bar({
	        element: 'bar-chart',
	        resize: true,
	        data: [
	          {y: '10대', a: useTeensMenMemberNo, b: useTeensMenMemberNo+useTeensWomanMemberNo , c: useTeensWomanMemberNo},
	          {y: '20대', a: useTwentyMenMemberNo, b: useTwentyMenMemberNo+useTwentyWomanMemberNo, c: useTwentyWomanMemberNo},
	          {y: '30대', a: useThirtyMenMemberNo, b: useThirtyMenMemberNo+useThirtyWomanMemberNo, c: useThirtyWomanMemberNo},
	          {y: '40대', a: useFortyMenMemberNo, b: useFortyMenMemberNo+useFortyWomanMemberNo, c: useFortyWomanMemberNo},
	          {y: '기타', a: useEtcMenMemberNo, b: useEtcMenMemberNo+useEtcWomanMemberNo, c: useEtcWomanMemberNo},
	        ],
	        barColors: ['#1266FF', '#E5D85C', '#FF3636'],
	        xkey: 'y',
	        ykeys: ['a', 'b', 'c'],
	        labels: ['남자', '합계', '여자'],
	        hideHover: 'auto'
	     });  
	  });
     </script>
     
     <script type="text/javascript">
      $(function () {
        $("#example1").dataTable();
        /* $('#example2').dataTable({
          "bPaginate": false,
          "bLengthChange": false, // jquery.dataTables.js 파일 내에 aLengthMenu로 find
          "bFilter": false,
          "bSort": false,
          "bInfo": false,
          "bAutoWidth": false
        }); */
      });
    </script>
    
  </body>
</html>
