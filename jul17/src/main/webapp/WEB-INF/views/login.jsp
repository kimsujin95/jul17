<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/login.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script type="text/javascript">
// 스크립트 영역
let text = "<p>올바른 아이디를 입력하세요.</p>"; //전역변수
//호이스팅이 뭐예요? let vs var? json? const ajax
		
function checkID() {
//	alert("!");
	let msg = document.getElementById("msg"); // 지역변수
	msg.innerHTML += "<p>" + document.getElementById("id").value + " 아이디를 변경했습니다.</p>"
}
	
function check(){
//   alert("msg");
	let msg = document.getElementById("msg");
	let id = document.getElementById("id");
//	   alert(id.value); // 1234
//	   alert(id.value.length); // 4
	if (id.value.length <= 4) {
		alert("아이디는 4글자 이상이어야 합니다.");
	   	msg.innerHTML = text;
	   	id.focus();
	   	return false; // 이동하겠습니다.
	}
   
	let pw = document.getElementById("pw");
   
	if (pw.value.length <= 4) {
	   	alert("암호는 4글자 이상이어야 합니다.");
	   	pw.focus();
   	   	return false; // 이동하겠습니다.
   	}
}

const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
  container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
  container.classList.remove("right-panel-active");
});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<h1>꿀벌 티모의 모험</h1>
	<%-- <%=request.getHeader("User-Agent") %> --%>
	<br>
	<br>
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="#">
				<h1>Create Account</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your email for registration</span> <input type="text"
					placeholder="Name" /> <input type="text" placeholder="Id" /> <input
					type="password" placeholder="Password" />
				<button>Sign Up</button>
			</form>
		</div>
		<div class="form-container sign-in-container">
			<form action="./login" method="post" onsubmit="return check()">
				<h1>Sign in</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your account</span> 
				<input type="text" name="id" id="id" placeholder="Id" required="required" maxlength="10" onchange="checkID()"/> 
				<input type="password" name="pw" id="pw" placeholder="Password" required="required" maxlength="15" /> 
				<a href="#">Forgot your password?</a>
				<button type="submit" class="login">Sign In</button>
				<span id="msg"></span>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To keep connected with us please login with your personal
						info</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>Enter your personal details and start journey with us</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>