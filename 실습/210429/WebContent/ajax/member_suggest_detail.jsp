<%@page import="kr.jobtc.json.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<%
		String eid = request.getParameter("eid");
		MemberDao dao = new MemberDao();
		String detail = dao.detail(eid);
		out.print(detail);	
	
	%>   
