<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE> New Document </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
  
<!--   새창에서 값 받기	 -->
  <%
  	String pay_amount = request.getParameter("pay_amount");
    String discount_amount = request.getParameter("discount_amount");
	String total_amount = request.getParameter("total_amount");
	String pay_date = request.getParameter("pay_date");

%>
<!--   새창으로 값 넘기기	 -->
    <script>
  function test(){
    var getform = document.getForm; 
    //팝업생성
    window.open("newwindow.jsp?jun=jun&park=park&test=test","TheWindow","width=300,height=300, top=300,left=600");
  } 

﻿    //submit전에 action값 확인 
  function beforeSubmit(){
    var form = document.getForm;
    alert(form.action);
  }
  </script>
 </HEAD>
 <BODY>
 
 <!--   새창으로 값 넘기기	 -->
 
  <form name="getForm" method="get" action="newwindow.jsp?jun=jun&park=park" onsubmit="beforeSubmit(this.name);">
  <input type="test" name="test" value="test">
  <br>
  get방식으로 폼데이터 넘기기
  <br>
  <input type="submit" value="submit">
  </form>
  <br>
  
  <form name="postForm" method="post" action="newwindow.jsp" target="TheWindow" onsubmit="beforeSubmit(this.name);">
<!--   target이 없으면 현재창에서, target이 있으면 새창에서 열림 -->
  <input type="jun" name="jun" value="jun">
  <input type="park" name="park" value="park">
  <input type="test" name="test" value="test">
  <br>
  post방식으로 폼데이터 넘기기
  <br>
  <input type="submit" value="submit">
  </form>
  <br>
  
  <form name="postForm" method="post" action="newwindow.jsp?jun=jun&park=park" onsubmit="beforeSubmit(this.name);">
  <input type="jun" name="jun" value="jun">
  <input type="park" name="park" value="park">
  <input type="test" name="test" value="test">
  <br>
  post방식으로 target없이 현재창으로 폼데이터 넘기기
  <br>
  <input type="submit" value="submit">
  </form>
  <br>
  
  <input type="button" value="결제" onclick="test();">
  <br>
  <br>
  
  
  
   <!--   새창에서 값 받기	 --> 
    <label for="fname">결제금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <input type="text" id="pay_amount" name="pay_amount" placeholder="<%=pay_amount%>">
	<br>
	
    <label for="lname">할인금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <input type="text" id="discount_amount" name="discount_amount" placeholder="<%=discount_amount%>">
	<br>
	
    <label for="lname">총금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <input type="text" id="total_amount" name="total_amount" placeholder="<%=total_amount%>">
	<br>
	
    <label for="lname">결제날짜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <input type="text" id="pay_date" name="pay_date" placeholder="<%=pay_date%>">
    <br>
  
  
 </BODY>
</HTML>
