<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
</head>
<body class="skin-blue">
	<div class="wrapper">
 	  <!-- 상단 -->
      <c:import url="../module2/top.jsp"/>
      
      <!-- 왼쪽 -->
 	  <c:import url="../module2/left.jsp" />
		
	  <!-- 수정부분  -->
      <div class="content-wrapper">
		  <section class="content-header">
		    <h1>
		       요금제설정
		      <small>Control panel</small>
		    </h1>
		    <ol class="breadcrumb">
		      <li><a href="${pageContext.request.contextPath}/dashboard/today_status"><i class="fa fa-book"></i>Home</a></li>
		      <li class="active">요금제</li>
		    </ol>
		  </section>
  	  
	  	  <!-- Main content -->
	      <section class="content">
	      	<div class="row">
	      	  <div class="col-md-6">
	      	  <!-- 테이블 -->
	            <div class="box box-primary">
	                <div class="box-header">
	                  <h3 class="box-title">요금제</h3>
	                </div><!-- /.box-header -->
	                <div class="box-body">
	                  <table id="example1" class="table table-bordered table-striped">
	                    <thead>
	                      <tr>
	                        <th>회원구분</th>
	                        <th>기간</th>
	                        <th>요금</th>
	                        <th>수정</th>
	                        <th>삭제</th>
	                      </tr>
	                    </thead>
	                    <tbody>
	                      <c:forEach var="c" items="${chargeslist}" >
		                      <tr>
		                        <td><input type="text" name="seat_member_type" class="form-control text01" value="${c.seat_member_type}" readonly/></td>
		                        <td><input type="text" name="seat_charges_date" class="form-control text02" value="${c.seat_charges_date}" readonly/></td>
		                        <td><input type="text" name="seat_charges_price" class="form-control text03" value="${c.seat_charges_price}" readonly/></td>
		                        <td><a href="${pageContext.request.contextPath}/charges/charges_update?charges_code=${c.seat_charges_code}"><button id="update_btn"><i class="fa  fa-eraser"></i></button></a></td>
		                        <td><a href="${pageContext.request.contextPath}/charges/charges_delete?charges_code=${c.seat_charges_code}"><button><i class="fa  fa-times"></i></button></a></td>
		                      </tr>
	                      </c:forEach>
	                    </tbody>
	                  </table>
                	</div><!-- /.box-body -->
              	</div><!-- /.box -->
              </div><!-- /.1 row col-md-6-->
              
              <div class="col-md-6">
	              <!-- 폼  테그 01 -->
	              <div class="box box-warning">
	                <div class="box-header">
	                  <h3 class="box-title">요금설정</h3>
	                </div><!-- /.box-header -->
	                <!-- form start -->
	                <form action="${pageContext.request.contextPath}/charges/charges_pro" method="post">
	                  <div class="box-body">
	                  	<input type="hidden" name="branch_owner_cd" value="${sessionScope.branchOwner.branch_owner_cd}" >
	                    <div class="form-group">
	                      <label>회원구분</label>
	                      <input type="text" name="seat_member_type" class="form-control" />
	                    </div>
	                    <div class="form-group">
	                      <label>기간(일)</label>
	                      <input type="text" name="seat_charges_date" class="form-control" />
	                    </div>
	                    <div class="form-group">
	                      <label>금액(원)</label>
	                      <input type="text" name="seat_charges_price" class="form-control" />
	                    </div>
                  	  </div><!-- /.box-body -->
                  	  <div class="box-footer">
	                    <button type="submit" class="btn btn-primary">등록</button>
	                  </div>
                	</form>
              	 </div><!-- box box-primary -->
              </div><!-- /.1 row col-md-6-->
	      	</div><!-- row -->
	      </section><!-- content -->
	     </div><!-- content-wrapper  -->
	   </div><!-- wrapper -->
	   
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
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/demo.js" type="text/javascript"></script>
    <!-- page script -->
    <script>
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
      
      $('.text01, text02, text03').dblclick(function(){
    	  console.log('클릭');
    	  $(this).removeAttr('readonly');
      });
      $('.text01, text02, text03').blur(function(){
    	  console.log('blur');
    	  $(this).attr('readonly','readonly');
      });
    
      
     </script>
    
</body>
</html>