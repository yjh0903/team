<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/head/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/head/css/templatemo-style.css" rel="stylesheet">
<!-- DATA TABLES -->
<link href="${pageContext.request.contextPath}/resources/head/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<!-- Left column -->
	<c:import url="../module/left.jsp"/>
	<!-- top column -->	
	<c:import url="../module/top.jsp"/>
		
			<!-- Main content -->
			<div class="templatemo-content-container row col-md-12" style="min-height: 700px;">
				<div class="templatemo-content-widget white-bg">
					<h2 class="margin-bottom-10">사업자 목록</h2>
					<hr>
					<!-- main start -->
					<div>
						<table id="example1" class="table table-bordered table-striped">
	                    <thead>
	                      <tr>
	                      	<th>사업자 번호</th>
							<th>사업자명</th>
							<th>사업자 연락처</th>
							<th>지점명</th>
							<th>지점 연락처</th>
							<th>지점 주소</th>
	                      </tr>
	                    </thead>
	                    <tbody>
	                    <c:forEach var="o" items="${ownerList}">
		                    <tr>
		                      <td>${o.owner_num}</td>
		                      <td>
			                      <a href="${pageContext.request.contextPath}/head/branch_owner/branch_owner_modify?branch_owner_cd=${o.branch_owner_cd}">
			                      	${o.owner_nm}
			                      </a>	
		                      </td>
		                      <td>${o.branch_owner_tel}</td>
		                      <td>${o.branch_nm}</td>
		                      <td>${o.branch_tel}</td>
		                      <td>${o.branch_addr} ${o.branch_detail_addr}</td>
		                    </tr>
	                    </c:forEach>
	                    </tbody>
	                  	</table>
                  	</div>
                  	<!-- main end -->
				</div>
				<c:import url="../module/footer.jsp"/>
			</div>
		</div>
	</div>

	<!-- JS -->
	<!-- jQuery -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/head/js/jquery-1.11.2.min.js"></script>
	<!-- http://markusslima.github.io/bootstrap-filestyle/ -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/head/js/bootstrap-filestyle.min.js"></script>
	<!-- Templatemo Script -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/head/js/templatemo-script.js"></script>
	<!-- DATA TABES SCRIPT -->
    <script src="${pageContext.request.contextPath}/resources/head/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/head/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
	
	<script type="text/javascript">
      $(function () {
        $("#example1").dataTable();
        $('#example2').dataTable({
          "bPaginate": true,
          "bLengthChange": true, // jquery.dataTables.js 파일 내에 aLengthMenu로 find
          "bFilter": true,
          "bSort": true,
          "bInfo": true,
          "bAutoWidth":true
        });
      });
    </script>
	
</body>
</html>
					