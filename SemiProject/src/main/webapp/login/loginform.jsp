<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>Insert title here</title>
<style type="text/css">
hr{
   width: 40%;
   border: 2px solid #666666;
   margin-left: 3%;
}

.loginform {
   margin-left: 35%;
   margin-top: 5%;
   color: silver;
}


</style>
</head>
<%
   //세션값얻기
   String saveok=(String)session.getAttribute("saveok");
   
   String myid="";
   
   if(saveok!=null)
   {
      myid=(String)session.getAttribute("myid");
   }
%>
<!-- 네이버로그인 api -->
<%
    String clientId = "vCp5t0hGKm51BiLsD6PQ";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/SemiProject_MovieCine/index.jsp", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
         + "&client_id=" + clientId
         + "&redirect_uri=" + redirectURI
         + "&state=" + state;
    session.setAttribute("state", state);
 %>
<body>
<hr>

<div class="loginform">
   <form action="login/loginaction.jsp" method="post">
      <b style="color: silver;">아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</b>
      <br>
      <table style="width: 500px; margin-top: 1%;">
         <tr>
         <td>
            <i class="bi bi-person"></i>
            <input type="text" name="id" class="from-control" required="required" value="<%=myid %>"
            style="width: 250px; border: 5px solid #666666;">
         </td>
         </tr>
         <tr>
         <td>
            <i class="bi bi-lock"></i>
            <input type="password" name="pass" class="from-control" required="required"
            style="width: 250px; border: 5px solid #666666;">
         </td>
         </tr>
         
         <tr>
            <td>
            &nbsp;&nbsp;&nbsp;
            <button type="submit" class="btn btn-danger" id="btnlogin"
            style="width: 250px;">로그인</button>
            <button type="button" class="btn btn-outline-success"
			onclick="location.href='index.jsp?main=member/memberform.jsp'">회원가입</button>	
            </td>
         </tr>
         <tr>   
            <td>
            &nbsp;&nbsp;&nbsp;
            <input type="checkbox" name="cbsave"
            <%=saveok==null?"":"checked" %> style="color: silver;">아이디저장
               <a href="#" style="color: silver;">아이디 찾기></a>
               <a href="#" style="color: silver;">비밀번호 찾기></a>
            </td>
         </tr>
         <tr>
         	<td>
         	<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
         	</td>
         </tr>
         <tr>
         	<td>
         	<a href="javascript:void(0)" onclick="kakaoLogin()"><img height="38px"  src="image/kakao_login_medium_narrow.png"/></a>
         	<form id="kakaogaip" method="post" action="login/kakao.jsp">
         	<input type="hidden" name="mem_name"> <!-- 카카오 닉네임으로 쓸 것 -->
         	<input type="hidden" name="mem_gender"> <!-- 카카오 성별 -->
         	<input type="hidden" name="mem_birth"> <!-- 카카오 생일 -->
         	<input type="hidden" name="mem_email"> <!-- 카카오 이메일 -->
         	</form>
         	
         	<!-- 카카오스크립트 -->
         	
         	<script type="text/javascript">
         	Kakao.init("aa8fa91006ff299919c69a3d7526fed0");
         	console.log(Kakao.isInitialized())
         	
         	function kakaoLogin() {
    		Kakao.Auth.login({
     		 success: function (response) {
       			 Kakao.API.request({
          			url: '/v2/user/me', //kakao.auth.login(auth)을 request하면 유효시간이 존재하는 토큰
          			success: function (response) {
						
          				var account=response.kakao_account;
          				console.log(account); //카카오계정으로 로그인한 사용자 정보 호출하기
          				
          				$("#kakaogaip input[name=mem_name]").val(account.profile.nickname)
          				$("#kakaogaip input[name=mem_gender]").val(account.gender)
          				$("#kakaogaip input[name=mem_birth]").val(account.birth)
						$("#kakaogaip input[name=mem_email]").val(account.email)
						
						// 사용자 정보가 포함된 폼을 서버로 제출한다.
						document.querySelector('#kakaogaip').submit();
          		},
          		fail: function (error) {
          		// 경고창에 에러메시지 표시
					$('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
         		 },
        		})
      			},
     		 fail: function (error) {
      		  console.log(error)
      			},
   			 })
  			}
         	
         	//카카오로그아웃  
         	function kakaoLogout() {
         	    if (Kakao.Auth.getAccessToken()) {
         	      Kakao.API.request({
         	        url: '/v1/user/unlink',
         	        success: function (response) {
         	        	console.log(response)
         	        },
         	        fail: function (error) {
         	          console.log(error)
         	        },
         	      })
         	      Kakao.Auth.setAccessToken(undefined)
         	    }
         	  }  
         	</script>
         	</td>
         </tr>
         
      </table>
   </form>

</div>
<hr>

</body>
</html>