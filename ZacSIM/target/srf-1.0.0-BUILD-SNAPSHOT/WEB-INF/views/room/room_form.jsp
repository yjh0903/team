<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  </head>
</head>
<body class="skin-blue">
    <div class="wrapper">
    <!-- 상단 -->
      <c:import url="../module2/top.jsp"/>
      
      <!-- 왼쪽 -->
 	  <c:import url="../module2/left.jsp" />
		
	  <!-- 오른쪽 -->
      <div class="content-wrapper">
	  <section class="content-header">
	    <h1>
	       ZakSim
	      <small>Control panel</small>
	    </h1>
	    <ol class="breadcrumb">
	      <li><a href="${pageContext.request.contextPath}/home/NewFile"><i class="fa fa-table"></i>Home</a></li>
	      <li class="active">열람실</li>
	    </ol>
	  </section>
  	  
  	  <!-- Main content -->
      <section class="content">
		<div class="row">
            <div class="col-xs-12">
          		<div class="box box-danger">
               		<div class="box-header">
	                 <h3 class="box-title">열람실 등록하기</h3>
	               </div>
	               <form action="${pageContext.request.contextPath}/room/room_pro" method="post">
	               <div class="box-body">
	                 <div class="row">
	                   <div class="col-xs-2">
	                     <label>지점대표코드</label>
	                     <input type="text" class="form-control" name="branch_owner_cd" value="${sessionScope.branchOwner.branch_owner_cd}" readonly>
	                   </div>
	                   <div class="col-xs-3">
	                     <label>열람실 이름</label>
	                     <input type="text" class="form-control" name="room_nm" placeholder="열람실 이름을 입력해주세요.예)205호">
	                   </div>
	                   <div class="col-xs-3">
	                     <label>총 열람석 수</label>
	                     <input type="text" class="form-control" name="seat_num" placeholder="숫자만 입력해주세요">
	                   </div>
	                   <div class="col-xs-3">
	                     <label>구분</label>
	                     <select class="form-control" name="room_division">
	                       <option value="man">남학생실</option>
						   <option value="woman">여학생실</option>
						   <option value="normal">공용실</option>
	                     </select>
	                   </div>
	                   <div class="col-xs-1">
	                     <label>등록</label>
	                     <button type="submit" class="btn btn-block btn-info">확인</button>
	                   </div>
	                  
	                </div><!-- /.box-body row -->
                 </div><!-- /.box-body -->
                </form>	
              </div><!-- /.box box-danger -->	
            
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">등록된 열람실</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example2" class="table table-bordered table-hover">
                    <thead>
                      <tr>
		            	<th>열람실 코드 </th>
		           	    <th>열람실 이름</th>
		                <th>총 열람석 수</th>
		                <th>구분</th>
		                <th>수정</th>
		                <th>삭제</th>
            		  </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="r" items="${roomlist}">
                      	<tr>
                      		<td>${r.room_cd}</td>
                      		<td>${r.room_nm}</td>
                      		<td>${r.seat_num}</td>
                      		<td>${r.room_division}</td>
                      		<td><a href="#"><button id="update_btn"><i class="fa  fa-eraser"></i></button></a></td>
                      		<td><a href="${pageContext.request.contextPath}/room/room_delete?room_cd=${r.room_cd}"><button><i class="fa  fa-times"></i></button></a></td>
                      	</tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
			
		
	               
	             </div><!-- /.col -->	
            	</div><!-- /.row -->
           	</section> <!-- /.content -->
          </div><!-- /.content-wrapper -->	  
	</div><!-- /.wrapper -->
	
	
	<!-- JS -->
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
    <script src="${pageContext.request.contextPath}/resources/plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/demo.js" type="text/javascript"></script>
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
    </script>
</body>
</html>