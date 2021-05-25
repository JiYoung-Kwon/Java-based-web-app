<%@page import="mybatis.EmpVo"%>
<%@page import="product.ProductVo"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import = "mybatis.MybaFactory" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee</title>
</head>
<body>
	<div id = 'employee'>
	<%
		SqlSession sqlSession = MybaFactory.getFactory().openSession();
		String firstName = sqlSession.selectOne("test.test_emp", 120);
		out.print("<li>firstName : " + firstName);
		
		//부서코드 입력해 부서명 출력
		String dName = sqlSession.selectOne("test.get_dep_name", 80);
		out.print("<li>dName : " + dName);
		
		//제품 목록을 모두 출력
		out.print("<hr/><h2>제품 목록</h2>");
		List<ProductVo> pList = sqlSession.selectList("test.all_product");
	/* 	for(ProductVo vo : pList){
			out.print("<li>" + vo.getpCode());
			out.print(" -- " + vo.getpName());
		} */
		
		//부서코드가 100번인 직원들의 사번, 이름, 급여, 연락처를 조회
		out.print("<hr/><h2>직원 조회</h2>");
		List<EmpVo> eList = sqlSession.selectList("test.get_dep");
		for(EmpVo vo : eList){
			out.print("<li>" + vo.getEmployeeId());
			out.print(" -- " + vo.getFirstName());
			out.print(" -- " + vo.getSalary());
			out.print(" -- " + vo.getPhoneNumber());
		}
		
		out.print("<hr/><h2>직원 조회2</h2>");
		List<EmpVo> e2List = sqlSession.selectList("test.get_dep_list",100);
		for(EmpVo vo : e2List){
			out.print("<li>" + vo.getEmployeeId());
			out.print(" -- " + vo.getFirstName());
			out.print(" -- " + vo.getSalary());
			out.print(" -- " + vo.getPhoneNumber());
		}
		
		//제품관리 테이블에 데이터를 추가하시오.
		out.print("<hr/><h2>제품 추가</h2>");
		ProductVo pVo = new ProductVo();
		pVo.setGubun("입고");
		pVo.setpCode("p001");
		pVo.setpName("모니터");
		pVo.setEa(500);
		pVo.setPrice(10000);
		pVo.setAmt(pVo.getEa() * pVo.getPrice());
		pVo.setMid("h001");
		
		int r = sqlSession.insert("test.product_insert", pVo);
		if(r>0){
			sqlSession.commit();
			out.print("정상적으로 저장됨");
		}else{
			sqlSession.rollback();
			out.print("저장 중 오류 발생");
		}
		
	%>
	</div>
</body>
</html>