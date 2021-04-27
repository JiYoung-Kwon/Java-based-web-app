<?xml version="1.0" encoding = "UTF-8"?>

<%@page import="java.util.ArrayList"%>
<%@page import="kr.jobtc.json.DataVo"%>
<%@page import ="java.util.List" %>
<root>
	<% 
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		List<DataVo> list = new ArrayList<DataVo>();
		list.add(new DataVo("a001", "김씨1", "010-1111-1111"));
		list.add(new DataVo("a002", "김씨2", "010-1111-1112"));
		list.add(new DataVo("a003", "김씨3", "010-1111-1113"));
		list.add(new DataVo("a004", "김씨4", "010-1111-1114"));
		list.add(new DataVo("a005", "김씨5", "010-1111-1115"));
		
		String item = "<member>"
					+ "		<id>%s</id>"
					+ " 	<name>%s</name>"
					+ "		<phone>%s</phone>"
					+ "</member>";
					
		for(int i =0; i<list.size(); i++){
			DataVo v = list.get(i);
			String str = 
				String.format(item,v.getMid(), v.getMname(), v.getPhone());
			out.print(str);
		}
	%>
</root>