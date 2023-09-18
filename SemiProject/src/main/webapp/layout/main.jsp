<%@page import="Dto.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.MovieDao"%>
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
<title>main</title>
<%
// 절대경로잡기
String root = request.getContextPath();
%>
</head>
<style>
body {
	background-color: black;
}

li {
	list-style: none;
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
	max-width: 165px;
	height: 100%;
	max-height: 250px;
	border-radius: 10px;
	margin: 30px 50px 0px 50px;
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
	width: 10%;
	height: 80%;
	position: absolute;
	z-index: 1;
	top: 70%;
	right: 0%;
	background-color: black;
	margin-right: 10px;
}

#videoname1 {
	font-size: 23pt;
	position: absolute;
	top: 58%;
	left: 22%;
}

#videoname2 {
	font-size: 12pt;
	position: absolute;
	top: 66%;
	left: 22%;
}

#btnall1 {
	position: absolute;
	right: 0%;
	top: 3%;
	background-color: white;
	border: 1px solid black;
	border-radius: 20px;
	font-weight: bold;
	font-size: 0.9em;
	width: 100px;
	height: 40px;
	margin-top: -8px;
	z-index: 2;
}

#btnall2 {
	position: absolute;
	right: 13.45%;
	top: 47.5%;
	background-color: white;
	border: 1px solid black;
	border-radius: 20px;
	font-weight: bold;
	font-size: 0.9em;
	width: 100px;
	height: 40px;
	z-index: 3;
}

#btnall1:hover {
	background-color: rgba(0, 0, 0, 0.5); /* 투명도가 50%인 검은색 배경 */
	border: 2px solid white;
	color: white;
}

#btnall2:hover {
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
	width: 73.2%;
	position: relative;
	left: 13.4%;
	right: 13.4%;
}

#moviechart1 {
	text-decoration: none;
	color: white;
	z-index: 2;
	margin-top: -5px;
	width: 150px;
}

#futuremovie1 {
	text-decoration: none;
	color: silver;
	z-index: 2;
	font-weight: normal;
	margin-top: -5px;
	position: relative;
	left: 20px;
	width: 150px;
}

.content {
	width: 100%;
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

#swiper-btn1>a {
	color: black;
}

#swiper-btn2 {
	margin-top: 2px;
	background-color: #DF3E49;
	color: white;
}

.special_hall_contents {
	position: absolute;
	right: 13.2%;
	left: 13.2%;
	width: 73.6%;
	top: 54%;
	height: 45%;
}

.special_special {
	position: relative;
	left: 13.5%;
	top: 8.6%;
	color: white;
	font-size: 24px;
}

.special_result {
	position: absolute;
	width: 50%;
	height: 100%;
}

.special_result img {
	max-width: 95%; /* 이미지의 최대 가로 크기를 100%로 설정 */
	max-height: 100%; /* 이미지의 최대 세로 크기를 100%로 설정 */
	height: 100%;
	width: 100%;
	border-radius: 20px;
}

.special_select {
	position: absolute;
	margin-left: 52%;
	width: 48%;
	height: 100%;
}

.special_select ul {
	width: 100%;
	height: 100%;
	padding: 0;
	display: flex;
	flex-direction: column; /* 요소들을 세로로 배치 */
	justify-content: space-between; /* 요소들을 위 아래로 균등하게 배치 */
}

.special_select li {
	flex-grow: 1; /* 각 아이템의 높이를 균등하게 설정 */
	color: white;
	list-style: none;
	text-align: left;
	padding-left: 50px;
	padding-top: 24px;
	font-size: 16pt;
}

.fixedbtn1 {
    position: fixed;
    width: 150px;
    height: 60px;
    bottom: 10%;
    right: 15%;
    background-color: #DF3E49;
    color: white;
    border-radius: 30px;
    text-align: center;
    z-index: 3;
    font-size: 15pt;
    font-variant: bold;
    text-decoration: none;
    padding: 15px;
    display: none;  /* 초기에는 숨김 */
}

.fixedbtn1:hover{
	color: white;
}

.fixedbtn2 {
    position: fixed;
    width: 60px;
    height: 60px;
    bottom: 10%;
    right: 10%;
    background-color: white;
    color: white;
    border-radius: 50px;
    text-align: center;
    box-shadow: 2px 2px 3px #999;
    z-index: 3;
    display: none; /* 초기에는 숨김 */
}

.fixedbtn2-2 {
	position:absolute;
	top:5px;
	right: 13px;
    color: black;
    height: 60px;
    font-size: 25pt;
    opacity: 0.7;
}

</style>
<body>
<%
MovieDao dao = new MovieDao();

List <MovieDto> list=dao.getAllMovieInfo();

%>

	<!-- 고정 버튼 -->
	
	<!-- 예매하기 버튼 -->
	<a href="<%=root%>/index.jsp?main=Movie_reserve/movielist.jsp" class="fixedbtn1">예매하기</a>
	
	<!-- 상단바 이동 -->
	<a href="#" class="fixedbtn2">
	<i class="bi bi-arrow-up fixedbtn2-2"></i>
	</a>

	<script>
	// 고정 버튼을 가져옵니다.
	var fixedBtn1 = document.querySelector(".fixedbtn1");

	var fixedBtn2 = document.querySelector(".fixedbtn2");

	// 스크롤 이벤트를 감지하는 함수
	function handleScroll() {
	    // 현재 스크롤 위치를 가져옵니다.
	    var scrollY = window.scrollY || document.documentElement.scrollTop;

	    // 여기에서 헤더의 높이를 지정하세요. 헤더가 화면에 나타날 때까지의 스크롤 양입니다.
	    var headerHeight = 200; // 예: 200px로 가정

	    // 스크롤 위치가 헤더 높이보다 큰 경우 버튼을 표시합니다.
	    if (scrollY > headerHeight) {
	        // 버튼을 표시하고 애니메이션 적용
	        $(fixedBtn1).fadeIn(1000);
	        $(fixedBtn2).fadeIn(1000);
	    } else {
	    	$(fixedBtn1).fadeOut(1000);
	    	$(fixedBtn2).fadeOut(1000);
	    }
	}

	// 스크롤 이벤트 리스너를 추가합니다.
	window.addEventListener("scroll", handleScroll);
	</script>

	<!-- 비디오  -->
	<div class=blind></div>
	<div class="video-wrap">
		<div class="video-overlay">
			<strong class="videoname1" id="videoname1">오펜하이머</strong> <strong
				class="videoname2" id="videoname2"> THE WORLD FOREVER
				CHANGES <br> 세상을 영원히 바꾸다 8월 15일 대개봉!
			</strong>
		</div>
		<div style="margin-top: -70px;" class="video-frame">
			<!-- padding-bottom : 16:9 비율의 퍼센트값 56.25%   -->
			<iframe style="width: 100%; height:600px;"
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
				<button type="button" id="btnall1" name="btnall1"
					class="btn btn-right" onclick="location.href='index.jsp?main=movieadmin/movielist.jsp'">전체보기</button>
			</div>
			<!-- Swiper -->
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<%
						for (int i = 0; i < 10; i++) {
						MovieDto dto = list.get(i);
						%>
						<div class="1page" align="center">
							<div style="position: relative; margin-top: 10px;">
								<!-- position 속성 추가 -->
								<img src="<%=dto.getMv_poster() %>" style="margin-bottom: 17px;"><br>
								<h5 style="color: white; font-size: 0.85em;"><%=i+1%>. <%=dto.getMv_title() %>
								</h5>
								
								<div class="hover-buttons"
									style="position: absolute; bottom: 43%; left: 50%; transform: translateX(-50%); display: none;">
									<!-- 상세보기 버튼 -->
									<button class="swiper-btn btn btn-right" data-movie-id="<%=i%>"
										id="swiper-btn1">
										<a href="index.jsp?main=/layout/detail.jsp&mv_no=<%=dto.getMv_no() %>">상세보기</a>
										</button>
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
										"filter" : "brightness(0.5)",
										"transform" : "scale(1.08)",
										"transition" : "0.5s"
									}); // 호버한 이미지에만 필터와 크기 조절 적용
									$(this).find(".hover-buttons").fadeIn(10); // 이미지에 호버하면 버튼 보이기
								}, function() {
									$(this).find("img").css({
										"filter" : "none",
										"transform" : "scale(1)", // 크기를 원래대로 복원
										"transition" : "0.5s"
									}); // 호버 해제하면 이미지 필터 원래대로 복원
									$(this).find(".hover-buttons").fadeOut(10); // 호버 해제하면 버튼 숨기기
								});
							});
						</script>
						<%
						 if ((i+1) % 5 == 0) {
						%>
					</div>
					<div class="swiper-slide">
					<%
					}
					}
					%>
					</div>
					</div>

					<div style="width: 100%; height: 450px;"
						class="special_hall">
					
					<div class="special_special"><b>특별관</b></div>
					<button type="button" id="btnall2" name="btnall2"
					class="btn btn-right" onclick="location.href=''">전체보기</button>
						
					<div class="special_hall_contents">
					<div class="special_result"></div>
					<div class="special_select">
					
					
					<ul>
						<li>SUITE CINEMA</li>
						<li>CINE & LIVINGROOM</li>
						<li>4DX</li>
						<li>CINE de CHEF</li>
					</ul>	
					</div>
					</div>	
					</div>
					
					<script>
					//슬라이드 페이지 넘어가는 버튼 및 슬라이드 효과 
					var swiper = new Swiper(".mySwiper", {
						spaceBetween : 30,
						centeredSlides : true,

						pagination : {
							el : ".swiper-pagination",
							clickable : true,
						},
						navigation : {
							nextEl : ".swiper-button-next",
							prevEl : ".swiper-button-prev",
						},
					});
					
					$(document).ready(function() {
				        // 페이지가 로드될 때 초기 이미지 설정
				        var defaultText = "SUITE CINEMA"; // 디폴트로 보여줄 텍스트
				        var defaultImageUrl = "<img src='<%=root%>/image/special5.png'>"; // 디폴트 이미지 경로 설정

				        // 디폴트 이미지를 special_result 요소에 추가
				        $(".special_result").html(defaultImageUrl);
				        
				        //li의 초기 css 설정
				        $(".special_select li:eq(0)").css({
				        	
				        	"border" : "3px solid white",
			            	"border-radius" : "20px",
			            	"font-weight": "800",
			        		"cursor": "pointer"
				        })

				        $(".special_select li").hover(function() {
				            // 모든 li에서 border 제거
				            $(".special_select li").css({
				            	
				            	"border": "",
				            	"font-weight" : ""
				            });

				            // 마우스를 올렸을 때 해당 li에 border 추가
				            $(this).css({
				            	
				            	"border" : "3px solid white",
				            	"border-radius" : "20px",
				            	"font-weight": "800",
				        		"cursor": "pointer"
				            });

				            var text = $(this).text(); // li 요소의 텍스트 가져오기
				            var imageUrl = "";

				            // 텍스트에 따라 이미지 경로 설정
				            if (text === "SUITE CINEMA") {
				                imageUrl = "<img src='<%=root%>/image/special5.png'>";
				            } else if (text === "CINE & LIVINGROOM") {
				                imageUrl = "<img src='<%=root%>/image/special6.png'>";
				            } else if (text === "4DX") {
				                imageUrl = "<img src='<%=root%>/image/special7.png'>";
				            } else if (text === "CINE de CHEF") {
				                imageUrl = "<img src='<%=root%>/image/special9.png'>";
				            }

				            // 이미지를 special_result 요소 내에 추가
				            $(".special_result").html(imageUrl);
				        }, function() {
				            // 마우스를 떼었을 때 이미지를 제거하지 않게
				        });
				    });
					</script>
				</div>
			
		</div>
	</div>


</body>
</html>

<!-- 네이버 간편로그인 api 
네이버에서 이름이 필수적으로 불러오게되있고(이름은 호출해야함), 이름이 null이 아닐때 영화 예매권한 주어지게 구현할것-->
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %> --%>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "vCp5t0hGKm51BiLsD6PQ";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "Vpim2RRikz";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8080/SemiProject_MovieCine/index.jsp", "UTF-8");
    String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
        + "&client_id=" + clientId
        + "&client_secret=" + clientSecret
        + "&redirect_uri=" + redirectURI
        + "&code=" + code
        + "&state=" + state;
    String accessToken = "";
    String refresh_token = "";
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      if (responseCode == 200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuilder res = new StringBuilder();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if (responseCode == 200) {
        out.println(res.toString());
      }
    } catch (Exception e) {
      // Exception 로깅
    }
  %>
  </body>
</html>