<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Cute+Font&family=Diphylleia&family=Dongle:wght@300&family=Hi+Melody&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		
		//id중복체크
		$("#btncheck").click(function() {
			
			//id읽기
			var id=$("#id").val();
			//alert(id);
			
			$.ajax({
				
				type:"get",
				url:"member/idsearch.jsp",
				dataType:"json",
				data:{"id":id},
				success:function(data){
					
					//alert(data.count);
					if(data.count==1)
						{
						$("span.idsuccess").text("fail");
						$("#id").val("");
						$("#id").focus();
						}else{
							$("span.idsuccess").text("success");
						}
				}
		});
	});

	
	//선택 이메일 주소 넣기..혹은 직접입력
		$("#selemail").change(function(){
			if($(this).val=='-'){
				$("#email2").val("");
				$("#email2").focus();
			}else{
				$("#email2").val($(this).val());
			}
		});
		
	});
	function check(f)
	{
	if(f.pass.value!=f.pass2.value)
		{
		alert("비밀번호가 다릅니다");
		f.pass.value("");
		f.pass2.value="";
		
		return false; //action이 호출되지 않는다
		}
	}
</script>
</head>
<body>
	<div style="margin: 80px 444px;">
		<form action="memberproc.jsp" method="post" class="form-inline" id="mfrm">
			<table class="table table-bordered" style="width: 500px; position: absolute;">
				<caption align="top"><h4>회원가입</h4></caption>
				<tr>
					<td style="width: 100px;" valign="center" align="center">아이디</td>
					<td>
					<input type="text" name="id" style="width: 160px;"
					readonly="readonly" required="required" id="mid">&nbsp;&nbsp;
					<button type="button" class="btn btn-danger btn-sm"
					onclick="openId()" style="width: 90px;">아이디확인</button>
					</td>
				</tr>
				
				<tr>
		  			<td style="width: 100px;" valign="center" align="center">비밀번호</td>
		  			<td>
		  			<input type="password" name="pass" placeholder="비밀번호"
		  			required="required" style="width: 120px;" class="form-group">
		  			<input type="password" name="pass2" placeholder="비밀번호확인"
		  			required="required" style="width: 120px;" class="form-group">			
		  			</td>
		 	    </tr>
				
				<tr>
					<td style="width: 100px;" valign="center" align="center">이름</td>
					<td>
						<input type="text" class="form-control" style="width: 200px;"
						name="name" required="required">
					</td>
				</tr>
				<tr>
					<td style="width: 100px;" valign="center" align="center">성별</td>
					<td>
						<input type="radio"  name="gender" value="남자" required="required">남자
						<input type="radio"  name="gender" value="여자" required="required">여자
					</td>
				</tr>
				<tr>
					<td style="width: 100px;" valign="center" align="center">생년월일</td>
					<td>
					<input type="date" name="birth" class="form-control" style="width: 200px">
					</td>
				</tr>
				<tr>
					<td style="width: 100px;" valign="center" align="center">전화번호</td>
					<td>
					<select name="phone1" id="phone1">
					 <option>010</option>
					 <option>011</option>
					 <option>017</option>
					 <option>02</option>
					</select>
					 <b>-</b>			 
						<input type="text" name="phone2" id="phone2" style="width:50px";>
					 <b>-</b>
					
					 <script>
					$("#phone2").keyup(function(){
					
					if($(this).val().length==4)
					{
						$("#phone3").focus();
					}
					})
					</script>
					
						<input type="text" name="phone3" id="phone3" style="width:50px";>
					</td>
				</tr>
				<tr>
					<td style="width: 100px;" valign="center" align="center">이메일</td>
					<td>
						<input type="text" name="email1" class="form-group"
				  		required="required" style="width: 120px;">
				  		<b>@</b>
				  		<input type="text" name="email2"  id="email2" class="form-group"
				  		required="required" style="width: 120px;">
				  		<select id="selemail" class="form-group">
				  			<option value="-">직접입력</option>
				  			<option value="naver.com">네이버</option>
				  			<option value="daum.net">다음</option>
				  			<option value="gmail.com">구글</option>
				  			<option value="nate.com">네이트</option>
				  		</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px;" valign="center" align="center">주소</td>
					<td>
					<input type="text" placeholder="주소 api기능 탑재 예정" name="addr" required="required" 
					style="width: 200px">
				</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-success" 
						style="width: 100px;">회원가입</button>
						<button type="reset" class="btn btn-outline-danger" 
						style="width: 100px;">초기화</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<script type="text/javascript">
		function openId() {
			
			window.open("idcheck.jsp","e","left=400px; top=100px,width=260px,height=185px");
		}	
	</script>
</body>
</html>