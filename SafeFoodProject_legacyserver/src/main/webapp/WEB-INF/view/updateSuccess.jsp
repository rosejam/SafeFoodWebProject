<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Font Icon -->
    <link rel="stylesheet" href="resources/fonts/material-icon/css/material-design-iconic-font.min.css">
    <!-- Main css -->
    <link rel="stylesheet" href="resources/css/register_css/style.css">
    
  	<script type="text/javascript">
	
	</script>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<body>

    <div class="main">

        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <img src="resources/images/ssafy.PNG" alt="My Image" width="200" height="200" >
                        <h2 class="form-title">회원정보 수정 확인</h2>
							  <table border="1">
								<tr>
									<td><h2>아이디</h2></td><td>${updateMember.id }</td>
								</tr>
								<tr>
									<td><h2>몸무게</h2></td><td>${updateMember.weight }</td>
								</tr>
								<tr>
									<td><h2>알러지 정보</h2></td><td>${updateMember.alergy }</td>
								</tr>	
								
							</table>
                        <div class="form-group">
                            <a href= list.food>
                            <input type="submit" name="submit" id="submit" class="form-submit" value="확인"/></a>
                        </div>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="resources/js/register.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>