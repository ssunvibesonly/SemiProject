<%@page import="java.text.NumberFormat"%>
<%@page import="Dto.ShopDto"%>
<%@page import="Dao.MemberDao"%>
<%@page import="Dto.MemberDto"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ShopDao"%>
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
<%
String myid=(String)session.getAttribute("myid"); //연결된 아이디 session 가져오기(로그인 했을 때만 장바구니 담을 수 있음)
ShopDao dao=new ShopDao();

List<HashMap<String,String>> list=dao.getCartList(myid);
MemberDao mdao=new MemberDao();

String name=mdao.getName(myid);
String ph=mdao.getPh(myid);

NumberFormat nf=NumberFormat.getCurrencyInstance();

int allmoney=0;

%>
<body>
<br><br>
<div class="container" style="width: 1000px;">
<h1 style="color: white;"><%=name %>님의 장바구니</h1>
<hr style="color: white;border: 3px solid white;">
<table class="table table-bordered">
	<tr>
		<th><input type="checkbox" id="allcheck"></th>
		<th>상품명</th>
		<th>상품금액</th>
		<th>수량</th>
		<th>결제금액</th>
	</tr>
	
		<%
		for(int i=0;i<list.size();i++){
			HashMap<String,String> map=list.get(i);
			
			String photo=map.get("photo");
			String sangpum=map.get("sangpum");
						
			//가격 형변환
			int price=Integer.parseInt(map.get("price"));
			//갯수 형변환
			int cnt=Integer.parseInt(map.get("cnt"));
			int eachtotal=price*cnt;
			allmoney+=eachtotal;
			
			%>
			<script>
			$(function(){
				var all=<%=allmoney%>
				$("#all").text(all);
			})
			
			
			</script>
			<tr>
				<td><input type="checkbox" idx=<%=map.get("idx") %> class="eachcheck" id="eachclick"></td>
				<td><div class="sangpum" shopnum="<%= map.get("shopnum") %>">
					<img src="shopimg/<%=photo%>" style="width:200px;">상품명:<%=map.get("name") %>상품설명:<%=map.get("detail") %>
				</div></td>
				<td><%=price %></td>
				<td><%=cnt %></td>
				<td>
				<%=nf.format(eachtotal) %>
				</td>
			</tr>

		<%}%>
		<tr>
			<td colspan="5" id="all">
				총 금액:<b></b>
			</td>
		</tr>
	
</table>
</div>
<script>
$("#allcheck").click(function(){
	
	var allcheck=$(this).is(":checked"); //전체 체크시 체크 여부 확인
	console.log(allcheck);
	
	$(".eachcheck").prop("checked",allcheck);
	
	
})

$("#eachclick").click(function(){
	
	var size=$(".eachcheck:checked").length;
	if(size==0){
		$("#all").html(0);
		
	}
})

</script>

</body>
</html>