<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <c:import url="../module/head.jsp" />
  <c:import url="../module/foot.jsp" />
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  <style>
  .column {
    width: 170px;
    float: left;
    padding-bottom: 100px;
  }
  .portlet {
    margin: 0 1em 1em 0;
    padding: 0.3em;
    border: 1px solid;
  }
  .portlet-header {
  	background-color: yellow;
    padding: 0.2em 0.3em;
    margin-bottom: 0.5em;
    position: relative;
  }
  .portlet-toggle {
    position: absolute;
    top: 50%;
    right: 0;
    margin-top: -8px;
  }
  .portlet-content {
    padding: 0.4em;
  }
  .portlet-placeholder {
    border: 1px dotted black;
    margin: 0 1em 1em 0;
    height: 50px;
  }
  .ui-state-default{
  	border:1px dotted;
  }
  #sortable{
  	inline : blokc;
  }
  </style>

  <script>
  $( function() {
    $( ".column" ).sortable({
      connectWith: ".column",
      handle: ".portlet-header",
      cancel: ".portlet-toggle",
      placeholder: "portlet-placeholder ui-corner-all"
    });
    
    $( ".portlet" )
      .addClass( "ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" )
      .find( ".portlet-header" )
        .addClass( "ui-widget-header ui-corner-all" )
        .prepend( "<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");
 
    $( ".portlet-toggle" ).on( "click", function() {
      var icon = $( this );
      icon.toggleClass( "ui-icon-minusthick ui-icon-plusthick" );
      icon.closest( ".portlet" ).find( ".portlet-content" ).toggle();
    });
    
    $( function() {
        $( "#sortable" ).sortable({
          placeholder: "ui-state-highlight"
        });
        $( "#sortable" ).disableSelection();
      } );
    
    var downScreenX, downScreenY;
    
    $('#sortable > li').mousedown(function(e){
    	downScreenX = e.screenX;
    	downScreenY = e.screenY;
    }).mouseup(function(e){    	
    	var screenX = e.screenX;
    	var screenY = e.screenY;
    	
    	if(downScreenX !== undefined && downScreenY !== undefined){
    		if(downScreenX != screenX || downScreenY  != screenY){
    			var memberName = $(this).text();
    			var copyPortlet = $('#copyPortlet').clone();
    			copyPortlet.find('.portlet-content').text(memberName);
    			$('.column').eq(0).append(copyPortlet.html());    						
    		}
    	}
    })
  } );
  
  $(document).ready(function(){
	  $('#sortable').mousedown(function(e){
		  var charNum = $('#charNum').text();
		  charNum *= 1;
		  console.log(charNum);
		  $('#charNum').html(charNum+1);
	  });
	 
  });
  </script>
</head>
<body>
<!-- top -->
	<c:import url = "../module/top.jsp" />
	
<!-- left -->
	<div class="container-fluid" id="main">
	  <div class="row row-offcanvas row-offcanvas-left">
	<c:import url = "../module/left.jsp" />
<!--/모듈 여기까지-->
	<!-- main -->
	  <div class="col-md-9 col-lg-10 main" id="wrap">
	  <h1>열람실 ${room.room_nm}</h1>

<div id="copyPortlet" style="display: none;">
	<div class="portlet">
	  	<div class="portlet-header" id="charNum">10</div>
	  	<div class="portlet-content">빈좌석</div>
	</div>
</div>

<div class="column"> 
  <div class="portlet">
	  <div class="portlet-header">2</div>
	  <div class="portlet-content">빈좌석</div>
  </div> 
</div>

  
  <div class="portlet">
	  <div class="portlet-header">3</div>
	  <div class="portlet-content">빈좌석</div>
  </div>
  
  <div class="portlet">
	  <div class="portlet-header">4</div>
	  <div class="portlet-content">빈좌석</div>
  </div>  
</div>
 
<div class="column">
  <div class="portlet">
    <div class="portlet-header">5</div>
    <div class="portlet-content">빈좌석</div>
  </div>
 
  <div class="portlet">
    <div class="portlet-header">6</div>
    <div class="portlet-content">빈좌석</div>
  </div>
  
  <div class="portlet">
    <div class="portlet-header">7</div>
    <div class="portlet-content">빈좌석</div>
  </div>
</div>

<div class="column">
  <div class="portlet">
    <div class="portlet-header">8</div>
    <div class="portlet-content">빈좌석</div>
  </div>
  <div class="portlet">
    <div class="portlet-header">9</div>
    <div class="portlet-content">빈좌석</div>
  </div>
  <div class="portlet">
    <div class="portlet-header">10</div>
    <div class="portlet-content">빈좌석</div>
  </div> 
</div>
<div >

</div>
<div class="column">
</div>
<div class="column">
</div>
<div class="column">
</div>
<div class="column">
</div>
<div class="column">
</div>

<div style="clear: both; width: 200px;">
<span>좌석추가(드래그 해주세요)</span>
	<ul id="sortable">
		<li class="ui-state-default">빈좌석</li>
	</ul>
</div>
</div>
</div>
</body>
</html>


