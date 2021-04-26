<%@ page import = "kr.jobtc.json.DataVo"  %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- file name : json_data_list --%>

<%
	List<DataVo> list = new ArrayList<DataVo>();
	
	list.add(new DataVo("kim1", "김길동1", "010-1111-1111"));
	list.add(new DataVo("kim2", "김길동2", "010-1111-1112"));
	list.add(new DataVo("kim3", "김길동3", "010-1111-1113"));
	list.add(new DataVo("kim4", "김길동4", "010-1111-1114"));
	list.add(new DataVo("kim5", "김길동5", "010-1111-1115"));
	
	//list에 담겨진 객체들을 JSON 구조로 만들어 화면에 출력
%>
[
	<%
		int i = 0;
		for (DataVo v : list) {
			i++;
			String json = String.format("{'mid' : '%s' , 'mname' : '%s' , 'phone' : '%s'}",
					v.getMid(), v.getMname(), v.getPhone());
			if (i != 5) {
				json += ",";
			}
			json = json.replaceAll("'", "\"");
			out.print(json);
		}
%>

]
