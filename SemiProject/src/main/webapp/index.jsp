<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<title>영화 그 이상의 감동 '3'CINE 입니다</title>
=======
<style type="text/css">

</style>
<title>영화 그 이상의 감동 '3'CINE 입니다</title>
</head>
>>>>>>> goyoung
=======
<title>영화 그 이상의 감동 '3'CINE 입니다</title>
>>>>>>> c66e88a01cf6327ad6265949bf21045f7cba7ac7
=======
<title>영화 그 이상의 감동 '3'CINE 입니다</title>
>>>>>>> goyoung
<%
	//절대경로잡기
	String root=request.getContextPath();
	
	//기본페이지
	String mainPage="layout/main.jsp";

	//url을 통해서 main값을 얻어 메인 페이지에 출력한다
	if(request.getParameter("main")!=null)
	{
		mainPage=request.getParameter("main");
	}
%>
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> goyoung
</head>
<style type="text/css">
.layout{
}

.header{
<<<<<<< HEAD
	position: absolute;
=======
</head>
<style type="text/css">

.header{
>>>>>>> c66e88a01cf6327ad6265949bf21045f7cba7ac7
=======
>>>>>>> goyoung
	width: 100%;
	height: 100%;
}

.main{
<<<<<<< HEAD
<<<<<<< HEAD
	position: absolute;
	width: 100%;
	height: 100%;
	top: 176px;
}

.footer{
	position: relative;
	width: 100%;
	height: 100%;
	top:1580px;
}
</style>
<body background="color: black;">
=======
	width: 100%;
	height: 100%;
}

.footer{
	width: 100%;
	height: 100%;
}
</style>
<body style="background-color: black;">
>>>>>>> c66e88a01cf6327ad6265949bf21045f7cba7ac7
	
	<div class="layout header">
		<jsp:include page="layout/header.jsp"/>
	</div>
	
	<div class="layout main">
		<jsp:include page="<%=mainPage %>"/>
	</div>
	
	<div class="layout footer">
		<jsp:include page="layout/footer.jsp"/>
<<<<<<< HEAD
=======
<body>
=======
	width: 100%;
	height: 100%;
}

.footer{
	width: 100%;
	height: 100%;
	
}
</style>
<body background="color: black;">
	
>>>>>>> goyoung
	<div class="layout header">
		<jsp:include page="layout/header.jsp"/>
	</div>
	
	<div class="layout main">
<<<<<<< HEAD
		<jsp:include page="layout/main.jsp"/>
>>>>>>> goyoung
=======
>>>>>>> c66e88a01cf6327ad6265949bf21045f7cba7ac7
=======
		<jsp:include page="<%=mainPage %>"/>
>>>>>>> goyoung
	</div>
	
	<footer>
	<div class="layout footer">
		<jsp:include page="layout/footer.jsp"/>
	</div></footer>
</body>
</html>