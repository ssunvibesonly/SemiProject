<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<style>

div.container{

margin-top: 50px;

}

</style>
<body>
<div class="container" align="center">

<h2 style="color: white;">상품등록</h2>
<br>
	<table class="table table-bordered" style="width:700px;">
		<tr>
			<th>상품명</th>
			<td>
				<input type="text" class="form-control" style="width: 200px;">
			</td>
		</tr>
		<tr>
			<th>상품 설명</th>
			<td>
				<input type="text" class="form-control">
			</td>
		</tr>
		<tr>
			<th>카테고리</th>
			<td>
				<select style="width:150px;">
					<option value="패키지">패키지
					<option value="콤보">콤보
					<option value="팝콘">팝콘
					<option value="음료">음료
				</select>
			</td>
		</tr>
	
	</table>

</div>
</body>
</html>