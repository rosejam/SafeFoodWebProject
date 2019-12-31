<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

  <title>안전식품 &mdash; Colorlib Template</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel=icon href=/favicon.ico>
<link href=resources/css/app.25649080.css rel=preload as=style>
<link href=resources/js/app.5c658461.js rel=preload as=script>
<link href=resources/js/chunk-vendors.6240f7ba.js rel=preload as=script>
<link href=resources/css/app.25649080.css rel=stylesheet>
<!-- Optional theme -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


  <link rel="stylesheet" href="resources/css/magnific-popup.css">
  <link rel="stylesheet" href="resources/css/jquery-ui.css">
  <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

  
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['칼로리',  1 ],
          ['탄수화물',    2],
          ['지방',  3 ],
          ['콜레스트롤', 4 ],
          ['포화지방산',  5],
          ['당류', 6 ],
          ['당류', 7 ],
          ['단백질',8 ]
        ]);

        var options = {
          title: '영양정보'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
</head>

<body>
   <div class="w3-top">
		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
			<a href="#home" class="w3-bar-item w3-button"><b>Safe</b> Foods</a>
			<!-- Float links to the right. Hide them on small screens -->
			<div class="w3-right w3-hide-small">
				<a href="list.food" class="w3-bar-item w3-button">Main</a> <a
					href="listBoard.do" class="w3-bar-item w3-button">Notice</a>
				<c:if test="${not empty id }">
					<a href="myfood.food" class="w3-bar-item w3-button">Myfood</a>
				</c:if>
				<c:if test="${not empty id }">
					<a href='' class="w3-bar-item w3-button">Welcome, ${id }!!!</a>
					<a href='logout.food'><button class="w3-bar-item w3-button">Logout</button></a>
					<a href='mypage.food'><img id='user'
						src='resources/images/user.PNG' class="w3-bar-item w3-button"
						size=2></a>
				</c:if>

				<c:if test="${empty id }">
					<a href='safefood/login.food' class="w3-bar-item w3-button">Login</a>
					<a href=insert.food class="w3-bar-item w3-button">Sign in</a>
				</c:if>
			</div>
		</div>
	</div>
	<header class="w3-display-container w3-content w3-wide"
		style="max-width: 1500px;" id="home">
		<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> 
		<div class="w3-display-middle w3-margin-top w3-center">
			<h1 class="w3-xxlarge w3-text-white">
				<span class="w3-padding w3-black w3-opacity-min"><b>My food</b></span>
			</h1>
		</div>
	</header>
      <div class="container">
        <div class="row">
	   		<div id='container'>
	       		Name : <h1 id='name'>${b.name }</h1>
	       		Maker : <h1 id='maker'>${b.maker}</h1><br><br>
	          	<hr>
	          	<div class='container'>
	          		<div id='image1'><img src="resources/${b.img}"   id='first_image'/></div>	
		          	<div id='infoname'>1회 제공량    <h1>${b.supportpereat}</h1> </div>
		          	<div id='infoname'>칼로리  <h1>${b.calory}  </h1></div>
		          	<div id='infoname'>원료  <h3>${b.material} </h3></div>
		          	
		          	<div id='info'>	</div>
		          	<div id='info'> </div>
	          	</div>
	        </div>
	        </div>
        
		<p><button class="btn btn-info"><a href='deletefood.food?code=${b.code }'>삭제</a></button>
        <!-- <button class="btn btn-info"><a href='#'>찜삭제</a></button></p> -->
      </div>

		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-9 col-md-9">
					<div id="piechart" style="width: 700px; height: 700px;"></div>
				</div>
			</div>
		</div>
		<footer class="site-footer">
      <div class="container">
        <div class="row">

          <div class="col-md-10 col-lg-3">
            <div class="block-5 mb-5">
              <h3 class="footer-heading mb-4">Contact Info</h3>
              <ul class="list-unstyled">
                <li class="address">(SSAFY) 서울시 강남구 테헤란로 멀티스퀘어 </li>
                <li class="phone">1544 - 9001</a></li>
                <li class="email"><a href="email:admin@ssafy.com">admin@ssafy.com</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
  </div>
</body>

</html>