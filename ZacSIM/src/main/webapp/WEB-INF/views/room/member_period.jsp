<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value='${toDay}' pattern='yyyyMMdd' var="nowDate"/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>ZakSIM</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- DATA TABLES -->
    <link href="${pageContext.request.contextPath}/resources/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="skin-blue">
    <div class="wrapper">
    <!-- 상단 -->
      <c:import url="../module2/top.jsp"/>
      
      <!-- 왼쪽 -->
 	  <c:import url="../module2/left.jsp" />
		
	  <!-- 오른쪽 -->
      <!-- 수정부분  -->
      <div class="content-wrapper">
		  <section class="content-header">
		    <h1>
		       	기간만료
		      <small>현재날짜 <fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd"/> (매일 오전 06:00에 기간 만료처리가 진행됩니다.)</small>
		    </h1>
		    <ol class="breadcrumb">
		      <li><a href="${pageContext.request.contextPath}/home/NewFile"><i class="fa fa-dashboard"></i>Home</a></li>
		      <li class="active">기간만료</li>
		    </ol>              
		  </section>
  	  <!-- Main content -->
      <section class="content">
      
      <div class="row">
       <div class="col-xs-12">
		<div class="box">
		<a href="${pageContext.request.contextPath}/room/member_period?dateNum=1"><button class="btn bg-maroon btn-flat margin">1일</button></a>
		<a href="${pageContext.request.contextPath}/room/member_period?dateNum=3"><button class="btn bg-maroon btn-flat margin">3일</button></a>
		<a href="${pageContext.request.contextPath}/room/member_period?dateNum=7"><button class="btn bg-maroon btn-flat margin">7일</button></a>
		<a href="${pageContext.request.contextPath}/room/member_period?dateNum=30"><button class="btn bg-maroon btn-flat margin">30일</button></a>
		<hr/>
		&nbsp;&nbsp;<button class="btn bg-olive allcheck" value="checked">전체선택</button>
		<div class="box-body">
		<table id="example2" class="table table-bordered table-hover">                                                                                 
		  <thead>
		    <tr>
		      <th></th>
		      <th>#</th>
		      <th>열람실</th>
		      <th>열람석</th>
		      <th>이름</th>
		      <th>연락처</th>
		      <th>기간 만료일</th>
		      <th>연장</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach var="e" items="${enddatelist}" varStatus="status">
		  	
		    <tr>
		      <td><input type="checkbox" class="checkboxs"/></td>
		      <td>${status.index}</td>
		      <td>${e.room_nm}</td>
		      <td>${e.seat_cnumber}번</td>
		      <td>${e.member_nm}</td>
		      <td>${e.member_tel}</td>
		      <td>${e.member_end_date}</td>
		      <td>
		      	<input type="hidden" class="member_nm" value="${e.member_nm}">
		      	<input type="hidden" class="seat_cd" value="${e.seat_cd}"/>
		      	<button class="btn bg-maroon period_btn period_btn">기간 연장</button>
		      <%-- <a href="${pageContext.request.contextPath}/payment/member_period_extension?member_nm=${e.member_nm}&seat_cd=${e.seat_cd}"></a> --%>
		      </td>
		    </tr>
		  </c:forEach>
		  </tbody>
		</table>
		</div><!-- box-body -->
		</div><!-- box -->
        </div><!-- col -->
	   </div><!-- row -->
      </section>
     </div>
   </div>
     
 <!-- jQuery 2.1.3 -->
    <script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- DATA TABES SCRIPT -->
    <script src="${pageContext.request.contextPath}/resources/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
    <!-- SlimScroll -->
    <script src="${pageContext.request.contextPath}/resources/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='${pageContext.request.contextPath}/resources/plugins/fastclick/fastclick.min.js'></script>
        <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- page script -->
    <script type="text/javascript">
      $(function () {
        $("#example1").dataTable();
        $('#example2').dataTable({
          "bPaginate": true,
          "bLengthChange": false,
          "bFilter": false,
          "bSort": true,
          "bInfo": true,
          "bAutoWidth": false
        });
      });
      
      //메뉴 고정
		$('#member_menu').addClass('active');
		$('#member04').addClass('active');
		
		$('.allcheck').on('click', function(){
			if($(this).val() == 'checked'){
				$('.checkboxs').prop('checked', true);
				$(this).val('check');
				return
			}else{
				$('.checkboxs').prop('checked', false);
				$(this).val('checked');
				return
			}		
		});
		
		//기간연장
		$('.period_btn').click(function(){
			 var member_nm = $(this).prev().prev().val();
			 var seat_cd = $(this).prev().val();
			 console.log('member_nm :' + member_nm);
			 console.log('seat_cd :' + seat_cd);
			 	var width=500, height=500;
			    var left = (screen.availWidth - width)/2;
			    var top = (screen.availHeight - height)/2;
			    var specs = "width=" + width;
			    specs += ",height=" + height;
			    specs += ",left=" + left;
			    specs += ",top=" + top;
				window.open('${pageContext.request.contextPath}/payment/newwindetail?member_nm='+member_nm+'&seat_cd='+seat_cd, '_blank', specs);
		});
		
    </script>
  </body>
</html>  