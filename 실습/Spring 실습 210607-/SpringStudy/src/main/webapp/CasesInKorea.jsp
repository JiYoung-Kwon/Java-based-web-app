<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang='ko'>

<head>

<meta charset="UTF-8">

<meta name='viewport' content='width=device-width, initial-scale = 1.0' />

<title>국내 발생 현황</title>

<style>

#table1 *, #table2 *, #table3 *, #table4 *, #table5 *, #table6 *, #table7 * {
	box-sizing: border-box;
	vertical-align:middle;
	text-align : center;
}

#table1, #table2, #table3, #table4, #table5, #table6, #table7{
	display: table;
	width: 1250px;
	border-collapse: collapse;
	border-spacing: 0;
	margin: 0px;
	padding:0px;
}

/* css - 누적 확진자 현황 */

#table1 .tr, #table2 .tr, #table3 .tr{
	display: table-row;
	height:30px;
}

#table1 .td, #table2 .td, #table3 .td{
	display: table-cell;
	border: 1px solid;
}

#table1>.tr>.td:first-child {
	width: 500px;
	border-bottom: 0px;
}

#table1>.tr>.td:not(first-child) {
	width: 250px;
	border-bottom: 0px;
}

#table2>.tr>.td:nth-child(2) {
	width: 375px;
	border-bottom: 0px;
}

#table2>.tr>.td:not(:nth-child(2)) {
	width: 125px;
	border-bottom: 0px;
}

#table3>.tr>.td:nth-child(2) {
	width: 375px;
}

#table3 .td>.tr:first-child>.td {
	width: 125px;
	border-top: 0px;
}

#table3 .td>.tr:last-child>.td {
	width: 125px;
	border-bottom: 0px;
}

#table3 .td>.tr>.td:first-child {
	border-left: 0px;
}

#table3 .td>.tr>.td:last-child {
	border-right: 0px;
}

/* css : 누적 검사 현황 */

#table4 .tr, #table5 .tr {
	display: table-row;
	height:30px;
}

#table4 .td, #table5 .td {
	display: table-cell;
	
}

#table4 .td, #table5 .td{
	border: 1px solid;
}


#table4>.tr>.td:first-child {
	width: 937.5px;
}

#table4>.tr>.td:not(first-child) {
	width: 156.25px;
}

#table4>.tr>.td>.tr>.td {
	border-bottom: 0px;
}

#table4>.tr>.td>.tr>.td:first-child {
	width: 624.5px;
	border-left: 0px;
}

#table4>.tr>.td>.tr>.td:not(first-child) {
	width: 156px;
}

#table4>.tr>.td>.tr>.td:nth-child(3) {
	border-right: 0px;
}

#table4>.tr>.td>.tr>.td>.tr>.td {
	border-bottom: 0px;
}

#table4>.tr>.td>.tr>.td>.tr>.td:first-child {
	width: 155.8px;
	border-left: 0px;
}

#table4>.tr>.td>.tr>.td>.tr>.td:nth-child(2) {
	width: 156.3px;
}

#table4>.tr>.td>.tr>.td>.tr>.td:nth-child(3) {
	width: 156.2px;
}


#table4>.tr>.td>.tr>.td>.tr>.td:last-child {
	border-right: 0px;
	width:155.7px;
}

#table5>.tr>.td{
	border-top: 0px;
}


/* css- 그래프 크기 */
#chart1, #chart2{
	width:1250px;
	height:300px;
	border:1px solid;
}

/* css- 확진자 성별 현황 , 연령별 현황*/
#table6 .tr, #table7 .tr {
	display: table-row;
	height:30px;
}

#table6 .td, #table7 .td {
	display: table-cell;
	border: 1px solid;
	width: 312.5px;
	
}
</style>

</head>

<body>

	<h1>국내 발생 현황</h1>

	<div id='cases'>

		<div id='patient'>
			<h3>- 누적 확진자 현황</h3>
			
			<div id='table1'>
				<div class='tr'>
					<div class='td'>확진환자</div>
					<div class='td'>격리해제</div>
					<div class='td'>격리중</div>
					<div class='td'>사망</div>
				</div>
			</div>

			<div id='table2'>
				<div class='tr'>
					<div class='td'>누적</div>
					<div class='td'>전일대비</div>
					<div class='td'>누적</div>
					<div class='td'>전일대비</div>
					<div class='td'>누적</div>
					<div class='td'>전일대비</div>
					<div class='td'>누적</div>
					<div class='td'>전일대비</div>
				</div>
			</div>

			<div id='table3'>
				<div class='tr'>
					<div class='td'>123</div>		
					<div class='td'>
						<div class='tr'>
							<div class='td'>소계</div>
							<div class='td'>국내발생</div>
							<div class='td'>해외유입</div>
						</div>
						<div class='tr'>
							<div class='td'>123</div>
							<div class='td'>123</div>
							<div class='td'>123</div>
						</div>
					</div>
					
					<div class='td'>123</div>
					<div class='td'>123</div>
					<div class='td'>123</div>
					<div class='td'>123</div>
					<div class='td'>123</div>
					<div class='td'>123</div>
				</div>
			</div>
		</div>

		<div id='test'>
			<h3>- 누적 검사 현황</h3>
			
			<div id='table4'>
				<div class='tr'>
					<div class='td'>
						<div class='tr'>
							<a style="position:absolute; transform: translate(190%, 17%);">검사완료</a>
						</div>
						<div class='tr'>
							<div class='td'>
								<div class='tr'>
									<a style="position:absolute; transform: translate(242%, 17%);">확진환자수</a>
								</div>
								<div class='tr'>
									<div class='td'>격리중</div>
									<div class='td'>격리해제</div>
									<div class='td'>사망</div>
									<div class='td'>소계</div>
								</div>
							</div>
							<div class='td'>결과음성</div>
							<div class='td'>소계</div>
						</div>
					</div>

					<div class='td'>검사중</div>
					<div class='td'>합계</div>
				</div>
			</div>

			<div id='table5'>
				<div class='tr'>
					<div class='td'>125</div>
					<div class='td'>125</div>
					<div class='td'>125</div>
					<div class='td'>125</div>
					<div class='td'>125</div>
					<div class='td'>125</div>
					<div class='td'>125</div>
					<div class='td'>125</div>
				</div>
			</div>
		</div>



		<div id='patientGraph'>

			<h3>- 일일 및 누적 확진환자 추세</h3>
			<div id ='chart1' ></div>
		</div>



		<div id='cumulativeGraph'>

			<h3>- 확진환자 내 일일 및 누적 격리해제 추세</h3>
			<div id ='chart2' ></div>
		</div>



		<div id='gender'>

			<h3>- 확진자 성별 현황</h3>
			<div id='table6'>
				<div class='tr'>
					<div class='td'>구분</div>
					<div class='td'>확진자(%)</div>
					<div class='td'>사망자(%)</div>
					<div class='td'>치명률(%)</div>
				</div>
				
				<div class='tr'>
					<div class='td'>여자</div>
					<div class='td'>131</div>
					<div class='td'>131</div>
					<div class='td'>131</div>
				</div>
				
				<div class='tr'>
					<div class='td'>남자</div>
					<div class='td'>131</div>
					<div class='td'>131</div>
					<div class='td'>131</div>
				</div>
			</div>
		</div>



		<div id='age'>

			<h3>- 확진자 연령별 현황</h3>
			<div id='table7'>
				<div class='tr'>
					<div class='td'>구분</div>
					<div class='td'>확진자(%)</div>
					<div class='td'>사망자(%)</div>
					<div class='td'>치명률(%)</div>
				</div>
				
				<div class='tr'>
					<div class='td'>80 이상</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
				</div>
				
				<div class='tr'>
					<div class='td'>70-79</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
				</div>
				
				<div class='tr'>
					<div class='td'>60-69</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
				</div>
				
				<div class='tr'>
					<div class='td'>50-59</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
				</div>
				
				<div class='tr'>
					<div class='td'>40-49</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
				</div>
				
				<div class='tr'>
					<div class='td'>30-39</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
				</div>
				
				<div class='tr'>
					<div class='td'>20-29</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
				</div>
				
				<div class='tr'>
					<div class='td'>10-19</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
				</div>
				
				<div class='tr'>
					<div class='td'>0-9</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
					<div class='td'>232</div>
				</div>
			</div>
		</div>
		
		<br/>
		<br/>
	</div>

</body>

</html>