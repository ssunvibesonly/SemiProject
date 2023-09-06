<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<%
	MovieDao dao=new MovieDao();
	List<MovieDto> list=dao.getAllMovies();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>

<body>
<table class="table table-bordered" style="max-width :1000px;">
<tr class="table-success" valign="middle" align="center">
	
	<th width="50">번호</th>
	<th width="50">제목</th>
	<th width="200">포스터</th>
	<th width="50">감독</th>
	<th width="500">줄거리</th>
	<th width="50">트레일러</th>
	<th width="50">개봉일자</th>
	<th width="200">기본정보</th>
	<th width="100">등록일자</th>
	<th width="50">장르</th>
	<th width="50">배우</th>
	<th width="50">성인가격</th>
	<th width="50">청소년가격</th>
	<th width="50">아동가격</th>
	<th width="50">영화괸리</th>
</tr>
<%
	for(int i=0;i<list.size();i++){
		MovieDto dto = list.get(i);
		%>
	<tr style="text-align: center; ">
		<td><%=dto.getMv_no() %></td>
		<td><%=dto.getMv_title() %></td>

		
		<td><img src="<%=dto.getMv_poster() %>" width="50px" height="150px"></td>
		<td><%=dto.getMv_director() %></td>
		<td><pre><%=dto.getMv_st() %></pre></td>
		<td><%=dto.getMv_trailer() %></td>
		<td><%=dto.getMv_opendate() %></td>
		<td><%=dto.getMv_info() %></td>
		<td><%=sdf.format(dto.getMv_regdate()) %></td>
		<td><%=dto.getMv_genre() %></td>
		<td><%=dto.getMv_name() %></td>
		<td><%=dto.getMv_adult() %></td>
		<td><%=dto.getMv_teen() %></td>
		<td><%=dto.getMv_child() %></td>
		<td class="btn">
		<button type="button" class="btn btn-outline-warning" 
		onclick="location.href='updateAdminForm.jsp?num=<%=dto.getMv_no()%>'">정보수정</button><br>
		<button type="button" class="btn btn-outline-danger" 
		onclick="location.href='deleteAdmin.jsp?num=<%=dto.getMv_no() %>'">정보삭제</button>
		</td>
	</tr>	
	<%}
%>
</table>
<button type="button" class="btn btn-outline-success"
 onclick="location.href='insertAdminForm.jsp'">정보추가</button>
</body>
</html>