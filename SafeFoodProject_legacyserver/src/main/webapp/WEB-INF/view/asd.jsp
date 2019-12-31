<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html><head>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel=icon href=/favicon.ico>
<link href=resources/css/app.25649080.css rel=preload as=style>
<link href=resources/js/app.5c658461.js rel=preload as=script>
<link href=resources/js/chunk-vendors.6240f7ba.js rel=preload as=script>
<link href=resources/css/app.25649080.css rel=stylesheet>
</head>
<body>

	<!-- Navbar (sit on top) -->
	<div class="w3-top">
		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
			<a href="#home" class="w3-bar-item w3-button"><b>Safe</b>
				Foods</a>
			<!-- Float links to the right. Hide them on small screens -->
			<div class="w3-right w3-hide-small">
				<a href="#products" class="w3-bar-item w3-button">Products</a> <a
					href="#best" class="w3-bar-item w3-button">Best</a><a
					href="#qna" class="w3-bar-item w3-button">Q & A</a><a
					href="safefood/listBoard.do" class="w3-bar-item w3-button">Notice</a> 
					<c:if test="${not empty id }">
               <a href="myfood.food">Myfood</a>
				</c:if>
				 <c:if test="${not empty id }">
				Welcome, ${id }!!!
				<a href='safefood/logout.food'><button class="btn btn-danger btn-sm">Logout</button></a>
				<a href='mypage.food'><img id='user' src='resources/images/user.PNG'></a>
				</c:if>
				
				<c:if test="${empty id }">
				<a href='safefood/login.food' class="w3-bar-item w3-button">Login</a>
				<a href=insert.food class="w3-bar-item w3-button">Sign in</a>
				</c:if>
			</div>
		</div>
	</div>

	<!-- Header -->
	<header class="w3-display-container w3-content w3-wide"
		style="max-width: 1500px;" id="home">
		<img class="w3-image" src="resources/images/main.jpg"
			alt="Architecture" width="1500" height="800">
		<div class="w3-display-middle w3-margin-top w3-center">
			<h1 class="w3-xxlarge w3-text-white">
				<span class="w3-padding w3-black w3-opacity-min"><b>Safe Foods</b></span>
			</h1>
		</div>
	</header>

	<!-- Page content -->
	<div class="w3-content w3-padding" style="max-width: 1564px">
		



		<!-- Project Section -->
		<div class="w3-container w3-padding-32" id="products">
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Products</h3>
			
     			<form method="post" action="safefood/search.food">
				<select name="condition" id="condition">
				<option value="name">name</option>
				<option value="maker">maker</option>
				<option value="material">material</option>
				<option value="calorie">calorie</option>
				</select>
				<input type="text" name="word" id="word" >
				<input type="submit" value="search" id="search">
				</form>
		
			
		</div>
		
		<table>
			<c:forEach items="${list }" var="c">
					<tr bgcolor=pink>
			
				<td align=center bgcolor=white> 
					<a href="detail.food?code=${c.code }"><img src="resources/${c.img }"  id="first_image" style="width:40%" /></a>
					<td align=center bgcolor=white> <font color="black" size="5">${c.code }</font></td>
					<td align=center bgcolor=white> <font color="black" size="3">
					<a href="detail.food?code=${c.code }"><font color="black" size="3">${c.name }</a></font></font>
					</td>
					<td align=center bgcolor=white> <font color="black" size="3">1일 칼로리 양: ${c.supportpereat }</font></td>
			
					<td align=center bgcolor=white> <font color="black" size="3">칼로리 : ${c.calory }</font></td>
			
					<td align=center bgcolor=white> <font color="black" size="3">탄수화물 : ${c.carbo }</font></td> 
					</tr>
				</c:forEach>
  </table>
<!-- About Section -->
  <div class="w3-container w3-padding-32" id="best">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Best</h3>
    <p>Most searched foods top4</p>
  </div>

    <table >
  	<th><i>Top1</i></th>
  	<th><i>Top2</i></th>
  	<th><i>Top3</i></th>
  	<th><i>Top4</i></th>
					<tr bgcolor=pink>
      			<c:forEach items="${sortlist }" var="c">
			
				<td align=center bgcolor=white> 
					<p></div><a href="detail.food?code=${c.code }"><img src="resources/${c.img }"  id="first_image" style="width:40%"  /></a></p>
					<p class="w3-col l3 m6 w3-margin-bottom">
      <h3></h3><br>
      <p class="w3-opacity">${c.name }</p>
    </p>
					
					</td>
					
				</c:forEach>
				</tr>
		</table>
  	 <!-- <div class="w3-row-padding w3-grayscale">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="/w3images/team2.jpg" alt="John" style="width:100%">
      <h3>John Doe</h3>
      <p class="w3-opacity">CEO & Founder</p>
      <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="/w3images/team1.jpg" alt="Jane" style="width:100%">
      <h3>Jane Doe</h3>
      <p class="w3-opacity">Architect</p>
      <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="/w3images/team3.jpg" alt="Mike" style="width:100%">
      <h3>Mike Ross</h3>
      <p class="w3-opacity">Architect</p>
      <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="/w3images/team4.jpg" alt="Dan" style="width:100%">
      <h3>Dan Star</h3>
      <p class="w3-opacity">Architect</p>
      <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
  </div> -->
  	

  <!-- Contact Section -->
  <div class="w3-container w3-padding-32" id="qna">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Q & A</h3>
   <!--  <form action="/action_page.php" target="_blank">
      <input class="w3-input w3-border" type="text" placeholder="Name"
									required name="Name">
      <input class="w3-input w3-section w3-border" type="text"
									placeholder="Email" required name="Email">
      <input class="w3-input w3-section w3-border" type="text"
									placeholder="Subject" required name="Subject">
      <input class="w3-input w3-section w3-border" type="text"
									placeholder="Comment" required name="Comment">
      <button class="w3-button w3-black w3-section" type="submit">
        <i class="fa fa-paper-plane"></i> SEND MESSAGE
      </button>
    </form> -->
 <div id=app></div>
	<script src=resources/js/chunk-vendors.6240f7ba.js></script>
	<script src=resources/js/app.5c658461.js></script>
  </div>
<!-- Image of location/map -->
<!-- <div class="w3-container">

</div> -->
<!-- End page content -->

</div>


<!-- Footer -->
<div>
<footer class="w3-center w3-black w3-padding-16">
  <p> <a class="w3-hover-text-green"> 
  		<div class="col-md-10 col-lg-3">
            <div class="block-5 mb-5">
              <ul class="list-unstyled">
                <a class="address">(SSAFY) 서울시 강남구 테헤란로 멀티스퀘어 </a>
                <a class="phone">1544 - 9001</a>
                <a class="email"><a href="email:admin@ssafy.com">admin@ssafy.com</a>
              </ul>
            </div>
          </div></a>
		</p>
</footer></div>

</body>
</html>