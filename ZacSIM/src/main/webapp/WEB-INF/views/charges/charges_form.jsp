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
	      	  <div class="col-md-7">
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
		                        <td>
		                        	<form class="modify_form">
		                        		<input type="hidden" name="seat_charges_code" value="${c.seat_charges_code}" />
		                        		<input type="text" name="seat_member_type" class="form-control text01" value="${c.seat_member_type}" readonly/>
		                        	</form>
		                        </td>
		                        <td><form class="modify_form"><input type="text" name="seat_charges_date" class="form-control text02" value="${c.seat_charges_date}" readonly/></form></td>
		                        <td><form class="modify_form"><input type="text" name="seat_charges_price" class="form-control text03" value="${c.seat_charges_price}" readonly/></form></td>
		                        <td><button type="button" class="update_btn"><i class="fa  fa-eraser"></i></button></td>
		                        <td><a href="${pageContext.request.contextPath}/charges/charges_delete?charges_code=${c.seat_charges_code}"><button><i class="fa  fa-times"></i></button></a></td>
		                      </tr>
	                      </c:forEach>
	                    </tbody>
	                  </table>
	                 
                	</div><!-- /.box-body -->
              	</div><!-- /.box -->
              </div><!-- /.1 row col-md-6-->
              
              <div class="col-md-5">
	              <!-- 폼  테그 01 -->
	              <div class="box box-warning">
	                <div class="box-header">
	                  <h3 class="box-title">요금설정</h3>
	                </div><!-- /.box-header -->
	                <!-- form start -->
	                <form id="charges_form" action="${pageContext.request.contextPath}/charges/charges_pro" method="post">
	                  <div class="box-body">
	                  	<input type="hidden" name="branch_owner_cd" value="${sessionScope.branchOwner.branch_owner_cd}" >
	                    <div class="form-group">
	                      <label>회원구분</label>
	                      <input type="text" id="seat_member_type" name="seat_member_type" class="form-control" />
	                    </div>
	                    <div class="form-group">
	                      <label>기간(일)</label>
	                      <input type="text" id="seat_charges_date" name="seat_charges_date" class="form-control" />
	                    </div>
	                    <div class="form-group">
	                      <label>금액(원)</label>
	                      <input type="text" id="seat_charges_price" name="seat_charges_price" class="form-control" />
	                    </div>
                  	  </div><!-- /.box-body -->
                  	  <div class="box-footer">
	                    <button id="btn" type="button" class="btn btn-primary">등록</button>
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
      
      //더블클릭 이벤트
      $('.text01, .text02, .text03').dblclick(function(){
    	  console.log('클릭');
    	  $(this).removeAttr('readonly');
      });
      $('.text01, .text02, .text03').blur(function(){
    	  console.log('blur');
    	  $(this).attr('readonly','readonly');
      });
      
      //수정 하기
      $('.update_btn').click(function(){
    	  console.log('수정 클릭');
    	  var result = confirm('정말로 수정하시겠습니까?'); //confirm 창
    	  if(result){ //확인 버튼 눌렀을 때
    		  var parms = $(this).parent().parent().find('.modify_form').serialize(); //해당 버튼의 부모 부모 테그안의 modify_form클래스를 선택하고 serialize
        	  console.log(parms);
        	  $.ajax({
        		  type: "POST",
        		  url: "${pageContext.request.contextPath}/charges/charges_update", 
        		  data: parms, //보낼 데이터
        		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", //UTF-8로 인코딩해 한글깨짐 방지
        		  success:function(data){
        			  console.log('통신 성공');
        		  },
        		  error:function(data){
        			  console.log('통신 실패');
        		  }
    	  });
    	 }	  
      });
      
      var re_str = /^[가-힣a-z0-9_-]+$/;
  	  var re_num = /^[0-9]+$/;
      
      $('#btn').click(function(){
    	  if(re_str.test($('#seat_member_type').val()) != true){
    		  alert('회원구분을 입력해주세요.');
    		  $('#seat_member_type').focus();
    		  return false;
    	  }else if(re_num.test($('#seat_charges_date').val()) != true){
    		  alert('기간을 적어주세요.(숫자만 적어주세요.)');
    		  $('#seat_charges_date').focus();
    		  return false;
    	  }else if(re_num.test($('#seat_charges_price').val()) !=true){
    		  alert('금액을 적어주세요.(숫자만 적어주세요.)');
    		  return false;
    	  }else{
    		  $('#charges_form').submit();
    	  }
      });
      
    
      
     </script>
    
</body>
</html>