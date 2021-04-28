<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 오라클 데이터베이스 연결
   1) WEB-INF/lib/오라클DB의 드라이버 파일 복사
	  C:\app\(사용자이름)\product\18.0.0\dbhomeXE\jdbc\lib\ojdbc8.jar
   2) Class.forName()을 사용하여 드라이버를 메모리에 로딩
   3) DriverManager클래스를 사용하여 오라클DB에 접속
   4) SQL문장을 작성
   5) Statement 또는 PreparedStatement를 사용하여 실행할 쿼리의 객체 생성(connection 객체를 사용)
   6) SQL문장을 실행(insert, update, delete => excuteUpdate(), select => excuteQuery()로 실행)
   7) select 결과는 ResultSet으로 받고, insert, update, delete는 적용된 행 수가 반환됨

*/

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"; 
	String user = "hr"; 
	String pwd = "1111";
	Connection conn = null;

	String findStr = request.getParameter("findStr");
	//out.print(findStr);
	try{
		Class.forName(driver); //2)
		conn = DriverManager.getConnection(url, user, pwd); //3)
		String sql = "select first_name, email from employees"; //4)
		sql += " where first_name like ?"
			+  " or phone_number like ?";
//		sql += " where first_name = '" + findStr + "'";
		PreparedStatement ps = conn.prepareStatement(sql); //5)
		ps.setString(1, "%" + findStr + "%");
		ps.setString(2, "%" + findStr + "%");
		
		ResultSet rs = ps.executeQuery(); //6)
		while(rs.next()){
			out.print(rs.getString("first_name") + "-");
			out.print(rs.getString("email"));
			out.print("<br/>");
		}
		
	}catch(Exception ex){
		out.print(ex.toString());
	}
   
%>