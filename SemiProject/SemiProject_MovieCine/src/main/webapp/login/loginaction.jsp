<%@page import="java.lang.management.MemoryNotificationInfo"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!-- 네이버 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
  var naver_id_login = new naver_id_login("vCp5t0hGKm51BiLsD6PQ", "http://localhost:8080/SemiProject_MovieCine/index.jsp?main=login/loginaction.jsp");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age'));
  }
</script>

<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String cbsave=request.getParameter("cbsave"); //체크안하면 null


MemberDao dao=new MemberDao();
boolean b=dao.isEqualPass(id, pass);

//아이디와 비밀번호가 맞으면 3개의 세션을 저장하고 로그인메인
if(b){
   session.setMaxInactiveInterval(60*60*3); //3시간
   session.setAttribute("loginok", "yes");
   session.setAttribute("myid", id);
   session.setAttribute("saveok", cbsave==null?null:"yes");
   
   //로그인메인으로 이동
   response.sendRedirect("../index.jsp");
}else{%>

   <script type="text/javascript">
   alert("아이디와 비밀번호가 맞지않습니다");
   history.back();
   </script>
<%}
%>
</body>
</html>