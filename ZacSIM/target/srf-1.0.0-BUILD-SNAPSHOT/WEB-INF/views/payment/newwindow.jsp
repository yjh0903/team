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
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
  
<!--   다른창으로 값 넘기기	 -->
  <script type="text/javascript">
  /* function getSubmit() {
    window.opener.name = "room_main"; // 부모창의 이름 설정
    document.myForm.target = "room_main"; // 타켓을 부모창으로 설정
    document.myForm.action = "room_main.jsp";
    document.myForm.submit();
    self.close();
} */
</script>
 </HEAD>

 <BODY>
        <div class="row">
        <div class="col-md-6">
              <div class="box box-primary">
                <div class="container">
				  <ul class="nav nav-tabs">
				    <li><a data-toggle="tab" href="${pageContext.request.contextPath}/payment/member1">회원가입</a></li>
				    <li><a data-toggle="tab" href="${pageContext.request.contextPath}/payment/newwindow">결제</a></li>
				    <li><a data-toggle="tab" href="${pageContext.request.contextPath}/payment/member2">회원정보</a></li>
				  </ul>

                <!-- form start -->
                  <div class="box-body">
                      <form name="myForm" name="postForm" method="post" action="${pageContext.request.contextPath}/payment/paymentend">
					    <div class="form-group">
					    <label for="fname">결제코드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					    <input type="text" id="pay_cd" name="pay_cd" class="form-control">
					    </div>
					    
					    <div class="form-group">
					    <label for="fname">지점대표코드</label>
					    <input type="text" id="branch_owner_cd" name="branch_owner_cd" class="form-control" value="${branch_owner_cd}" readonly>
					    </div>
					    
					    <div class="form-group">
					    <label for="fname">열람실코드&nbsp;&nbsp;&nbsp;</label>
					    <input type="text" id="room_cd" name="room_cd" class="form-control" value="${room_cd}" readonly>
					    </div>
					    
					    <div class="form-group">
					    <label for="fname">열람석코드&nbsp;&nbsp;&nbsp;</label>
					    <input type="text" id="seat_cd" name="seat_cd" class="form-control" value="${seat_cd}" readonly>
					    </div>
					    
					    <div class="form-group">
					    <label for="fname">회원코드&nbsp;&nbsp;&nbsp;</label>
					    <input type="text" id="member_cd" name="member_cd" class="form-control">
					    </div>
					    
					    <div class="form-group">
					    <label for="fname">결제금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					    <input type="text" id="pay_amount" name="pay_amount" class="form-control" placeholder="결제 금액">
					    </div>
						
						<div class="form-group">
					    <label for="lname">할인금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					    <input type="text" id="discount_amount" name="discount_amount" class="form-control" placeholder="할인 금액">
						</div>
						
						<div class="form-group">
					    <label for="lname">총금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					    <input type="text" id="total_amount" name="total_amount" class="form-control" placeholder="총 금액">
					    </div>
						
						<div class="form-group">
					    <label for="lname">결제날짜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					    <input type="text" id="pay_date" name="pay_date" class="form-control" placeholder="결제 날짜">
					    </div>					    
					    
					    <div class="form-group">
					    <label for="결제 방법">결제방법&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					    <select id="결제 방법" name="결제 방법" class="form-control">
					      <option value="카드">카드</option>
					      <option value="현금">현금</option>
					      <option value="자동이체">자동이체</option>
					    </select>
					    </div>

					    <input type="hidden" value="nice" name="niceValue">

					    <div class="box-footer">
					       <button type="submit" class="btn btn-primary" onclick="getSubmit()" value="결제">결제</button>
					    </div>
					  </form>
              		</div>
             	</div>
            </div>
           </div>
           </div>
 </BODY>
</HTML>

 