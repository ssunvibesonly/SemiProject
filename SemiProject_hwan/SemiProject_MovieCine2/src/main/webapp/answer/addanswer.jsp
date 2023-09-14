<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="Dao.AnswerDao"%>
<%@page import="Dto.AnswerDto"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//엔코딩
	request.setCharacterEncoding("utf-8");

	AnswerDao dao=new AnswerDao();
	String num=request.getParameter("num");
	String myid=(String)session.getAttribute("myid");
	String content=request.getParameter("content");
	int star=Integer.parseInt(request.getParameter("star"));
	LocalDateTime now=LocalDateTime.now();
	String sdfNow=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0"));
	AnswerDto dto=new AnswerDto();
	dto.setNum(num);
	dto.setMyid(myid);
	dto.setContent(content);
	dto.setStar(star);
	
	dao.insertAnswer(dto,sdfNow);
%>