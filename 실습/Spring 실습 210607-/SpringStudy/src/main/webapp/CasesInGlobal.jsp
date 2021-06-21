<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale = 1.0' />
<title>국외 발생 현황</title>

<style>

/* css- 확진자 성별 현황 , 연령별 현황*/
#table6 *, #table7 * {
	box-sizing: border-box;
	vertical-align: middle;
	text-align: center;
}

#table6, #table7 {
	display: table;
	width: 1250px;
	border-spacing: 0;
	margin: 0px;
	padding: 0px;
}

#table6 .tr, #table7 .tr {
	display: table-row;
	height: 30px;
}

#table6 .td, #table7 .td {
	display: table-cell;
	border: 1px solid;
}

#table6 .td:first-child {
	width: 698px;
	border-right: 0px;
}

#table6 .td:last-child {
	width: 550px;
}

#table7>.tr>.td {
	width: 300px;
	border-top: 0px;
}

#table7>.tr>.tr>.td:first-child {
	width: 400px;
	border-top: 0px;
	border-left: 0px;
}

#table7>.tr>.tr>.td:last-child {
	width: 550px;
	border-top: 0px;
	border-left: 0px;
}
</style>

</head>

<body>

	<h1>국외 발생 현황</h1>

	<div id='cases'>

		<div id='global'>

			<h3>- 전체 국가 발생 현황</h3>
			<div id='table6'>
				<div class='tr'>
					<div class='td'>지역 및 국가</div>
					<div class='td'>환자발생 수 (사망)</div>
				</div>
			</div>

			<div id='table7'>
				<div class='tr'>
					<div class='td'>아시아</div>
					<div class='tr'>
						<div class='td'>중국</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>홍콩</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>대만</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>마카오</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>일본</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>싱가포르</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
				</div>

				<div class='tr'>
					<div class='td'>중동</div>
					<div class='tr'>
						<div class='td'>이란</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>바레인</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>이집트</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>이라크</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>요르단</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>쿠웨이트</div>
						<div class='td'>157894</div>
					</div>
				</div>

				<div class='tr'>
					<div class='td'>아메리카</div>
					<div class='tr'>
						<div class='td'>미국</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>캐나다</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>멕시코</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>파나마</div>
						<div class='td'>157894</div>
					</div>
					<div class='tr'>
						<div class='td'>온두라스</div>
						<div class='td'>157894</div>
					</div>
					<div class='tr'>
						<div class='td'>과테말라</div>
						<div class='td'>157894</div>
					</div>
				</div>

				<div class='tr'>
					<div class='td'>유럽</div>
					<div class='tr'>
						<div class='td'>이탈리아</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>독일</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>프랑스</div>
						<div class='td'>157,894명 (사망 4,636)</div>
					</div>
					<div class='tr'>
						<div class='td'>영국</div>
						<div class='td'>157894</div>
					</div>
					<div class='tr'>
						<div class='td'>스페인</div>
						<div class='td'>157894</div>
					</div>
					<div class='tr'>
						<div class='td'>오스트리아</div>
						<div class='td'>157894</div>
					</div>
				</div>
			</div>
		</div>


		<br /> <br />
	</div>

</body>

</html>