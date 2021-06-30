/**
 * 
 */
drawChart = function(chartId,kJson){
	var arrDate = [];
	var arrTodayDecide = []; 
	var arrDecide = []; 
	for(var i=0; i<7; i++){
		var j = 6-i;
		arrTodayDecide[j]= kJson[i].todayDecide;
		arrDecide[j] = kJson[i].decideCnt;
		var day = kJson[i].stdDay
		arrDate[j] = day.substring(0,4)+"."+day.substring(4,6)+"."+day.substring(6,8);
	}
	console.log(arrDecide);
	
	
	
new Chart(document.getElementById(chartId), {
	type: 'bar',
	data: {
		labels: arrDate,
		datasets: [
			{
				type : 'line',
				yAxisID: 'TodayDecide',
				label: "Population (millions)",
				borderColor:"#3e95cd",
				data: arrTodayDecide,
				fill: false
			},
			{
				label: "Population (millions)",
				yAxisID: 'Decide',
				backgroundColor:"#e8c3b9",
				data: arrDecide,
			}
		]

	},
	options: {
		responsive: false,
		legend: { display: false },
		scales: {
				yAxes: [{
					id: 'Decide',
					position: 'left',
					ticks: {
						min: 0,
						max: 160000,
						fontSize : 14,
						userCallback: function(value, index, values){
							value = value.toString();
							value = value.split(/(?=(?:...)*$)/);
							value = value.join(',');
							
							return value;
						}
						
					}
				},{
					id: 'TodayDecide',
					position: 'right',
					ticks: {
						min: 0,
						max: 1100,
						fontSize : 14,
						userCallback: function(value, index, values){
							value = value.toString();
							value = value.split(/(?=(?:...)*$)/);
							value = value.join(',');
							
							return value;
						}
					}
				}]
			}
	}
});
}