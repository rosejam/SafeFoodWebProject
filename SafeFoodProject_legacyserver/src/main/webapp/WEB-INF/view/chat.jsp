<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
/* 메인 */
#mainn {
  margin: auto;
  margin-top: 100px;
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
<body>
	<div id="mainn">
		<!-- Server responses get written here -->
		<div id="messagess"></div>

		<div>
			<input type="text" id="sender" value="${sessionScope.id }"
				style="display: none;"> <input type="text" id="messageinput"
				placeholder="메시지를 입력해주세요.."
				onkeyup="if(event.keyCode==13) {send();}" autofocus>

			<button type="button" onclick="openSocket();">Open</button>
			<button type="button" onclick="send();">Send</button>
			<button type="button" onclick="closeSocket();">Close</button>
		</div>
	</div>
	<!-- websocket javascript -->
	<script type="text/javascript">
		var ws;
		var messages = document.getElementById("messagess");

		function openSocket() {
			if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
				writeResponse("WebSocket is already opened.");
				return;
			}
			//웹소켓 객체 만드는 코드
			ws = new WebSocket("ws://localhost:8080/safefood/echo.do");

			ws.onopen = function(event) {
				if (event.data === undefined)
					return;

				writeResponse(event.data);
			};
			ws.onmessage = function(event) {
				writeResponse(event.data);
			};
			ws.onclose = function(event) {
				writeResponse("Connection closed");
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
</body>
</html>

