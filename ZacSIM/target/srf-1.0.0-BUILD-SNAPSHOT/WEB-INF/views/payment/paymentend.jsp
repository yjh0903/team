<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--   현재창에서 보낸 값 받기	 -->
<%
	String pay_cd = request.getParameter("pay_cd");
	String branch_owner_cd = request.getParameter("branch_owner_cd");
	String room_cd = request.getParameter("room_cd");
	String seat_cd = request.getParameter("seat_cd");
	String member_cd = request.getParameter("member_cd");
%>

 <HEAD>
  <TITLE> New Document </TITLE>

 </HEAD>

 <BODY>
	<div class="row">
		<div class="col-md-6">
			<div class="box box-primary">
				<div class="container">
					<div class="box-body table-responsive no-padding">
						<table class="table">
							<tr>
								<th>결제코드</th>
								<th>지점대표코드</th>
								<th>열람실코드</th>
								<th>열람석코드</th>
								<th>회원코드</th>
								<th>결제금액</th>
								<th>할인금액</th>
								<th>총금액</th>
								<th>결제날짜</th>
								<th>결제방법</th>
							</tr>
							<tbody>

								<c:forEach var="b" items="${list}">
									<tr>
										<td>${b.pay_cd}</td>
										<td>${b.branch_owner_cd}</td>
										<td>${b.room_cd}</td>
										<td>${b.seat_cd}</td>
										<td>${b.member_cd}</td>
										<td>${b.pay_amount}</td>
										<td>${b.discount_amount}</td>
										<td>${b.total_amount}</td>
										<td>${b.pay_date}</td>
										<td>${b.pay_option}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


</BODY>
</HTML>

 