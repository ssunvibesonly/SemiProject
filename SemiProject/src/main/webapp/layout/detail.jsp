<%@page import="java.util.ArrayList"%>
<%@page import="Dto.MovieDto"%>
<%@page import="Dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>detail</title>
<%
//절대경로잡기
String root = request.getContextPath();
%>	
<style>
/* 스타일은 위에서 내려오는 순으로 적음 추가시 같은 위치쪽 삽입 */

body{
	background-image: url('https://www.youtube.com/embed/oSqK_v6zPoM?mute=1&autoplay=1&controls=0&modestbranding=1&disablekb=1&rel=0&');
}

b{
	color: white; /* b태그 글씨 색깔 */
}

/* 디테일 큰 div */
.detailblock{
	width: 100%;
	height: 1635px;
	border: 10px solid white;
}

/* 디테일 내부 라인 div */
.detailall{
	position: absolute;
	right: 13.2%;
	left: 13.2%;
	width: 73.6%;
	height: 1550px;
	border: 10px solid white;
	margin-top: 50px;
}

/* 영화 포스터 div */
.detailposter{
	position: relative;
	left: 440px;
	width: 300px;
	height: 400px;
}

.detailposter img{
	width: 290px;
	height: 400px;
}

/* 영화 이름 div */
.detailtitle{
	position:absolute;
	top: 20px;
	left: 770px;
	width: 500px;
	height: 50px;
	font-size: 1.5em;
}

/* 장르, 개봉 div */
.detailinfo{
	color: white;
	position: absolute;
	top: 70px;
	left: 770px;
	width: 500px;
	height: 75px;
}

/* 스토리 */
.detailstory{
	color: white;
	position: absolute;
	top: 470px;
	left: 440px;
	width: 830px;
	height: 200px;
	border: 2px solid white;
}

/* 예매하기 버튼 */
#detailbtn1{
	position: absolute;
	top: 355px;
	left: 770px;
	color: white;
	background-color: #DF3E49;
	width: 100px;
	height: 45px;
	border: none;
	border-radius: 20px;
	font-weight: 500;
}
/* 이전으로 버튼 */
#detailbtn2{
	position: absolute;
	top: 355px;
	left: 880px;
	color: black;;
	background-color: white;
	width: 100px;
	height: 45px;
	border: none;
	border-radius: 20px;
	font-weight: 500;
}

.detailresult{
	position: absolute;
	top: 710px;
	left: 440px;
	width: 830px;
	height: 500px;
	border: 2px solid white;
}

.detailcomment{
	position: absolute;
	top: 1260px;
	left: 340px;
	width: 1030px;
	height: 250px;
	border: 2px solid white;
}

#video {
    	position: absolute;
        top: 0px;
        left: 0px;
        min-width: 100%;
        min-height: 100%;
        width: auto;
        height: auto;
        z-index: -1;
        overflow: hidden;
}  
</style>

<script>

	/* 이전 화면으로 돌아가는 이벤트*/
	function back() {
		history.back();
	}
	
</script>
</head>
<%
// 쿼리 파라미터에서 포스터 ID를 가져옵니다.
String mv_no = request.getParameter("mv_no");
String mv_title = request.getParameter("mv_title");
String mv_poster = request.getParameter("mv_poster");
String mv_st = request.getParameter("mv_st");
String mv_genre = request.getParameter("mv_genre");
String mv_opendate = request.getParameter("mv_opendate");
String mv_info = request.getParameter("mv_info");

MovieDao dao = new MovieDao();
MovieDto dto = dao.getData(mv_no);
%>
<body>
<!-- 큰 div 영역 -->
<div class="detailblock">
	<!-- 출력할 컨텐츠 div 영역 -->
	<div class="detailall">
		<div class="detailposter"><img src="<%=dto.getMv_poster()%>"></b></div>
		<div class="detailtitle"><b>영화제목 : <%=dto.getMv_title() %></b></div>
		<div class="detailinfo">장르 : <%=dto.getMv_genre() %><br>개봉 : <%=dto.getMv_opendate() %><br>관람연령 : <%=dto.getMv_info() %> </div>
		<div class="detailstory"><%=dto.getMv_st() %></div>
		<button type="button" id="detailbtn1" onclick="location='<%=root%>/index.jsp?main=Movie_reserve/movielist.jsp'">예매하기</button>
		<button type="button" id="detailbtn2" onclick="back()">이전으로</button>
		<div class="detailresult"><b>댓글출력</b></div>
		<div class="detailcomment"><b>댓글입력</b></div>
	</div>
</div>
</body>
</html>