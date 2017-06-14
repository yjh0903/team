<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- 헤드 -->
	<c:import url="../module2/head.jsp"/>
	  <!-- JS -->
	 <c:import url="../module2/jsscript.jsp" />
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
	      <li><a href="${pageContext.request.contextPath}/home/NewFile"><i class="fa fa-dashboard"></i>Home</a></li>
	      <li class="active">열람실</li>
	    </ol>
	  </section>
  	  
  	  <!-- Main content -->
      <section class="content">
		<div class="row row-offcanvas row-offcanvas-left">
			<!--/모듈 여기까지-->
			<!-- main -->
			<div class="col-md-9 col-lg-10 main" id="wrap">

				<hr>
				<h2 class="sub-header">등록된 열람실</h2>
				<div class="card-deck-wrapper mb-3">
					<div class="card-deck">
						<div class="card card-inverse card-success text-center">
							<div class="card-block">
								<blockquote class="card-blockquote">
									<p>열람실 201호</p>
									<footer> 총 좌석 수 : 16 구분 : 남학생실 </footer>
								</blockquote>
							</div>
						</div>

						<div class="card card-inverse card-danger text-center">
							<div class="card-block">
								<blockquote class="card-blockquote">
									<p>열람실 202호</p>
									<footer> 총 좌석 수 : 17 구분 : 여학생실 </footer>
								</blockquote>
							</div>
						</div>
						<div class="card card-inverse card-warning text-center">
							<div class="card-block">
								<blockquote class="card-blockquote">
									<p>열람실 203호</p>
									<footer> 총 좌석 수 : 7 구분 : 남학생실 </footer>
								</blockquote>
							</div>
						</div>
						<div class="card card-inverse card-info text-center">
							<div class="card-block">
								<blockquote class="card-blockquote">
									<p>열람실 204호</p>
									<footer> 총 좌석 수 : 11 구분 : 여학생실 </footer>
								</blockquote>
							</div>
						</div>
					</div>
				</div>
				<hr>
				
				<div class="container left_contain">
					<form action="${pageContext.request.contextPath}/room/room_pro" method="post">
						<div class="form-group">
							<h2 class="display_inline">열람실 등록하기</h2>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>지점대표코드</th>
									    <!-- <th>No(열람실코드, 예:R6)</th> -->
										<th>열람실명(예:205호)</th>
										<th>좌석 수(숫자만)</th>
										<th>구분(예:남자, 여자)</th>
									</tr>
								</thead>
								<tbody id="add_tbody">
									<tr id="add_tr">
										<td><input type="text" class="form-control" name="branch_owner_cd" value="${sessionScope.branchOwner.branch_owner_cd}" readonly></td>
										<!-- <td><input type="text" class="form-control" name="room_cd"></td> -->
										<td><input type="text" class="form-control" name="room_nm"></td>
										<td><input type="text" class="form-control" name="seat_num"></td>
										<td>
											<select class="form-control" name="room_division">
												<option value="man">남학생실</option>
												<option value="woman">여학생실</option>
												<option value="normal">공용실</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<button type="submit" class="btn btn-info" class="room_btn">등록</button>	
					</form>		
				</div>
			</div>
		</div>
	</section>
      
   </div>
  </div>
   
</body>
</html>