<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String serial = request.getParameter("serial");
	ProductDao dao = new ProductDao();
	String msg = dao.delete(serial);
	out.print(msg); //옵션
%>