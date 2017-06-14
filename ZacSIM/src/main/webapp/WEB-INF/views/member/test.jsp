<!DOCTYPE html>
<html>
<head>
  <style>
div.out { width:40%; height:120px; margin:0 15px;
          background-color:#D6EDFC; float:left; }
div.in {  width:60%; height:60%; 
          background-color:#FFCC00; margin:10px auto; }
p { line-height:1em; margin:0; padding:0; }
</style>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
  
<div class="out overout">
  <span>move your mouse</span>
  <div class="in">
  </div>
</div>

<div class="out enterleave">
  <span>move your mouse</span>
  <div class="in">
  </div>
</div>

<script>
  var i = 0;
  $("member").mouseover(function() {
    i += 1;
    $(this).find("span").text( "mouse over x " + i );
  }).mouseout(function(){
    $(this).find("span").text("mouse out ");
  });

  var n = 0;
  $("seattime").mouseenter(function() {
    n += 1;
    $(this).find("span").text( "mouse enter x " + n );
  }).mouseleave(function() {
    $(this).find("span").text("mouse leave");
  });
</script>

</body>
</html>