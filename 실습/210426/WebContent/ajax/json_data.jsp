<%@ page import="kr.jobtc.json.DataVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- file name : JSON_data --%>

[ 
	{ "mid":"hong", "mname" : "홍길동", "phone" : "010-1111-1111"},
	{ "mid":"kim",  "mname" : "김길동", "phone" : "010-1111-1112"},
	{ "mid":"park", "mname" : "박길동", "phone" : "010-1111-1113"},
	{ "mid":"choi", "mname" : "최길동", "phone" : "010-1111-1114"},
	{ "mid":"lee",  "mname" : "이길동", "phone" : "010-1111-1115"},
<%
	DataVo vo = new DataVo();
	vo.setMid("nam");
	vo.setMname("남씨");
	vo.setPhone("010-2222-2222");
	String json
		= String.format("{ 'mid' : '%s' , 'mname' : '%s', 'phone': '%s'}",
				  vo.getMid(), vo.getMname(), vo.getPhone()
			);
	
	json = json.replaceAll("'", "\"");
	out.print(json);
%>
]