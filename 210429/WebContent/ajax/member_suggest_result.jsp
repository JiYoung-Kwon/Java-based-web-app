<%@ page import ="kr.jobtc.json.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

[
<%
	String findStr = request.getParameter("findStr");
	MemberDao dao = new MemberDao();
	String list = dao.suggest(findStr);
	out.print(list);
%>
]