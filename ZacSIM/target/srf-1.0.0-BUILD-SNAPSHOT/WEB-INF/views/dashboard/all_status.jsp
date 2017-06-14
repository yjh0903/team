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
    <!-- Morris chart -->
    <link href="${pageContext.request.contextPath}/resources/plugins/morris/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="${pageContext.request.contextPath}/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="${pageContext.request.contextPath}/resources/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

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
          <h1> 통계
            <small>(${today})</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
            <li class="active">통계</li>
          </ol>
        </section>

		<!-- -----------------------내용!!!------------------------------ -->	
		
        <section class="content">
  
          <!-- 작은 박스 4개 -->
          <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="ion ion-ios-people-outline"></i></span>
                <div class="info-box-content">
                  <h3 class="info-box-text">총 회원</h3>
                  <span class="info-box-number">${MemberNo} <small>명</small></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-red"><i class="ion ion-ios-people-outline"></i></span>
                <div class="info-box-content">
                  <h3 class="info-box-text"><b>${month}월</b> 등록 회원</h3>
                  <span class="info-box-number">${monthMemberNo} <small>명</small></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->

            <!-- fix for small devices only -->
            <div class="clearfix visible-sm-block"></div>

            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-green"><i class="ion ion-ios-cart-outline"></i></span>
                <div class="info-box-content">
                  <h3 class="info-box-text"><b>${month}월</b> 매출</h3>
                  <span class="info-box-number">12000000000 <small>원</small></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="ion ion ion-ios-cart-outline"></i></span>
                <div class="info-box-content">
                  <h3 class="info-box-text"><b>${month}월</b> 지출</h3>
                  <span class="info-box-number">1200 <small>원</small></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
		  <!-- 매출 회계 그래프 -->
          <div class="row">
            <div class="col-md-12">
              <div class="box">
              
                <div class="box-header with-border">
                  <h3 class="box-title"><b>월 매출 추이</b></h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <div class="btn-group">
                      <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                      </ul>
                    </div>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                
                <div class="box-body">
                  <div class="row">
                  
                    <div class="col-md-8">
                      <p class="text-center">
                        <strong>Sales: 1 Jan, 2014 - 30 Jul, 2014</strong>
                      </p>
                      <div class="chart-responsive">
                        <!-- Sales Chart Canvas -->
                        <canvas id="salesChart" height="180"></canvas>
                      </div><!-- /.chart-responsive -->
                    </div><!-- /.col -->
                    
                    <div class="col-md-4">
                      <p class="text-center">
                        <strong>Goal Completion</strong>
                      </p>
                      <div class="progress-group">
                        <span class="progress-text">Add Products to Cart</span>
                        <span class="progress-number"><b>160</b>/200</span>
                        <div class="progress sm">
                          <div class="progress-bar progress-bar-aqua" style="width: 80%"></div>
                        </div>
                      </div><!-- /.progress-group -->
                      <div class="progress-group">
                        <span class="progress-text">Complete Purchase</span>
                        <span class="progress-number"><b>310</b>/400</span>
                        <div class="progress sm">
                          <div class="progress-bar progress-bar-red" style="width: 80%"></div>
                        </div>
                      </div><!-- /.progress-group -->
                      <div class="progress-group">
                        <span class="progress-text">Visit Premium Page</span>
                        <span class="progress-number"><b>480</b>/800</span>
                        <div class="progress sm">
                          <div class="progress-bar progress-bar-green" style="width: 80%"></div>
                        </div>
                      </div><!-- /.progress-group -->
                      <div class="progress-group">
                        <span class="progress-text">Send Inquiries</span>
                        <span class="progress-number"><b>250</b>/500</span>
                        <div class="progress sm">
                          <div class="progress-bar progress-bar-yellow" style="width: 80%"></div>
                        </div>
                      </div><!-- /.progress-group -->
                    </div><!-- /.col -->
                  
                  </div><!-- /.row -->
                </div><!-- ./box-body -->
                
                <div class="box-footer">
                  <div class="row">
                    <div class="col-sm-3 col-xs-6">
                      <div class="description-block border-right">
                        <span class="description-percentage text-green"><i class="fa fa-caret-up"></i> 17%</span>
                        <h5 class="description-header">$35,210.43</h5>
                        <span class="description-text">TOTAL REVENUE</span>
                      </div><!-- /.description-block -->
                    </div><!-- /.col -->
                    <div class="col-sm-3 col-xs-6">
                      <div class="description-block border-right">
                        <span class="description-percentage text-yellow"><i class="fa fa-caret-left"></i> 0%</span>
                        <h5 class="description-header">$10,390.90</h5>
                        <span class="description-text">TOTAL COST</span>
                      </div><!-- /.description-block -->
                    </div><!-- /.col -->
                    <div class="col-sm-3 col-xs-6">
                      <div class="description-block border-right">
                        <span class="description-percentage text-green"><i class="fa fa-caret-up"></i> 20%</span>
                        <h5 class="description-header">$24,813.53</h5>
                        <span class="description-text">TOTAL PROFIT</span>
                      </div><!-- /.description-block -->
                    </div><!-- /.col -->
                    <div class="col-sm-3 col-xs-6">
                      <div class="description-block">
                        <span class="description-percentage text-red"><i class="fa fa-caret-down"></i> 18%</span>
                        <h5 class="description-header">1200</h5>
                        <span class="description-text">GOAL COMPLETIONS</span>
                      </div><!-- /.description-block -->
                    </div>
                  </div><!-- /.row -->
                </div><!-- /.box-footer -->
              
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->  
          
          
		  <!-- 원형 차트 3개 -->
          <div class="row">
          
            <div class="col-md-4">
             <div class="box box-default">
               <div class="box-header with-border">
                 <h3 class="box-title"><b>회원 등록 경로</b></h3>
                 <div class="box-tools pull-right">
                   <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                   <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                 </div>
               </div><!-- /.box-header -->
               <div class="box-body">
                 <div class="row">
                   <div class="col-md-8">
                    <div class="box box-primary">
		                <div class="box-header">
		                  <i class="fa fa-bar-chart-o"></i>
		                  <h3 class="box-title">Donut Chart</h3>
		                </div>
		                <div class="box-body">
		                  <div id="donut-chart" style="height: 150px;"></div>
		                </div><!-- /.box-body-->
		             </div><!-- /.box -->
                   </div><!-- /.col -->
                   <div class="col-md-4">
                     <ul class="chart-legend clearfix">
                       <li><i class="fa fa-circle-o text-red"></i> 인터넷</li>
                       <li><i class="fa fa-circle-o text-green"></i> 지인소개</li>
                       <li><i class="fa fa-circle-o text-yellow"></i> js파일 내용을</li>
                       <li><i class="fa fa-circle-o text-aqua"></i> 옮겨야 하는데</li>
                       <li><i class="fa fa-circle-o text-light-blue"></i> 옮기면</li>
                       <li><i class="fa fa-circle-o text-gray"></i> 오류가 뜨네..</li>
                     </ul>
                   </div><!-- /.col -->
                 </div><!-- /.row -->
               </div><!-- /.box-body -->
               <div class="box-footer no-padding">
                 <ul class="nav nav-pills nav-stacked">
                   <li><a href="#">United States of America <span class="pull-right text-red"><i class="fa fa-angle-down"></i> 12%</span></a></li>
                   <li><a href="#">India <span class="pull-right text-green"><i class="fa fa-angle-up"></i> 4%</span></a></li>
                   <li><a href="#">China <span class="pull-right text-yellow"><i class="fa fa-angle-left"></i> 0%</span></a></li>
                 </ul>
              </div><!-- /.footer -->
             </div><!-- /.box -->
            </div><!-- /.col -->
            
            <div class="col-md-4">
             <div class="box box-default">
               <div class="box-header with-border">
                 <h3 class="box-title"><b>독서실 주 이용 목적</b></h3>
                 <div class="box-tools pull-right">
                   <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                   <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                 </div>
               </div><!-- /.box-header -->
               <div class="box-body">
                 <div class="row">
                   <div class="col-md-8">
                     <div class="chart-responsive">
                       <canvas id="pieChart2" height="150"></canvas>
                     </div><!-- ./chart-responsive -->
                   </div><!-- /.col -->
                   <div class="col-md-4">
                     <ul class="chart-legend clearfix">
                       <li><i class="fa fa-circle-o text-red"></i> Chrome</li>
                       <li><i class="fa fa-circle-o text-green"></i> IE</li>
                       <li><i class="fa fa-circle-o text-yellow"></i> FireFox</li>
                       <li><i class="fa fa-circle-o text-aqua"></i> Safari</li>
                       <li><i class="fa fa-circle-o text-light-blue"></i> Opera</li>
                       <li><i class="fa fa-circle-o text-gray"></i> Navigator</li>
                     </ul>
                   </div><!-- /.col -->
                 </div><!-- /.row -->
               </div><!-- /.box-body -->
               <div class="box-footer no-padding">
                 <ul class="nav nav-pills nav-stacked">
                   <li><a href="#">United States of America <span class="pull-right text-red"><i class="fa fa-angle-down"></i> 12%</span></a></li>
                   <li><a href="#">India <span class="pull-right text-green"><i class="fa fa-angle-up"></i> 4%</span></a></li>
                   <li><a href="#">China <span class="pull-right text-yellow"><i class="fa fa-angle-left"></i> 0%</span></a></li>
                 </ul>
               </div><!-- /.footer -->
             </div><!-- /.box -->
            </div><!-- /.col -->
            
            <div class="col-md-4">
             <div class="box box-default">
               <div class="box-header with-border">
                 <h3 class="box-title"><b>성비</b></h3>
                 <div class="box-tools pull-right">
                   <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                   <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                 </div>
               </div><!-- /.box-header -->
               <div class="box-body">
                 <div class="row">
                   <div class="col-md-8">
                     <div class="chart-responsive">
                       <canvas id="pieChart3" height="150"></canvas>
                     </div><!-- ./chart-responsive -->
                   </div><!-- /.col -->
                   <div class="col-md-4">
                     <ul class="chart-legend clearfix">
                       <li><i class="fa fa-circle-o text-red"></i> Chrome</li>
                       <li><i class="fa fa-circle-o text-green"></i> IE</li>
                       <li><i class="fa fa-circle-o text-yellow"></i> FireFox</li>
                       <li><i class="fa fa-circle-o text-aqua"></i> Safari</li>
                       <li><i class="fa fa-circle-o text-light-blue"></i> Opera</li>
                       <li><i class="fa fa-circle-o text-gray"></i> Navigator</li>
                     </ul>
                   </div><!-- /.col -->
                 </div><!-- /.row -->
               </div><!-- /.box-body -->
               <div class="box-footer no-padding">
                 <ul class="nav nav-pills nav-stacked">
                   <li><a href="#">United States of America <span class="pull-right text-red"><i class="fa fa-angle-down"></i> 12%</span></a></li>
                   <li><a href="#">India <span class="pull-right text-green"><i class="fa fa-angle-up"></i> 4%</span></a></li>
                   <li><a href="#">China <span class="pull-right text-yellow"><i class="fa fa-angle-left"></i> 0%</span></a></li>
                 </ul>
               </div><!-- /.footer -->
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

    <!-- script -->
    <!-- jQuery 2.1.3 -->
    <script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/resources/plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- daterangepicker -->
    <script src="${pageContext.request.contextPath}/resources/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <!-- datepicker -->
    <script src="${pageContext.request.contextPath}/resources/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="${pageContext.request.contextPath}/resources/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- ChartJS 1.0.1 -->
    <script src="${pageContext.request.contextPath}/resources/plugins/chartjs/Chart.min.js" type="text/javascript"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="${pageContext.request.contextPath}/resources/js/dashboard2.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/demo.js" type="text/javascript"></script>
    <!-- FLOT PIE PLUGIN - also used to draw donut charts -->
    <script src="${pageContext.request.contextPath}/resources/plugins/flot/jquery.flot.pie.min.js" type="text/javascript"></script>
    
    <!-- Page script -->
    <!-- /resources/dist/js/pages/dashboard2.js 경로 따라가면 차트 내용 수정 가능 -->
    <script type="text/javascript">
      $(function () {

    	  /*
           * DONUT CHART
           * -----------
           */

          var donutData = [
            {label: "Series2", data: 30, color: "#3c8dbc"},
            {label: "Series3", data: 20, color: "#0073b7"},
            {label: "Series4", data: 50, color: "#00c0ef"}
          ];
          $.plot("#donut-chart", donutData, {
            series: {
              pie: {
                show: true,
                radius: 1,
                innerRadius: 0.5,
                label: {
                  show: true,
                  radius: 2 / 3,
                  formatter: labelFormatter,
                  threshold: 0.1
                }

              }
            },
            legend: {
              show: false
            }
          });
          /*
           * END DONUT CHART
           */

      });
      
    </script>
  </body>
</html>
