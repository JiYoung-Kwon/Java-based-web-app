<%@page import="member.MemberVo"%>
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
		
		/*
		
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
			
		// serial=1번인 자료의 ea와 price를 수정
		out.print("<hr/><h2>자료 수정</h2>");
		pVo = new ProductVo();
		pVo.setSerial(1);
		pVo.setEa(100);
		pVo.setPrice(5000);
		r = sqlSession.update("test.product_update", pVo);
		
		if(r>0){
			sqlSession.commit();
			out.print("정상적으로 수정됨");
		}else{
			sqlSession.rollback();
			out.print("수정 중 오류 발생");
		}
		
		// serial=2번인 자료 삭제
		out.print("<hr/><h2>자료 삭제</h2>");
		r= sqlSession.delete("test.product_delete",2);
		if(r>0){
			sqlSession.commit();
			out.print("정상적으로 삭제됨");
		}else{
			sqlSession.rollback();
			out.print("삭제 중 오류 발생");
		}
		
		*/                                                          
		
		// 입력된 mid가 null이 아닌 경우에만 where 조건이 실행되도록 조치
		out.print("<hr/><h2>if test</h2>");
		List<MemberVo> mList = sqlSession.selectList("test.if_test",null);
		out.print("mList size : " + mList.size()); //회원 전체 건수
		
		mList = sqlSession.selectList("test.if_test","hong");
		out.print("<br/>mList size : " + mList.size());
		
		// choose 사용
		// 입력된 값이 1,2,3,4 중 하나이다. 이는 분기를 나타낸다. 1이면 입사일이 1~3월까지인 직원들을,
		// 2이면 4~6월, 3이면 7~9월, 4이면 10~12월 EmpVo에 담아서 리턴
		out.print("<hr/><h2>choose test</h2>");
		List<EmpVo> list1 = sqlSession.selectList("test.choose_test", 1); //1분기 입사 직원 목록
		for(EmpVo vo : list1){
			out.print("<li>" + vo.getEmployeeId());
			out.print(" -- " + vo.getFirstName());
			out.print(" -- " + vo.getSalary());
			out.print(" -- " + vo.getPhoneNumber());
		}
		
		out.print("<br/>---------------------------------------------<br/>");
		List<EmpVo> list2 = sqlSession.selectList("test.choose_test", 2); //2분기 입사 직원 목록
		for(EmpVo vo : list2){
			out.print("<li>" + vo.getEmployeeId());
			out.print(" -- " + vo.getFirstName());
			out.print(" -- " + vo.getSalary());
			out.print(" -- " + vo.getPhoneNumber());
		}

		// where 사용
		// findStr에 값이 전달될 경우에만 employees 테이블의 first_name에 findStr이 포함된 명단을 EmpVo에 담아 출력
		// id : test.emp_find
		out.print("<hr/><h2>where test</h2>");
		List<EmpVo> list3 = sqlSession.selectList("test.emp_find", null);
		out.print("<br/>findStr is null : " + list3.size());

		List<EmpVo> list4 = sqlSession.selectList("test.emp_find", "th");
		out.print("<br/>findStr is 'th' : " + list4.size());
		
		sqlSession.close();
	%>
	</div>
</body>
</html>