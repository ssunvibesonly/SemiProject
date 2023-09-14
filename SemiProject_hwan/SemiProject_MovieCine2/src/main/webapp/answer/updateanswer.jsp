<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="Dto.AnswerDto"%>
<%@page import="Dao.AnswerDao"%>
<%
   request.setCharacterEncoding("utf-8");

   String idx=request.getParameter("idx");
   String content=request.getParameter("content");
  	int star =Integer.parseInt(request.getParameter("star"));
   
   
   AnswerDto dto =new AnswerDto();
   dto.setIdx(idx);
   dto.setContent(content);
   dto.setStar(star);
   LocalDateTime now=LocalDateTime.now();
   String sdfNow=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0"));
   AnswerDao dao=new AnswerDao();
   dao.updateAnswer(dto,sdfNow);
  
%>