<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Cute+Font&family=Diphylleia&family=Dongle:wght@300&family=Hi+Melody&family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>footer</title>
<style>
a:link {
	color: white;
	text-decoration: none;
}

a:visited {
	color: white;
	text-decoration: none;
}

a:hover {
	color: #F28A8A; /* 흰색 글씨로 변경 */
	text-decoration: none; /* 밑줄 제거 */
}

.contents1 {
	margin-top: 20px;
	font-size: 0.9em;
}

.contents1>a {
	text-decoration: none;
	color: white;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	font-size: 0.8em;
=======

>>>>>>> c66e88a01cf6327ad6265949bf21045f7cba7ac7
=======
	font-size: 0.8em;
>>>>>>> goyoung
=======

>>>>>>> goyoung
}

.contents1>h6 {
	color: white;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	font-size: 0.8em;
=======

>>>>>>> c66e88a01cf6327ad6265949bf21045f7cba7ac7
=======
	font-size: 0.8em;
>>>>>>> goyoung
=======
	font-size: 1em;

>>>>>>> goyoung
}

.contents1>h6>a {
	color: white;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	font-size: 0.7em;
=======
	font-size: 0.9em;
>>>>>>> c66e88a01cf6327ad6265949bf21045f7cba7ac7
=======
	font-size: 0.7em;
>>>>>>> goyoung
=======
>>>>>>> goyoung
}

.contents1>a:hover {
	color: white;
}

.contents1>h6>a {
	text-decoration: underline;
}

#foot {
	position: relative;
	top: -10%;
	cursor: pointer;
	width: 1200px;
	height: auto;
}

.contents1>a:hover {
	text-decoration: underline;
}

.contents1>h6{
	font-weight: normal;
}

.contents2>a{
	font-weight: bold;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	font-size: 0.8em;
=======
>>>>>>> c66e88a01cf6327ad6265949bf21045f7cba7ac7
=======
	font-size: 0.8em;
>>>>>>> goyoung
=======
}

.gwang-go {
    background-color: #F5F2ED;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 250px;
>>>>>>> goyoung
}
</style>
</head>
<%
String root = request.getContextPath();
%>
<body>
<<<<<<< HEAD
<<<<<<< HEAD

=======
	<footer>
>>>>>>> c66e88a01cf6327ad6265949bf21045f7cba7ac7
=======
	<footer>
>>>>>>> goyoung

	<!-- 푸터 -->
	<div class="footer_content1">
		<div class="gwang-go content1">
<<<<<<< HEAD
			<img src="<%=root%>/image/mack.jpeg" name="mack" id="mack"
<<<<<<< HEAD
<<<<<<< HEAD
				style="height: 500px;"
=======
				style="width: 100%; height: 500px; margin-top: 40px;"
>>>>>>> c66e88a01cf6327ad6265949bf21045f7cba7ac7
=======
				style="width: 100%; height: 450px; margin-top: 40px;"
>>>>>>> goyoung
				onclick="location.href='https://www.mcdonalds.co.kr/kor/main.do'">
=======
			<img src="<%=root%>/image/footer1.png" name="foot" id="foot"
				onclick="location.href=''">
>>>>>>> goyoung
		</div>
		<div class="contents1" align="center">
			<div class="contents2">
			<a href="#">회사소개</a>&nbsp; <a href="#">지속가능경영</a>&nbsp; <a href="#">IR</a>&nbsp;
			<a href="#">채용정보</a>&nbsp; <a href="#">광고/제휴/출점문의</a>&nbsp; <a
				href="#">이용약관</a>&nbsp; <a href="#">편성기준</a>&nbsp; <a href="#"
				style="text-decoration: underline;"><b>개인정보처리방침</b></a>&nbsp; <a
				href="#">법적고지</a>&nbsp; <a href="#">이메일주소무단수집거부</a>&nbsp; <a
				href="#">윤리경영</a>&nbsp; <a href="#">사이버감사실</a> <br>
			</div>
			<hr style="color: white;">

			<h6>(04323)서울특별시 부산구 두강대로 15길 57, sist몰 7층 (가로동)</h6>
			<h6>
				대표이사 : 장순녕&nbsp;사업자등록번호 : 114-02-34678&nbsp;통신판매업신고번호 :
				2023-서울부산-1955&nbsp; <a href="https://www.youtube.com/@goyoungii"><b
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
					style="font-size: 1.45em;">사업자정보확인</b></a>
=======
					style="font-size: 1.1em;">사업자정보확인</b></a>
>>>>>>> c66e88a01cf6327ad6265949bf21045f7cba7ac7
=======
					style="font-size: 1.45em;">사업자정보확인</b></a>
>>>>>>> goyoung
=======
					style="font-size: 0.95em;">사업자정보확인</b></a>
>>>>>>> goyoung
			</h6>
			<h6>호스팅사업자: SY네트워크&nbsp; 개인정보보호 책임자 : 쌍용구&nbsp;대표이메일 :
				gitmasterx@sy.net</h6>
			<h6>
				<i class="bi bi-award-fill"></i> 3 SINE. All Rights Reserved
			</h6>
		</div>
	</div>
<<<<<<< HEAD
<<<<<<< HEAD
=======
	</footer>
>>>>>>> c66e88a01cf6327ad6265949bf21045f7cba7ac7
=======
	</footer>
>>>>>>> goyoung
</body>