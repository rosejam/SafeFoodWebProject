<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel=icon href=/favicon.ico>
<link href=resources/css/app.42b92694.css rel=preload as=style>
<link href=resources/js/app.8b3f3818.js rel=preload as=script>
<link href=resources/js/chunk-vendors.6240f7ba.js rel=preload as=script>
<link href=resources/css/app.42b92694.css rel=stylesheet>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="resources/js/jquery.ajax-cross-origin.min.js"></script>
<!-- 크로스도메인 해결 플러그인 -->
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

/* Button used to open the chat form - fixed at the bottom of the page */
.open-button {
	background-color: #555;
	color: white;
	padding: 20px;
	border: none;
	text-align: center;
	cursor: pointer;
	opacity: 0.8;
	position: fixed;
	display: inline-block;
	bottom: 23px;
	right: 28px;
	border-radius: 50%;
}

/* The popup chat - hidden by default */
.chat-popup {
	display: none;
	position: fixed;
	bottom: 0;
	right: 15px;
	border: 3px solid #f1f1f1;
	z-index: 9;
	border-radius: 20px;
}

/* Add styles to the form container */
.form-container {
	min-width: 500px;
	background-color: white;
	padding: 10px;
}

/* Full-width textarea */
.form-container textarea {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	border: none;
	background: #f1f1f1;
	resize: none;
}

/* When the textarea gets focus, do something */
.form-container textarea:focus {
	background-color: #ddd;
	outline: none;
}

/* Set a style for the submit/send button */
.chat-popup .btn {
	background-color: #4CAF50;
	color: white;
	padding: 0px;
	border: none;
	cursor: pointer;
	width: 10%;
	margin-bottom: 0px;
	opacity: 0.8;
	float: right;
}

.chat-popup #butt {
	clear: right;
}
/* Add a red background color to the cancel button */
.form-container .cancel {
	background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
	opacity: 1;
}

/* 메인 */
#mainn {
	margin: auto;
	margin-top: 0px;
	border-radius: 20px;
	background-color: lightblue;
	text-align: center;
	width: 500px;
	height: 800px;
}
/* 채팅 영역 */
#messagess {
	height: 90%;
	width: 100%;
	overflow-y: auto;
}
</style>
</head>
<script type="text/javascript">
	$(document).ready(function(){    
	    $.ajax({
	        crossOrigin: true,    // 크로스도메인 해결 플러그인
	        url: 'http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1168064000',
	        dataType: 'xml',
	        success: function(response){
	            console.log(response);
	            
	            var city = $(response).find('category').text();
	            $('#weathercontainer').append(city + '<br>');
	            var i = 1;
	            $(response).find('data').each(function(){
	                var day = $(this).find('day').text();
	                var dayTxt = "오늘";
	                var hour = $(this).find('hour').text(); //시간
	                var wfKor = $(this).find('wfKor').text(); //구름,비,날씨맑음 등등
	                if(wfKor.indexOf("구름") != -1) { //"구름이 있으면 "
	                	  document.getElementById("weatherimage"+i).src = "resources/images/cloudy.jpg";
	                }else if(wfKor.indexOf("흐림") != -1) {
	                	document.getElementById("weatherimage"+i).src = "resources/images/cloudy.jpg";
	                }else if(wfKor.indexOf("맑음") != -1) {
	                	document.getElementById("weatherimage"+i).src = "resources/images/sunny.jpg";
	                }else if(wfKor.indexOf("비") != -1) {
	                	document.getElementById("weatherimage"+i).src = "resources/images/rain.jpg";
	                }else if(wfKor.indexOf("눈") != -1) {
	                	document.getElementById("weatherimage"+i).src = "resources/images/snowing.jpg";
	                }
	                var temp = $(this).find('temp').text(); // 현재온도 
	                var tmx = $(this).find('tmx').text(); //최고기온 
	                var pop = $(this).find('pop').text(); // 강수확률 
	                if(day == 1) { var dayTxt = "내일"; }
	                if(day == 2) { var dayTxt = "모레"; }
	                var output = dayTxt + " " + hour + "시" ;
			        var output1 = pop + " " + "%";        
	                var output2 =  wfKor + " " ;
	                var output2 =  "온        도 : " + temp + "도" ;
	                var output3 =  "최고기온 : " + tmx  + "도";
	                
	                $('#today' + i).append(output + '<br>');
	                $('#rain' + i).append(output1);
	                $('#weather' + i).append(output2 + '<br>');
	                $('#weather' + i).append(output3 + '<br>');
	                i = i + 1;
	                if( i < 5) return true;
	                else return false;
	            })
	        }
	    })
	});

</script>

<body>

	<!-- Navbar (sit on top) -->
	<div class="w3-top">
		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
			<a href="#home" class="w3-bar-item w3-button"><b>Safe</b> Foods</a>
			<!-- Float links to the right. Hide them on small screens -->
			<div class="w3-right w3-hide-small">
				<a href="#products" class="w3-bar-item w3-button">Products</a> <a
					href="#best" class="w3-bar-item w3-button">Best</a><a href="#qna"
					class="w3-bar-item w3-button">Q & A</a><a href="listBoard.do"
					class="w3-bar-item w3-button">Notice</a>
				<c:if test="${not empty id }">
					<span> <a href="myfood.food" class="w3-bar-item w3-button">Myfood</a>
					</span>
				</c:if>
				<c:if test="${not empty id }">
					<span class="w3-bar-item w3-button">Welcome, ${id }!!!</span>
					<a href='logout.food'><button class="w3-bar-item w3-button">Logout</button></a>
					<a href='mypage.food'><img id='user'
						src='resources/images/user.PNG' class="w3-bar-item w3-button"></a>
				</c:if>

				<c:if test="${empty id }">


					<a href='login.food' class="w3-bar-item w3-button">Login</a>
					<a href=insert.food class="w3-bar-item w3-button">Sign up</a>

				</c:if>
			</div>
		</div>
	</div>

	<!-- Header -->
	<header class="w3-display-container w3-content w3-wide"
		style="max-width: 1500px;" id="home">
		<img class="w3-image" src="resources/images/main.jpg"
			alt="Architecture" style="min-width: 100%;">
		<div class="w3-display-middle w3-margin-top w3-center">
			<h1 class="w3-xxlarge w3-text-white">
				<span class="w3-padding w3-black w3-opacity-min"><b>Safe
						Foods</b></span>
			</h1>
		</div>
		<br> <br> <br> <br>
	</header>


	<!-- Page content -->
	<div class="w3-content w3-padding" style="max-width: 1564px">

		<div class="w3-container w3-padding-32" id="weather">
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Weather</h3>
			<p id="weathercontainer"></p>
		</div>

		<div class="w3-row-padding w3-grayscale">
			<div class="w3-col l3 m6 w3-margin-bottom">
				<center>
					<img id="weatherimage1" src="" style="width: 250px; height: 250px;">
					<!-- <img src="/w3images/team2.jpg" alt="John" style="width:100%"> -->
					<h3 id="today1"></h3>
					<p class="w3-opacity" id="rain1"></p>
					<p id="weather1"></p>
				</center>
			</div>
			<div class="w3-col l3 m6 w3-margin-bottom">
				<center>
					<img id="weatherimage2" src="" style="width: 250px; height: 250px;">
					<h3 id="today2"></h3>
					<p class="w3-opacity" id="rain2"></p>
					<p id="weather2"></p>
				</center>
			</div>
			<div class="w3-col l3 m6 w3-margin-bottom">
				<center>
					<img id="weatherimage3" src="" style="width: 250px; height: 250px;">
					<h3 id="today3"></h3>
					<p class="w3-opacity" id="rain3"></p>
					<p id="weather3"></p>
				</center>
			</div>
			<div class="w3-col l3 m6 w3-margin-bottom">
				<center>
					<img id="weatherimage4" src="" style="width: 250px; height: 250px;">
					<h3 id="today4"></h3>
					<p class="w3-opacity" id="rain4"></p>
					<p id="weather4"></p>
				</center>
			</div>
		</div>
		<!-- Project Section -->
		<div class="w3-container w3-padding-32" id="products">
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Products</h3>
			<form method="post" action="search.food">
				<select name="condition" id="condition">
					<option value="name">name</option>
					<option value="maker">maker</option>
					<option value="material">material</option>
					<option value="calorie">calorie</option>
				</select> <input type="text" name="word" id="word"> <input
					type="submit" value="search" id="search">
			</form>
		</div>
		
		<table>
			<c:forEach items="${foodList }" var="c">
				<tr bgcolor=pink>

					<td align=center bgcolor=white><a
						href="detail.food?code=${c.code }"><img
							src="resources/${c.img }" id="first_image" style="width: 40%" /></a>
					<td align=center bgcolor=white><font color="black" size="5">${c.code }</font></td>
					<td align=center bgcolor=white><font color="black" size="3">
							<a href="detail.food?code=${c.code }"><font color="black"
								size="3">${c.name }</a>
					</font></font></td>
					<td align=center bgcolor=white><font color="black" size="3">1일
							칼로리 양: ${c.supportpereat }</font></td>

					<td align=center bgcolor=white><font color="black" size="3">칼로리
							: ${c.calory }</font></td>

					<td align=center bgcolor=white><font color="black" size="3">탄수화물
							: ${c.carbo }</font></td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- pagination{s} -->
		
		<script type="text/javascript">

//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/list.food";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;

	}

  //페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/list.food";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/list.food";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

</script>



		
		
			<div id="paginationBox">
				<center><ul class="pagination">	
					<c:if test="${pagination.prev}">
						<button class="w3-bar-item w3-button"><a class="page-link" href="#"
							onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')" >Previous</a></button>
					</c:if>
					<c:forEach begin="${pagination.startPage}"
						end="${pagination.endPage}" var="idx">
						<button
							class="w3-bar-item w3-button" <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
							class="page-link" href="#"
							onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
								${idx} </a></button>
					</c:forEach>
					<c:if test="${pagination.next}">
						<button class="w3-bar-item w3-button"><a class="page-link" href="#"
							onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></button>
					</c:if>
				</ul></center>
			</div>

			<!-- pagination{e} -->
		
		
		<!-- About Section -->
		<div class="w3-container w3-padding-32" id="best">
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Best</h3>
			<p>Most searched foods top4</p>
		</div>

		<table>
			<th><i>Top1</i></th>
			<th><i>Top2</i></th>
			<th><i>Top3</i></th>
			<th><i>Top4</i></th>
			<tr bgcolor=pink>
				<c:forEach items="${sortlist }" var="c">

					<td align=center bgcolor=white>
						<p>
						</div> <a href="detail.food?code=${c.code }"><img
							src="resources/${c.img }" id="first_image" style="width: 40%" /></a>
						</p>
						<p class="w3-col l3 m6 w3-margin-bottom">
						<h3></h3> <br>
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
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Q
				& A</h3>
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
			<%@ include file="index.html" %>
		</div>
		<!-- Image of location/map -->
		<!-- <div class="w3-container">

</div> -->
		<!-- End page content -->

	</div>



	<button class="open-button" onclick="openForm()">Chat</button>
	<div class="chat-popup" id="myForm">

			<div id="butt">
				<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
			</div>

			<!-- 			<label for="msg"><b>Message</b></label>
			<textarea placeholder="Type message.." name="msg" required></textarea> -->

			<!-- <button type="submit" class="btn">Send</button> -->

			<div id="mainn">
				<!-- Server responses get written here -->
				<div id="messagess"></div>

				<div>
					<input type="text" id="sender" value="${sessionScope.id }"
						style="display: none;"> <input type="text"
						id="messageinput" placeholder="메시지를 입력해주세요.."
						onkeyup="if(event.keyCode==13) {send();}"><!-- autofocus -->

					<!-- <button type="button" onclick="openSocket();">Open</button> -->
					<button type="button" onclick="send();">Send</button>
					<!-- <button type="button" onclick="closeSocket();">Close</button> -->
				</div>
			</div>

		
	</div>
	<script type="text/javascript">

		var ws;
		var messages = document.getElementById("messagess");
		
		function openForm() {
			document.getElementById("myForm").style.display = "block";
			openSocket();
			
		}

		function closeForm() {
			document.getElementById("myForm").style.display = "none";
			//closeSocket();
		}

		function openSocket() {
			if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
				//writeResponse("WebSocket is already opened.");
				return;
			}
			//웹소켓 객체 만드는 코드
			ws = new WebSocket("ws://70.12.108.208:8080/safefood/echo.do");

			ws.onopen = function(event) {
				if (event.data === undefined)
					return;

				writeResponse(event.data);
			};
			ws.onmessage = function(event) {
				writeResponse(event.data);
			};
			ws.onclose = function(event) {
				//writeResponse("Connection closed");
			}
		}

		function send() {
			var text = document.getElementById("messageinput").value + ","
					+ document.getElementById("sender").value;
			ws.send(text);
			document.getElementById("messageinput").value = "";
		}

		function closeSocket() {
			ws.close();
		}
		function writeResponse(text) {
			messages.innerHTML += "<br/>" + text;
			messages.scrollTop = messages.scrollHeight;
		}
	</script>
	
	<!-- Footer -->
	<div>
		<footer class="w3-center w3-black w3-padding-16">
			<p>
				<a class="w3-hover-text-green">
					<div class="col-md-10 col-lg-3">
						<div class="block-5 mb-5">
							<ul class="list-unstyled">
								<a class="address">(SSAFY) 서울시 강남구 테헤란로 멀티스퀘어 </a>
								<a class="phone">1544 - 9001</a>
								<a class="email"><a href="email:admin@ssafy.com">admin@ssafy.com</a>
							</ul>
						</div>
					</div>
				</a>
			</p>
		</footer>
	</div>

</body>
</html>