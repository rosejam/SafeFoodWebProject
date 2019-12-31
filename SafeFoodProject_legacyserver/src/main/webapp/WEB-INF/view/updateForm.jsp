<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>
    <!-- Font Icon -->
    <link rel="stylesheet" href="resources/fonts/material-icon/css/material-design-iconic-font.min.css">
    <!-- Main css -->
    <link rel="stylesheet" href="resources/css/register_css/style.css">
    
    
  	<script type="text/javascript">
	function findaddress(){
		open("addressSearch.html" , "width =400px height = 400px");
		
	}  	

	</script>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<body>

    <div class="main">

        <section class="signup">
            <div class="container">
                <div class="signup-content">
                
                    <form action="updateProcess.food" method="POST" id="signup-form" class="signup-form">
                    <img src="resources/images/ssafy.PNG" alt="My Image" width="200" height="200" >
                        <h2 class="form-title">회원가입</h2>
                          <div class="form-group">
                           
                        </div>
                        
                        <div class="form-group">
                            <input type="text" class="form-input" name="weight" id="weight" placeholder="몸무게"/>
                        </div>
                            
                       	 	<div class="form-group">
							<input type="checkbox" name="alergy" id="agree-term" value="두유"
								class="agree-term" /> <label for="agree-term"
								class="label-agree-term"><span><span></span></span>두유</label> <input
								type="checkbox" name="alergy" id="agree-term1" value="콩"
								class="agree-term1" /> <label for="agree-term1"
								class="label-agree-term"><span><span></span></span>콩 </label> <input
								type="checkbox" name="alergy" id="agree-term2" value="새우"
								class="agree-term2" /> <label for="agree-term2"
								class="label-agree-term"><span><span></span></span>새우 </label> <input
								type="checkbox" name="alergy" id="agree-term3" value="우유"
								class="agree-term3" /> <label for="agree-term3"
								class="label-agree-term"><span><span></span></span>우유 </label> <input
								type="checkbox" name="alergy" id="agree-term4" value="땅콩"
								class="agree-term4" /> <label for="agree-term4"
								class="label-agree-term"><span><span></span></span>땅콩 </label> <input
								type="checkbox" name="alergy" id="agree-term5" value="게"
								class="agree-term5" /> <label for="agree-term5"
								class="label-agree-term"><span></span>게 </label> <input
								type="checkbox" name="alergy" id="agree-term6" value="쑥"
								class="agree-term6" /> <label for="agree-term6"
								class="label-agree-term"><span><span></span></span>쑥 </label> <input
								type="checkbox" name="alergy" id="agree-term7" value="돼지고기"
								class="agree-term7" /> <label for="agree-term7"
								class="label-agree-term"><span><span></span></span>돼지고기
							</label> <input type="checkbox" name="alergy" id="agree-term8"
								value="계란흰자" class="agree-term8" /> <label for="agree-term8"
								class="label-agree-term"><span><span></span></span>계란흰자
							</label> <input type="checkbox" name="alergy" id="agree-term9"
								value="닭고기" class="agree-term9" /> <label for="agree-term9"
								class="label-agree-term"><span><span></span></span>닭고기 </label>

							<input type="checkbox" name="alergy" id="agree-term10" value="연어"
								class="agree-term10" /> <label for="agree-term10"
								class="label-agree-term"><span><span></span></span>연어 </label> <br>
							<input type="checkbox" name="alergy" id="agree-term11"
								class="agree-term11" /> <label for="agree-term11"
								class="label-agree-term"><span><span></span></span>알레르기
								없음 </label>

						</div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="수정 완료" />
                        </div>
                    </form>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="resources/js/register.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>