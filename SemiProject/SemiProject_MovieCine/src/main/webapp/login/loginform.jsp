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

<!-- 네이버 로그인 -->
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
<%-- <%
    String clientId = "vCp5t0hGKm51BiLsD6PQ";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/SemiProject_MovieCine/index.jsp?main=login/loginaction.jsp", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
         + "&client_id=" + clientId
         + "&redirect_uri=" + redirectURI
         + "&state=" + state;
    session.setAttribute("state", state);
 %> --%>
 
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
            
            <input type="image" src="./image/loginbutton.png" style="width: 250px; border-radius: 10px" id="btnlogin">
            <!--지워도되는데 input image로 submit 대체 안될시 이거쓸예정/ <button type="submit" class="btn btn-danger" id="btnlogin"
            style="width: 250px;">로그인</button> -->
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
         	<br>
         	&nbsp;&nbsp;&nbsp;
         	<b>간편로그인</b>
         	</td>
         </tr>
         <tr>
         	<td>
         	&nbsp;&nbsp;&nbsp;
         	<%-- <a href="<%=apiURL%>"><img style="width: 250px; height: auto; border-radius: 10px" src="./image/naverlogin.png"/></a> --%>
         	<!-- 네이버 로그인 버튼 노출 영역 -->
			    <div id="naver_id_login"></div>
			    <!-- //네이버 로그인 버튼 노출 영역 -->
			    <script type="text/javascript">
			        var naver_id_login = new naver_id_login("vCp5t0hGKm51BiLsD6PQ", "http://localhost:8080/SemiProject_MovieCine/index.jsp?main=login/loginaction.jsp");
			        var state = naver_id_login.getUniqState();
			        naver_id_login.setButton("white", 2,40);
			        naver_id_login.setDomain("http://localhost:8080/SemiProject_MovieCine/index.jsp?main=login/loginaction.jsp");
			        naver_id_login.setState(state);
			        naver_id_login.setPopup();
			        naver_id_login.init_naver_id_login();
			    </script>
         	</td>
         </tr>
         <tr>
         	<td>
         	&nbsp;&nbsp;&nbsp;
         	<a href="javascript:kakaoLogin();"><img style="width: 250px; height: auto; border-radius: 10px" src="./image/kakaologin.png"/></a>
         	</td>
         </tr>
         
      </table>
   </form>

</div>
<hr>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	window.kakao.init("8a07f76bebec8cff1421aad9e6b99056");
	
	function kakaoLogin() {
		window.kakao.Auth.login(){
			scope:'profile_nickname,profile_image,account_email',
			success: function(authObj) {
				console.log(authObj);
				window.Kakao.API.request({
					url:'/v2/user/me',
					success: res=>{
						const kakao_account=res.kakao_account;
						console.log(kakao_account);
					}
						
				})
			}
		})
		
	}
</script>
</body>
</html>