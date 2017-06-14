<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var pamphletNo = $('#pamphletNo').val();
			var placardNo = $('#placardNo').val();
			var introductionNo = $('#introductionNo').val();
			var internetNo = $('#internetNo').val();
			var etctcNo = $('#etctcNo').val();
			
			pamphletNo*=1; // int 변환
			placardNo*=1;
			introductionNo*=1;
			internetNo*=1;
			etctcNo*=1;
			
			console.log('pamphletNo :' +  pamphletNo);
			console.log('placardNo :' +  placardNo);
			console.log('introductionNo :' +  introductionNo);
			console.log('internetNo :' +  internetNo);
			console.log('etctcNo :' +  etctcNo);
			
			google.charts.load("current", {packages:["corechart"]});
			google.charts.setOnLoadCallback(drawChart);
			function drawChart() {
			 var a = a;
			  var data = google.visualization.arrayToDataTable([
			    ['Task', 'Hours per Day'],
			    ['지인 소개', introductionNo],
			    ['전단지', pamphletNo],
			    ['인터넷 검색', internetNo],
			    ['플래카드', placardNo],
			    ['기타', etctcNo],
			  ]);
			  var options = {
			    title: '회원 등록 경로',
			    pieHole: 0.3,
			  };
			  var chart = new google.visualization.PieChart(document.getElementById('memberPath'));
			  chart.draw(data, options);
			}
		});
    </script>
    
    <script type="text/javascript">
		$(document).ready(function(){	
			var MenNo = $('#MenNo').val();
			var womanNo = $('#womanNo').val();
			
			MenNo*=1;
			womanNo*=1;
			
			console.log('MenNo :' +  MenNo);
			console.log('womanNo :' +  womanNo);
		
			google.charts.load("current", {packages:["corechart"]});
			google.charts.setOnLoadCallback(drawChart);
			function drawChart() {
			  var data = google.visualization.arrayToDataTable([
			    ['Task', 'Hours per Day'],
			    ['남성회원', MenNo],
			    ['여성회원', womanNo]
			  ]);
			  var options = {
			    title: '회원 성비',
			    pieHole: 0.3,
			  };
			  var chart = new google.visualization.PieChart(document.getElementById('sexRatio'));
			  chart.draw(data, options);
		  }
		});
    </script>
    
	<script type="text/javascript">
		$(document).ready(function(){
			var useMemberNo = $('#useMemberNo').val();
			var absenceMemberNo = $('#absenceMemberNo').val();
			var unpaidMemberNo = $('#unpaidMemberNo').val();
			
			useMemberNo*=1; // int 변환
			absenceMemberNo*=1;
			unpaidMemberNo*=1;
			
			console.log('useMemberNo :' +  useMemberNo);
			console.log('absenceMemberNo :' +  absenceMemberNo);
			console.log('unpaidMemberNo :' +  unpaidMemberNo);
			
			google.charts.load('current', {packages: ['corechart', 'bar']});
			google.charts.setOnLoadCallback(drawBasic);
			function drawBasic() {
				var a = a;	
				var data = google.visualization.arrayToDataTable([
				  ['열람석', '해당 인원수'],
				  ['사용중', useMemberNo],
				  ['부재중', absenceMemberNo],
				  ['미결제', unpaidMemberNo],
				]);
				
				var options = {
				  title: '열람석 통계',
				  chartArea: {width: '50%'},
				  hAxis: {
				    title: '인원수',
				    minValue: 0
				  },
				  vAxis: {
				    title: '열람실 A'
				  }
				};
				
				var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
				
				chart.draw(data, options);
			}
		});
	</script>