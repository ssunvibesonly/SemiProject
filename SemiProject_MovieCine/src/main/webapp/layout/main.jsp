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
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<title>Main</title>
<%
// 절대경로잡기
String root = request.getContextPath();
%>
</head>
<style>
li {
	list-style: none;
}

.swiper {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: black;
	/* 이미지들을 수평으로 배치 */
	display: flex;
	/* 수직 가운데 정렬 */
	align-items: center;
	/* 수평 가운데 정렬 */
	justify-content: center;
	margin-right: 0px;
}

.swiper-slide img {
	width: 100%;
	max-width: 175px;
	height: auto;
	border-radius: 10px;
	margin: 10px 25px 0px 25px;
}

.swiper-slide {
	/* 이미지 컨테이너의 상대 위치를 설정 */
	position: relative;
	/* 내용이 넘칠 경우 숨김 */
	overflow: hidden;
}

.video-wrap {
	position: relative;
	/* 내용이 넘칠 경우 숨김 */
	overflow: hidden;
	margin-bottom: -10px;
	border-top: 1px solid silver;
}

.video-overlay {
	width: 100%;
	height: 100%;
	/* 내부 요소들을 플렉스 박스로 배치 */
	display: flex;
	/* 내부 요소들을 세로 방향으로 배치 */
	flex-direction: column;
	/* 내부 텍스트를 가운데 정렬 */
	text-align: left;
	color: white;
}

.blind {
	width: 100%;
	height: 50px;
	position: absolute;
	z-index: 1;
	top: 670px;
	background-color: black;
}

#videoname1 {
	font-size: 25pt;
	position: absolute;
	top: 310px;
	left: 140px;
}

#videoname2 {
	font-size: 13pt;
	position: absolute;
	top: 370px;
	left: 140px;
}

#moviechart1 {
	text-decoration: none;
	color: black;
	position: absolute;
	left: 135px;
}

#futuremovie1 {
	text-decoration: none;
	color: black;
	position: absolute;
	left: 300px;
}

#btnall {
	position: absolute;
	right: 115px;
	background-color: white;
	border: 1px solid black;
	font-weight: bold;
	font-size: 0.8em;
	width: 100px;
	border-radius: 20px;
	margin-top: -45px;
	z-index: 2;
}

#btnall:hover {
	background-color: rgba(0, 0, 0, 0.5); /* 투명도가 50%인 검은색 배경 */
	border: 2px solid white;
	color: white;
}

.btnwrap {
	background-color: black;
	/* 내부 요소들을 플렉스 박스로 배치 */
	display: flex;
	/* 요소들을 세로 축에서 가운데로 정렬 */
	align-items: center;
	height: 40px;
	margin-top: 10px;
}

#moviechart1 {
	text-decoration: none;
	color: white;
	position: absolute;
	left: 480px;
	top: 720px;
	z-index: 2;
	margin-top: -5px;
}

#futuremovie1 {
	text-decoration: none;
	color: silver;
	position: absolute;
	left: 670px;
	top: 720px;
	z-index: 2;
	font-weight: normal;
	margin-top: -5px;
}

h5 {
	margin-top: 10px;
	color: white;
}

h5, h6 {
	color: white;
	font-size: 0.7em;
}

.swiper-btn {
	width: 100px;
	font-weight: bold;
	font-size: 0.72em;
}

.swiper-btn:hover {
	opacity: 0.7;
}

#swiper-btn1 {
	margin-bottom: 2px;
	background-color: white;
}

#swiper-btn2 {
	margin-top: 2px;
	background-color: #DF3E49;
	color: white;
}
</style>
<body>
	<!-- 비디오  -->
	<div class=blind></div>
	<div class="video-wrap">
		<div class="video-overlay">
			<strong class="videoname1" id="videoname1">오펜하이머</strong> <span
				class="videoname2" id="videoname2"> THE WORLD FOREVER CHANGES
				<br> 세상을 영원히 바꾸다 8월 15일 대개봉!
			</span>
		</div>
		<div style="margin-top: -70px;">
			<!-- padding-bottom : 16:9 비율의 퍼센트값 56.25%   -->
			<iframe width="100%;" height="600px;"
				src="https://www.youtube.com/embed/oSqK_v6zPoM?mute=1&autoplay=1&controls=0&modestbranding=1&disablekb=1&rel=0&"
				title="YouTube video player" frameborder="0"
				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
				allowfullscreen></iframe>

		</div>
	</div>

	<div class="movie chart wrap">
		<div class="content">
			<div class="btnwrap">
				<h4>
					<a href="#" id="moviechart1"><i
						class="bi bi-bar-chart-line-fill"></i> 무비차트</a>
				</h4>
				<h4>
					<a href="#" id="futuremovie1"><i class="bi bi-film"></i> 상영예정작</a>
				</h4>
				<button type="button" id="btnall" name="btnall"
					class="btn btn-right" onclick="location.href=''">전체보기</button>
			</div>
			<!-- Swiper -->
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<%
                        for (int i = 1; i <= 10; i++) {
                        %>
						<div class="1page" align="center">
							<div style="position: relative; margin-top: 10px;">
								<!-- position 속성 추가 -->
								<img src="<%=root%>/image/movie<%=i%>.jpeg"
									style="width: 200px; height: 240px;"><br>
								<h5 style="color: white; font-size: 0.7em; margin-top: 25px;"><%=i%>.영화제목
								</h5>
								<h6 style="color: white; font-size: 0.7em; margin-bottom: 15px;">좋아요
									99%&nbsp;예매율 56%</h6>
								<div class="hover-buttons"
									style="position: absolute; bottom: 43%; left: 50%; transform: translateX(-50%); display: none;">
									<!-- 상세보기 버튼 -->
									<button class="swiper-btn btn btn-right" data-movie-id="<%=i%>"
										id="swiper-btn1">상세보기</button>
									<!-- 예매하기 버튼 -->
									<button class="swiper-btn btn btn-right" data-movie-id="<%=i%>"
										id="swiper-btn2">예매하기</button>
								</div>
							</div>
						</div>
						<script>
						$(document).ready(function() {
						    $(".1page").hover(function() {
						        $(this).find("img").css({
						            "filter": "brightness(0.5)",
						            "transform": "scale(1.08)",
						            "transition": "0.5s"
						        }); // 호버한 이미지에만 필터와 크기 조절 적용
						        $(this).find(".hover-buttons").fadeIn(10); // 이미지에 호버하면 버튼 보이기
						    }, function() {
						        $(this).find("img").css({
						            "filter": "none",
						            "transform": "scale(1)", // 크기를 원래대로 복원
						            "transition": "0.5s"
						        }); // 호버 해제하면 이미지 필터 원래대로 복원
						        $(this).find(".hover-buttons").fadeOut(10); // 호버 해제하면 버튼 숨기기
						    });
						});
                        </script>
						<%
                        if (i % 5 == 0) {
                        %>
					</div>
					<%
                    }
                    }
                    %>

	<div style="border: 10px solid silver; width: 100%; height: 500px;"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>