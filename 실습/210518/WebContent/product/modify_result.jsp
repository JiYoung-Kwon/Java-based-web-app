<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="vo" class="product.ProductVo" scope="request"/>
<jsp:setProperty property="*" name="vo"/>

<%
	ProductDao dao = new ProductDao();
	String msg = dao.modify(vo);
	out.print(msg); //옵션
%>