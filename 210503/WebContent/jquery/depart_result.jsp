<%@ page import="kr.jobtc.json.Depart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String dno = request.getParameter("dno");
	Depart d = new Depart();
	String json = d.getDepart(dno);
	out.print(json);
%>