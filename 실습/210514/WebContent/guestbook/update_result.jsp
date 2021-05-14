<%@page import="gb.GuestBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="vo" class="gb.GuestBookVo" scope="request"/>
<jsp:setProperty name = "vo" property ="*"/>

<%
	GuestBookDao dao = new GuestBookDao();
	int r = dao.update(vo);
	
	if(r>0){
		out.print("OK");
	}else{
		out.print("FAIL");
	}
%>